"""Build this setting, validate its navigation, and preserve PDF tags."""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

from check_lsp import check as check_lsp
from check_index import check as check_index
import fitz
from pypdf import PdfReader, PdfWriter
from pypdf.generic import ArrayObject, NameObject, NullObject

ROOT = Path(__file__).resolve().parents[1]
CONFIG = {"entry": "content/main.typ"}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args):
    env = dict(os.environ)
    env['TYPST_FONT_PATHS'] = str(ROOT / 'assets/fonts')
    env['TYPST_IGNORE_SYSTEM_FONTS'] = 'true'
    result = subprocess.run(args, cwd=ROOT, env=env, text=True,
                            capture_output=True)
    if result.returncode or 'warning:' in result.stderr:
        raise RuntimeError(result.stdout + result.stderr)
    return result.stdout


def format_sources(check=False):
    settings = json.loads((ROOT / '.vscode/settings.json').read_text())
    args = ['typstyle', '--line-width',
            str(settings['tinymist.formatterPrintWidth']), '--indent-width',
            str(settings['tinymist.formatterIndentSize']), '--wrap-text=fill',
            '--check' if check else '--inplace', 'content', 'validation']
    print(run(args).strip())


def lint():
    format_sources(check=True)
    problems = []
    for path in sorted((ROOT / 'content').rglob('*.typ')):
        text = path.read_text()
        for number, line in enumerate(text.splitlines(), 1):
            if len(line) > 80:
                problems.append(f'{path.name}:{number}: exceeds 80 columns')
            if re.search(r'[_^][^\W_]+\(', line):
                problems.append(f'{path.name}:{number}: ambiguous function script')
            if re.search(r'\)!=(?:frac\b|\()', line):
                problems.append(f'{path.name}:{number}: ambiguous factorial/inequality')
            # A q-shifted factorial can legitimately contain q^(...);q^A.
            # Only flag a code call or a standalone closing call delimiter.
            if re.search(r'(?:#[A-Za-z][\w.-]*\(.*|^\s*)\)\s*;', line):
                problems.append(f'{path.name}:{number}: semicolon after Typst call')
            if re.match(r'^\s*\d+\.\s+', line):
                problems.append(f'{path.name}:{number}: accidental list item')
        if '\ufffd' in text:
            problems.append(f'{path.name}: replacement character')
        if re.search(r'#bib-ref\(\s*(?:\d|"\d)', text):
            problems.append(f'{path.name}: numeric bibliography key')
        if re.search(r'#heading\([^)]*\)\[\s*(?:§?\d+[.\\]|[IVX]+\.)', text):
            problems.append(f'{path.name}: number written in heading title')
        if re.search(r'^\s*={1,3}\s+(?:§?\d+[.]|[IVX]+\.)', text, re.M):
            problems.append(f'{path.name}: number written in heading title')
        if re.search(r'^\s*[*_](?:Main\s+)?(?:Theorem|Lemma|Proposition|'
                     r'Corollary|Definition|Example|Problem|Rule|Remark)\s+\d',
                     text, re.M):
            problems.append(f'{path.name}: use a numbered statement environment')
        if re.search(r'^\s*\*\d+\.\d+\.\d+\.?\*', text, re.M):
            problems.append(f'{path.name}: use a problem environment')
        if re.search(r'#(?:eq|seq|section|chapter|heading|theorem|statement|supp)-ref\(', text):
            problems.append(f'{path.name}: use native @label references')
        if re.search(r'<(?:eq|sec|ch|th|lem|prop|def|prob|ex|rule|remark|supp):[^>]*\d[^>]*>', text):
            problems.append(f'{path.name}: use descriptive labels, not numbers')
        if re.search(r'#(?:eq|seq)\(\s*(?:"|\d)', text):
            problems.append(f'{path.name}: equation numbers come from counters')
    if problems:
        raise RuntimeError('\n'.join(problems))
    run(['tinymist', 'lint', CONFIG['entry'], '--root', str(ROOT)])


