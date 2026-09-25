"""Install the pinned Linux x86-64 typesetting tools for CI."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import tarfile
from urllib.request import urlretrieve

ROOT = Path(__file__).resolve().parents[1]
target = Path(os.environ['RUNNER_TEMP']) / 'typesetting'
target.mkdir()
for name, spec in json.loads((ROOT / 'config/tools.json').read_text()).items():
    download = target / (name + '.download')
    urlretrieve(spec['url'], download)
    assert hashlib.sha256(download.read_bytes()).hexdigest() == spec['sha256'], name
    if spec['archive']:
        extracted = target / (name + '-files')
        with tarfile.open(download) as archive:
            archive.extractall(extracted, filter='data')
        candidates = [p for p in extracted.rglob(name) if p.is_file()]
        assert len(candidates) == 1, candidates
        shutil.copyfile(candidates[0], target / name)
    else:
        download.rename(target / name)
    (target / name).chmod(0o755)
with open(os.environ['GITHUB_PATH'], 'a') as stream:
    stream.write(str(target) + '\n')
