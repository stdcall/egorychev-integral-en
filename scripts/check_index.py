"""Check the accepted index and marks added or moved by an editor."""
import json
from pathlib import Path
import tempfile

import fitz


def entries(run, entry, *inputs):
    return json.loads(run([
        'typst', 'eval',
        'query(metadata).filter(m => type(m.value) == dictionary and '
        'm.value.at("kind", default: none) == "index-entry").map(m => m.value)',
        '--in', entry, '--root', '.', '--format', 'json', *inputs]))


def check(root, run):
    source = (root / 'content/subject-index.typ').read_text()
    assert '#subject-index()' in source
    assert '#index-entry(' not in source and '#index-mark(' not in source
    actual = entries(run, 'content/main.typ')
    keys = [(e['group'], e['term']) for e in actual]
    assert len(keys) == len(set(keys)), 'Duplicate printed index entry'
    # This fixture protects accepted terms, not the universe of allowed terms.
    # An editor can add a new term or occurrence without changing this file.
    expected = json.loads((root / 'validation/subject-index.json').read_text())
    cursor = -1
    for item in expected:
        key = (item['group'], item['term'])
        index = keys.index(key)
        assert index > cursor, ('Accepted index order changed', key)
        cursor = index
        assert set(item['targets']) <= set(actual[index]['targets']), key
    for item in actual:
        assert item['pages'] == sorted(set(item['pages'])), item
        assert len(item['destinations']) >= len(item['pages']), item

    entry = 'validation/subject-index.typ'
    for insert in ('off', 'on'):
        options = ['--input', f'insert={insert}']
        data = entries(run, entry, *options)
        by_name = {e['term']: e for e in data}
        second_page = 3 if insert == 'on' else 2
        assert by_name['Alpha']['pages'] == [1, second_page]
        assert by_name['Zebra']['pages'] == [second_page]
        assert [e['term'] for e in data if e['group'] == 'Cases'] == [
            'Zebra', 'Alpha']
        assert by_name['Unlisted term']['pages'] == [1]
        symbols = [e for e in data if e['group'] == 'Symbols']
        assert len(symbols) == 2 and symbols[0]['term'] != symbols[1]['term']
        assert ('New term' in by_name) == (insert == 'on')
        if insert == 'on':
            assert by_name['New term']['pages'] == [2]
        with tempfile.TemporaryDirectory(prefix='subject-index-') as folder:
            pdf = Path(folder) / 'index.pdf'
            run(['typst', 'compile', '--root', '.', entry, str(pdf), *options])
            with fitz.open(pdf) as document:
                page = document[-1]
                text = page.get_text()
                assert f'Alpha, 1, {second_page}' in text
                links = [l for l in page.get_links() if l['kind'] == fitz.LINK_GOTO]
                assert sorted(l['page'] + 1 for l in links) == sorted(
                    [1, 1, 1, 1, second_page, second_page]
                    + ([2] if insert == 'on' else []))
                for link in links:
                    words = document[link['page']].get_text('words')
                    assert any(abs(word[1] - link['to'].y) < 20 for word in words)
    print(f'Subject index: {len(actual)} terms; insertion, links and deduplication passed')