def object_bytes(obj):
    buffer = io.BytesIO()
    obj.write_to_stream(buffer)
    return buffer.getvalue()


def finalize(raw, staged):
    before = PdfReader(raw)
    writer = PdfWriter(raw, incremental=True)
    records = []

    def normalize(ref):
        while ref:
            node = ref.get_object()
            holder, key = node, '/Dest'
            if '/A' in node:
                holder, key = node['/A'].get_object(), '/D'
                assert holder['/S'] == '/GoTo'
            dest = holder[key]
            if isinstance(dest, str):
                dest = before.named_destinations[dest].dest_array
            assert len(dest) == 5 and str(dest[1]) == '/XYZ', dest
            holder[NameObject(key)] = ArrayObject([
                dest[0], NameObject('/XYZ'), NullObject(), dest[3], NullObject()])
            if node.get('/First'):
                normalize(node['/First'])
            ref = node.get('/Next')

    catalog = writer.root_object
    assert '/OpenAction' not in catalog
    assert '/StructTreeRoot' in catalog
    if '/Outlines' in catalog:
        normalize(catalog['/Outlines'].get('/First'))
    writer.write(staged)
    after = PdfReader(staged)

    def validate(items, depth=0):
        for item in items:
            if isinstance(item, list):
                validate(item, depth + 1)
                continue
            dest = item.dest_array
            assert len(dest) == 5 and dest[1] == '/XYZ'
            assert isinstance(dest[2], NullObject)
            assert isinstance(dest[4], NullObject)
            page = after.get_destination_page_number(item)
            assert page is not None and 0 <= page < len(after.pages)
            assert 0 <= float(dest[3]) <= float(after.pages[page].mediabox.top)
            records.append({'title': item.title, 'depth': depth,
                            'file_page': page + 1, 'pdf_top': float(dest[3]),
                            'left': None, 'zoom': None})

    validate(after.outline)
    assert len(before.pages) == len(after.pages)
    assert after.page_labels == before.page_labels
    assert '/StructTreeRoot' in after.trailer['/Root']
    assert after.trailer['/Root'].raw_get('/StructTreeRoot').idnum == (
        before.trailer['/Root'].raw_get('/StructTreeRoot').idnum)
    for a, b in zip(before.pages, after.pages):
        assert list(a.mediabox) == list(b.mediabox)
        assert list(a.cropbox) == list(b.cropbox)
        assert a.get('/Rotate', 0) == b.get('/Rotate', 0)
        assert a.get_contents().get_data() == b.get_contents().get_data()
        assert object_bytes(a['/Resources']) == object_bytes(b['/Resources'])
        assert len(a.get('/Annots', [])) == len(b.get('/Annots', []))
    with fitz.open(staged) as pdf:
        raster = sum(len(page.get_images()) for page in pdf)
        assert raster == 0
        all_text = ''.join(page.get_text() for page in pdf)
        assert '\ufffd' not in all_text
        for page in pdf:
            for link in page.get_links():
                if link['kind'] == fitz.LINK_GOTO:
                    assert 0 <= link['page'] < len(pdf)
    return {'pages': len(after.pages), 'bookmarks': records,
            'page_labels': after.page_labels, 'raster_images': raster,
            'page_streams_geometry_and_resources_preserved': True,
            'tag_structure_reference_preserved': True,
            'viewer_zoom_test': 'not performed; destinations checked structurally'}


