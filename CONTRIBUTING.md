# Building and changing the edition

Use Typst 0.15.1, Typstyle 0.15.1, Tinymist 0.15.8, Python 3.12 and uv.
Fonts and their licenses are included in `assets/fonts`.

```sh
uv sync --locked
uv run --locked python scripts/build.py check
```

The book, corrections and checksums are written to `build/`. The build checks
formatting, cross-references, editorial note numbering and PDF navigation.
Bookmarks retain the reader's current zoom. To omit editorial footnotes, add
`--editorial-notes off`; running the regular build restores them.

Submit changes through a pull request. Both PDF and Lean checks must pass;
pull requests are merged with squash. Each commit on `main` produces a release
containing both PDFs and their SHA-256 checksums.

Keep Typst lines within 80 columns. Run `python scripts/build.py fmt` to
format them. Record corrections in `corrections.json`, with the printed
reading, replacement, page and reason. Editorial footnotes belong inline
at the relevant passage and should add something useful beyond the text.

Use short bibliography keys such as `Abramson1966` and `Carlitz1973a`.
Keep assigned keys stable when adding or reordering entries. Citation numbers
are calculated separately; the original bibliography retains its order and
the explicit `58a` and `58b` exceptions. Its formatted entries preserve the
author's notes and compound references; editorial references use BibLaTeX.

Heading numbers come from Typst counters, including the separate numbering
of the Supplement and Table M. Leave numbers out of heading titles and obtain
reference numbers from the target heading. Use stable descriptive labels,
such as `<sec:bounded-kernels>`. Declare unnumbered introductions
and other exceptions explicitly. `validation/numbering.json` checks the
original numbering independently; it does not supply numbers to the text.

Use statement environments, for example `#theorem[... ] <descriptive-label>`,
instead of typing a heading and number. Put the whole statement inside the
environment. `theorem`, `lemma`, `proposition` and `definition` have separate
counters within each section. In the Supplement, import `supp-statements.typ`:
theorems, propositions and corollaries share a counter; lemmas remain separate.
Examples, problems and rules have their own counters. Use `numbered: false`
for an unnumbered statement and `name: [...]` for a named one. Preserve the
explicit prefix exception for Definitions 1.1.1 and 1.1.2 in Section 1.2.

Use native references: `@eq:bergman-series`, `@sec:bounded-kernels`,
`@th:szego-general-series`. Write `@th:szego-general-series[]` for the number
alone, or `@ch:applications[Chapter]` for a chapter reference. Use
`#link(<label>)[description]` for descriptive links. Keep labels next to their
targets; do not hide references or labels inside string-based wrappers. The
global `show ref` rule handles appearance. The build registers
`content/main.typ` with Tinymist, and the VS Code settings select it when a
chapter is opened. The generated `tinymist.lock` and dependency cache are
local; run the build once on each machine and after adding chapters. With
the repository inside a larger workspace, enable
`tinymist.projectResolution: "lockDatabase"` in that workspace's settings.

Numbered displays use `#eq($ ... $) <eq:descriptive-name>`. Their counter
restarts in each chapter. The computation algorithm has a separate series;
`#seq` in the Supplement counts continuously across sections. A primed formula
uses `variant: <eq:base-label>`; a symbolic mark uses `mark: "*"`.
Neither advances the ordinary counter. The combined Lee formula explicitly
uses `count: 2` and an alias for its second number.

The build compares all heading, statement and equation numbers with the
accepted setting. It tests insertion, references across chapters, variants,
counter resets and shared counters, and checks Tinymist definition targets.
Update the numbering fixture only for an intentional numbering change.

The subject index is generated from `index-mark` calls beside the indexed
passages. For example, `#index-mark([@eq:abel-identity], group:
[Identities])[Abel]` records the term at that formula; the native reference
keeps editor navigation available. Use `none` instead of a reference to index
the mark's own position. Repeat a mark at each relevant passage. The generator
merges entries and repeated pages, and computes page numbers and PDF links.
Do not maintain a separate list of index entries in `subject-index.typ`.

Terms and groups sort alphabetically, ignoring accents and hyphens. Preserve
the author's conceptual exceptions with `after: [Previous term]` on the mark;
do not assign ordinal sorting numbers. `sort` accepts a textual sorting key
when mathematical notation needs one. The optional `major: true` preserves
the original emphasis of a top-level article. Marks for one article must agree
on these options. Tests retain the accepted index as a subset and check that
new marks and inserted pages automatically change the generated output.

Lean proofs are in `validation/lean`; their scope is described in the file
comments. They establish specific steps, not the correctness of the entire
book. `validation/proofs.json` lists, for each Lean file, its declarations and
the labels of the passages it checks; the build verifies that these labels
exist. When changing such a passage or proof, review their correspondence.

With elan installed, run:

```sh
cd validation/lean
lake exe cache get
lake build
lake env leanchecker --fresh EgorychevChecks
cd ../..
python3 scripts/check_axioms.py
```

Lean and Mathlib versions are fixed by `lean-toolchain` and `lakefile.toml`.
The axiom check allows only `propext`, `Classical.choice` and `Quot.sound`.
