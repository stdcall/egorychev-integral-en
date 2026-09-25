set shell := ["bash", "-euo", "pipefail", "-c"]

build:
    uv run --locked python scripts/build.py build

pdf: build

check:
    uv run --locked python scripts/build.py check

fmt:
    uv run --locked python scripts/build.py fmt

lint:
    uv run --locked python scripts/build.py lint

build-no-notes:
    uv run --locked python scripts/build.py build --editorial-notes off

check-lean:
    cd validation/lean && lake build && lake env leanchecker --fresh EgorychevChecks
    python3 scripts/check_axioms.py