def check_sources():
    editorial_keys = re.findall(
        r'@\w+\{([^,]+),', (ROOT / 'editorial.bib').read_text())
    assert len(editorial_keys) == len(set(editorial_keys))
    assert all(re.fullmatch(r'[A-Za-z]+\d{4}[a-z]?', key)
               for key in editorial_keys), 'Use short AuthorYear bibliography keys'
    entries = json.loads((ROOT / 'corrections.json').read_text())
    assert [e['id'] for e in entries] == [
        f'E{i:03d}' for i in range(1, len(entries) + 1)]
    for entry in entries:
        for field in ('printed_page', 'location', 'original', 'corrected', 'reason'):
            assert entry[field], (entry['id'], field)
        for field, value in entry.items():
            if not isinstance(value, str):
                continue
            prose = re.sub(r'\$[^$]*\$', '', value)
            joined = re.search(
                r'\b(?:Section|Theorem|Lemma|Corollary|Problem|Formula|Chapter|'
                r'Proposition|Definition|to|at|from|equal to)(?=\d)',
                prose, re.IGNORECASE)
            assert not joined, (entry['id'], field, joined.group())
    for proof in json.loads((ROOT / 'validation/proofs.json').read_text()):
        assert sha(ROOT / proof['file']) == proof['sha256'], proof['file']
        for path, expected in proof['content_sha256'].items():
            assert sha(ROOT / path) == expected, (
                f'{path}: review the correspondence with {proof["file"]} '
                'and update validation/proofs.json')


def metadata(notes):
    return json.loads(run([
        'typst', 'eval', 'query(metadata)', '--in', CONFIG['entry'],
        '--root', str(ROOT), '--input', f'editorial-notes={notes}',
        '--format', 'json']))


def check_metadata(notes):
    values = [item['value'] for item in metadata(notes)
              if isinstance(item.get('value'), dict)]
    references = [v for v in values if v.get('kind') == 'cross-reference']
    assert references, 'No cross-references found'
    assert all(v['resolved'] for v in references), [
        v for v in references if not v['resolved']]
    footnotes = [v for v in values if v.get('kind') == 'editorial-note']
    assert len({v['id'] for v in footnotes}) == len(footnotes)
    assert [v['number'] for v in footnotes] == list(range(1, len(footnotes) + 1))
    if notes == 'off':
        assert not footnotes
    expected = json.loads((ROOT / 'validation/numbering.json').read_text())
    bibliography = [v for v in values if v.get('kind') == 'bibliography-entry']
    assert len({v['key'] for v in bibliography}) == len(bibliography)
    assert all(re.fullmatch(r'[A-Za-z]+\d{4}[a-z]?', v['key'])
               for v in bibliography), 'Use short AuthorYear bibliography keys'
    assert [(v['key'], v['number']) for v in bibliography] == list(
        expected['bibliography'].items()), 'Original bibliography numbering changed'
    headings = json.loads(run([
        'typst', 'eval',
        'query(heading).filter(h => h.numbering != none).map(h => '
        '(label: str(h.label), number: numbering(h.numbering, '
        '..counter(heading).at(h.location()))))',
        '--in', CONFIG['entry'], '--root', str(ROOT),
        '--input', f'editorial-notes={notes}', '--format', 'json']))
    assert len({h['label'] for h in headings}) == len(headings)
    assert {h['label']: h['number'] for h in headings} == expected['headings'], (
        'Heading numbering differs from the original edition')
    statements = statement_numbers(CONFIG['entry'], {'editorial-notes': notes})
    assert statements == expected['statements'], 'Statement numbering changed'
    numbers = {s['label']: s['number'] for s in statements}
    statement_refs = [v for v in values if v.get('kind') == 'statement-reference']
    assert all(v['number'] == numbers[v['target']] for v in statement_refs)
    equations = equation_numbers(CONFIG['entry'], {'editorial-notes': notes})
    assert equations == expected['equations'], 'Equation numbering changed'
    numbers = {key: value[0] for key, value in equations.items()}
    aliases = json.loads(run([
        'typst', 'eval',
        '{ import "content/equations.typ": equation-at; '
        'query(metadata).filter(m => type(m.value) == dictionary and '
        'm.value.at("kind", default: none) == "equation-alias").map(m => '
        '(label: str(m.label), number: equation-at(m.label).number)) }',
        '--in', CONFIG['entry'], '--root', str(ROOT), '--format', 'json',
        '--input', f'editorial-notes={notes}']))
    aliases = {a['label']: a['number'] for a in aliases}
    assert aliases == expected['equation_aliases']
    numbers.update(aliases)
    equation_refs = [v for v in values if v.get('kind') == 'equation-reference']
    assert all(v['number'] == numbers[v['target']] for v in equation_refs)
    links = json.loads(run([
        'typst', 'eval', 'query(link).filter(l => type(l.dest) == label)'
        '.map(l => (target: str(l.dest), resolved: query(l.dest).len() == 1))',
        '--in', CONFIG['entry'], '--root', str(ROOT), '--format', 'json',
        '--input', f'editorial-notes={notes}']))
    assert all(link['resolved'] for link in links), 'Unresolved link'
    return {'cross_references': len(references), 'editorial_notes': len(footnotes),
            'bibliography_entries': len(bibliography),
            'numbered_headings': len(headings),
            'numbered_statements': len(statements),
            'statement_references': len(statement_refs),
            'numbered_equations': len(equations),
            'equation_references': len(equation_refs),
            'label_links': len(links)}


