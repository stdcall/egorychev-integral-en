"""Check the axioms of each declaration listed in validation/proofs.json."""
import json
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}
records = json.loads((ROOT / 'validation/proofs.json').read_text())
declarations = [name for proof in records for name in proof['declarations']]
source = '\n'.join('import ' + Path(p['file']).stem for p in records)
source += '\n' + '\n'.join('#print axioms ' + n for n in declarations)
with tempfile.NamedTemporaryFile(mode='w', suffix='.lean') as temporary:
    temporary.write(source)
    temporary.flush()
    result = subprocess.run(
        ['lake', 'env', 'lean', temporary.name], cwd=ROOT / 'validation/lean',
        text=True, capture_output=True, check=True)
output = result.stdout + result.stderr
assert 'warning:' not in output, output
for name in declarations:
    prefix = re.escape("'" + name + "'")
    match = re.search(prefix + r' depends on axioms:\s*\[([^\]]*)\]', output)
    if match:
        axioms = {a.strip() for a in match[1].split(',') if a.strip()}
        assert axioms <= ALLOWED, (name, axioms - ALLOWED)
    else:
        assert re.search(prefix + r' does not depend on any axioms', output), output
print(f'{len(declarations)} declarations: axiom audit passed')
