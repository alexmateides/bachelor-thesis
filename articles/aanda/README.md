# A&A submission draft

Article draft derived from the thesis *Transformer-Based Classification of Astronomical
Light Curves*, prepared for **Astronomy & Astrophysics** (EDP Sciences).

## Build

```sh
./compile.sh            # -> aanda.pdf  (currently 8 pages)
./compile.sh referee    # -> aanda-referee.pdf, double-spaced
```

Follows the same pattern as `compile.sh` in the repository root: builds through
`latexmk` into a throwaway `.aux/` directory, which is removed afterwards so every run
is a full compilation. Unlike the thesis it uses `pdflatex` rather than `lualatex`, as
A&A expects, and `-emulate-aux-dir` so that `bibtex` can find the aux file.

A `Makefile` with `all` / `referee` / `clean` / `distclean` targets is also provided for
incremental builds that keep the intermediate files.

The repository-root `compile.sh` calls this script and moves the result to
`articles/aanda.pdf`, which is what the CI workflow publishes at
`/articles/aanda.pdf` on the site.

Requires a TeX distribution with `latexmk`, `bibtex`, `txfonts`, `booktabs`, `siunitx`,
`hyperref`. The A&A class is vendored here, so no extra installation is needed.

## Files

| File | Purpose |
| --- | --- |
| `compile.sh` | Build script, mirrors the root `compile.sh` |
| `aanda.tex` | The manuscript |
| `references.bib` | Bibliography, formatted for natbib + `aa.bst` |
| `figures/` | Figures, copied from `src/thesis/images/` |
| `aa.cls` | A&A document class, v9.0 |
| `aa.bst` | A&A BibTeX style (author-year) |
| `aa_example.tex` | Official demo article (`aa.dem`), kept for reference |
| `aadoc.pdf` | A&A class user's guide |
| `natnotes.pdf` | natbib quick reference |
| `readme.txt` | Upstream A&A package readme |

### Provenance of the class files

`www.aanda.org` and `ftp.edpsciences.org` both blocked automated download, so the class
files were taken from a mirror of the official package
(<https://github.com/bardsoftware/template-AA>), which carries **v9.0**. The current
upstream release is **v9.4**. Before submitting, replace `aa.cls`, `aa.bst`, and
`readme.txt` with the current `aa-package.zip` from
<https://www.aanda.org/for-authors> and rebuild. Nothing in `aanda.tex` depends on
version-specific macros, so this should be a drop-in swap.

`linenoaa.sty` (line numbering for the referee version) is not part of the mirror; take
it from the official package if the `referee` target needs it.

## Before submission

Items deliberately left open in the draft:

- **Author list and affiliations.** Currently A. Mateides (CTU FIT) and P. Škoda (CTU
  FIT / ASU CAS). Confirm order, ORCIDs, and the corresponding author; note that the
  email address was removed from `\institute`, and A&A needs one for the corresponding
  author.
- **`\acknowledgements`.** Funding sources and grant numbers are marked `TODO`.
- **Data availability.** The code URL is a placeholder; A&A requires a persistent
  identifier, so archive the release (e.g. Zenodo) and insert the DOI.
- **Keywords.** Must be drawn from the official A&A keyword list; the current five are
  plausible but should be checked against it.
- **Figures.** Sourced from the thesis at screen resolution. A&A wants vector formats
  (PDF/EPS) where possible — regenerate Figs. 1–6 from the plotting scripts at
  publication resolution.
- **Abstract.** 297 words, just under the 300-word limit the class enforces. Any
  addition will trip the `aa.cls` warning again.
- **Length.** 8 pages as built. A&A charges above the page limit associated with the
  chosen publication option; check the current threshold.

## Mapping from the thesis

| Article section | Thesis source |
| --- | --- |
| 1 Introduction | `01_introduction.tex` |
| 2 Data | `05_tess_light_curve_dataset.tex` §1–2, `06_...tex` §Training Dataset |
| 3 Preprocessing | `05_tess_light_curve_dataset.tex` §3 |
| 4 Method | `06_light_curve_classifiers.tex` §Methodology, Architecture, Phases 1 & 3 |
| 5 Results | `07_Results.tex` §1–2, `06_...tex` §Baseline, Phases 2–3 |
| 6 Discussion | `07_Results.tex` §2–3, `08_Conclusion.tex` §Viability |
| 7 Conclusions | `08_Conclusion.tex` |

The ECG transfer-learning experiment (thesis Ch. 4) and the astronomical/ML background
chapters (Ch. 2–3) are omitted as out of scope for a research article.