def equation_numbers(entry, inputs=None):
    # Read the numbers emitted by the display, independently of reference code.
    expression = '''query(math.equation).filter(e => e.has("label")).map(e => {
      let m = query(selector(metadata).after(e.location())).find(m =>
        type(m.value) == dictionary and m.value.at("kind", default: none)
          == "equation-number")
      (label: str(e.label), numbers: m.value.numbers)
    })'''
    args = ['typst', 'eval', expression, '--in', entry, '--root', str(ROOT),
            '--format', 'json']
    for key, value in (inputs or {}).items():
        args += ['--input', f'{key}={value}']
    rows = json.loads(run(args))
    assert len({row['label'] for row in rows}) == len(rows)
    return {row['label']: row['numbers'] for row in rows}


def statement_numbers(entry, inputs=None):
    # Read the number emitted with each rendered statement, independently of
    # the reference helper and of the expected-number fixture.
    expression = '''query(figure.where(kind: "statement")).map(f => {
      let m = query(selector(metadata).after(f.location())).find(m =>
        type(m.value) == dictionary and m.value.at("kind", default: none)
          == "statement").value
      (label: if f.has("label") { str(f.label) } else { none },
       kind: m.supplement, number: m.number)
    }).filter(s => s.number != none)'''
    args = ['typst', 'eval', expression, '--in', entry, '--root', str(ROOT),
            '--format', 'json']
    for key, value in (inputs or {}).items():
        args += ['--input', f'{key}={value}']
    return json.loads(run(args))


def check_statement_counters():
    expected = {
        'first': '1.1.1', 'lemma': '1.1.1', 'later': '1.1.2',
        'rule-first': '1', 'rule-next': '1', 'section-next': '1.2.1',
        'def': '1.1.1', 'supp-first': '1', 'supp-prop': '2',
        'supp-cor': '3', 'supp-lemma': '1', 'supp-next': '1',
        'open-first': '1', 'open-sub': '1.1',
        'open-next': '2', 'open-sub-next': '2.1',
    }
    entry = 'validation/statement-counters.typ'
    for insert in ('off', 'on'):
        if insert == 'on':
            expected['later'] = '1.1.3'
        actual = {s['label']: s['number'] for s in statement_numbers(
            entry, {'insert': insert}) if s['label'] is not None}
        assert actual == expected, (insert, actual)
        data = json.loads(run(['typst', 'eval', 'query(metadata)', '--in', entry,
                               '--root', str(ROOT), '--format', 'json',
                               '--input', f'insert={insert}']))
        refs = [m['value'] for m in data if isinstance(m['value'], dict)
                and m['value'].get('kind') == 'statement-reference']
        numbered_refs = [r for r in refs if r['number'] is not None]
        assert len(numbered_refs) == 2
        assert all(r['number'] == expected['later'] for r in numbered_refs)
        with tempfile.TemporaryDirectory(prefix='statement-counters-') as folder:
            pdf = Path(folder) / 'statements.pdf'
            run(['typst', 'compile', '--root', str(ROOT), '--input',
                 f'insert={insert}', entry, str(pdf)])
            with fitz.open(pdf) as document:
                text = re.sub(r'\s+', '', ''.join(p.get_text() for p in document))
            for sentinel in ('FLOWFIRSTEND', 'FLOWSECONDEND', 'FLOWTHIRDEND'):
                assert sentinel in text, 'Long statement was clipped'
            number = expected['later']
            assert f'BothTheorem{number}andTheorem{number}refertothisstatement.' in text


def check_equation_counters():
    entry = 'validation/equation-counters.typ'
    for insert in ('off', 'on'):
        shift = int(insert == 'on')
        expected = {
            'algorithm': ['1'], 'first': ['1.1'], 'star': ['*'],
            'variant': [f'1.{2 + shift}′'], 'later': [f'1.{2 + shift}'],
            'pair': [f'1.{3 + shift}', f'1.{4 + shift}'],
            'after-pair': [f'1.{5 + shift}'],
            'next-section': [f'1.{6 + shift}'],
            'leading-star': ['**'], 'next-chapter': ['2.1'],
            'supp-first': ['1'], 'supp-next': ['2'], 'supp-variant': ['1′'],
        }
        assert equation_numbers(entry, {'insert': insert}) == {
            'eq:' + key: value for key, value in expected.items()}
        with tempfile.TemporaryDirectory(prefix='equation-counters-') as folder:
            pdf = Path(folder) / 'equations.pdf'
            run(['typst', 'compile', '--root', str(ROOT), '--input',
                 f'insert={insert}', entry, str(pdf)])
            with fitz.open(pdf) as document:
                text = re.sub(r'\s+', '', ''.join(p.get_text() for p in document))
            assert (f'Forwardreference(1.{2 + shift});itsvariantis'
                    f'(1.{2 + shift}′).') in text
            assert 'Earlierformula(1.1)belongstoChapter1,§1.1.' in text
            assert (f'Thepairis(1.{3 + shift})and(1.{4 + shift});nextis'
                    f'(1.{5 + shift}).') in text
            assert 'Supplementreferences(1),(2)and(1′).' in text


def build(notes='on'):
    check_sources()
    lint()
    check_statement_counters()
    check_equation_counters()
    check_index(ROOT, run)
    check_lsp()
    assert '0.15.1' in run(['typst', '--version'])
    output = ROOT / 'build'
    output.mkdir(exist_ok=True)
    reports = {}
    with tempfile.TemporaryDirectory(prefix='egorychev-') as folder:
        temporary = Path(folder)
        for kind, entry, name in [
            ('book', CONFIG['entry'], 'egorychev-integral-en.pdf'),
            ('corrections', 'content/corrections.typ',
             'egorychev-integral-en.corrections.pdf')
        ]:
            raw = temporary / (kind + '.pdf')
            checked = temporary / (kind + '-checked.pdf')
            run(['typst', 'compile', '--root', str(ROOT), '--input',
                 f'editorial-notes={notes}', entry, str(raw)])
            reports[kind] = finalize(raw, checked)
            staged = output / (name + '.tmp')
            shutil.copyfile(checked, staged)
            staged.replace(output / name)
    reports['references'] = check_metadata(notes)
    reports['without_editorial_notes'] = check_metadata('off')
    (output / 'checks.json').write_text(json.dumps(reports, indent=2) + '\n')
    (output / 'SHA256SUMS').write_text(''.join(
        f'{sha(p)}  {p.name}\n' for p in sorted(output.glob('*.pdf'))))
    print(json.dumps({kind: {'pages': reports[kind]['pages'],
                            'bookmarks': len(reports[kind]['bookmarks'])}
                      for kind in ('book', 'corrections')}, indent=2))
    print(json.dumps(reports['references']))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['build', 'check', 'fmt', 'lint'])
    parser.add_argument('--editorial-notes', choices=['on', 'off'], default='on')
    args = parser.parse_args()
    if args.command == 'fmt':
        format_sources()
    elif args.command == 'lint':
        lint()
        check_sources()
    else:
        build(args.editorial_notes)
