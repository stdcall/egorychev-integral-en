#import "book-style.typ": book-style, supplement-numbering, table-numbering
#import "main-defs.typ": source
#import "editorial-notes.typ": editorial-notes
#import "frontmatter/cover.typ": cover

#set document(
  title: "Integral Representation and the Computation of Combinatorial Sums",
  author: "G. P. Egorychev",
  date: none,
)
#cover()
#show: book-style
#counter(page).update(1)
#set page(numbering: "i")
#source(5, "iii")
#v(15mm)
#align(center)[
  #text(size: 12pt)[
    TRANSLATIONS OF MATHEMATICAL MONOGRAPHS\
    VOLUME 59
  ]
  #v(25mm)
  #text(size: 26pt, weight: "semibold")[
    Integral Representation\
    and the Computation\
    of Combinatorial Sums
  ]
  #v(18mm)
  #text(size: 17pt)[G. P. EGORYCHEV]
  #v(16mm)
  Translated from the Russian by H. H. McFaden\
  Translation edited by Lev J. Leifman
  #v(1fr)
  American Mathematical Society\
  Providence, Rhode Island\
  1984
]
#pagebreak()
#include "frontmatter/publication.typ"
#pagebreak()
#heading(level: 1, outlined: false)[Contents]
#outline(title: none, depth: 3)
#pagebreak()
#include "00-foreword.typ"
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)
#include "00-introduction.typ"
#pagebreak()
#set heading(numbering: "1.")
#include "01-method.typ"
#include "01-02-res.typ"
#include "01-03-complex.typ"
#include "01-04-main.typ"
#include "01-05-finite.typ"
#include "01-05-carlitz.typ"
#include "01-05-bergman.typ"
#include "01-06-operations.typ"
#include "01-06-recurrence.typ"
#include "01-07-history.typ"
#pagebreak()
#include "02-introduction.typ"
#include "02-01-linearity.typ"
#include "02-01-substitution.typ"
#include "02-01-inversion.typ"
#include "02-01-various.typ"
#include "02-01-stechkin.typ"
#include "02-01-stirling.typ"
#include "02-01-subgroups.typ"
#include "02-02-integral.typ"
#include "02-02-classification.typ"
#include "02-02-examples.typ"
#include "02-02-product-integral.typ"
#include "02-02-asymptotic.typ"
#include "02-03-definitions.typ"
#include "02-03-classical.typ"
#include "02-03-andrews.typ"
#include "02-03-moriarty.typ"
#include "02-03-q-moriarty.typ"
#include "02-03-dawson.typ"
#include "02-04-problems-binomial.typ"
#include "02-04-problems-numbers.typ"
#include "02-04-problems-selection.typ"
#include "02-04-problems-various.typ"
#include "02-04-problems-final.typ"
#pagebreak()
#include "03-introduction.typ"
#include "03-01-matrices.typ"
#include "03-02-liskovets.typ"
#include "03-02-inverse-pairs.typ"
#include "03-02-classification.typ"
#include "03-03-multidimensional.typ"
#include "03-04-problems-chebyshev.typ"
#include "03-04-problems-legendre.typ"
#include "03-04-problems-abel-ordinary.typ"
#include "03-04-problems-exponential.typ"
#include "03-04-problems-summation.typ"
#pagebreak()
#include "04-opening.typ"
#include "04-01-reduced.typ"
#include "04-02-interpretations.typ"
#include "04-02-stirling-batches.typ"
#include "04-02-hypertrees.typ"
#include "04-03-tournaments.typ"
#include "04-03-ranks.typ"
#include "04-03-chess.typ"
#include "04-04-tauberian.typ"
#include "04-04-good.typ"
#include "04-04-matrix-selection.typ"
#include "04-04-lattice-paths.typ"
#include "04-04-colorings.typ"
#include "04-05-problems-symmetry.typ"
#include "04-05-problems-arrays.typ"
#include "04-05-problems-numbers.typ"
#include "04-05-problems-ordering.typ"
#include "04-05-problems-final.typ"
#pagebreak()
#include "05-dixon.typ"
#include "05-01-dyson.typ"
#include "05-01-carlitz-double.typ"
#include "05-01-cycles.typ"
#include "05-01-carlitz-identity.typ"
#include "05-01-weighted-sum.typ"
#include "05-01-bilinear-sum.typ"
#include "05-02-linear-corollaries.typ"
#include "05-02-linear-proofs.typ"
#include "05-03-splitting.typ"
#include "05-04-splitting-lemma.typ"
#include "05-04-splitting-theorem.typ"
#include "05-04-splitting-sums.typ"
#include "05-05-system.typ"
#include "05-05-lee.typ"
#include "05-06-problems-binomial.typ"
#include "05-06-problems-nested.typ"
#include "05-06-problems-final.typ"
#pagebreak()
#include "06-01-szego.typ"
#include "06-01-szego-formulas.typ"
#include "06-01-szego-lemmas.typ"
#include "06-01-szego-logarithmic.typ"
#include "06-01-szego-contours.typ"
#include "06-01-szego-examples.typ"
#include "06-01-szego-nested.typ"
#include "06-02-bounded-kernels.typ"
#include "06-03-solvable-ranks.typ"
#include "06-03-polynilpotent.typ"
#include "06-04-p-central.typ"
#pagebreak()
#include "07-open-problems.typ"
#pagebreak()
#counter(heading).update((0, 0))
#set heading(numbering: supplement-numbering)
#include "supp-01-forms.typ"
#include "supp-01-stokes.typ"
#include "supp-02-alexander.typ"
#include "supp-02-derham.typ"
#include "supp-02-leray.typ"
#include "supp-03-local.typ"
#include "supp-04-logarithmic.typ"
#include "supp-04-torus.typ"
#include "supp-05-implicit.typ"
#include "supp-05-inverse.typ"
#include "supp-05-coefficients.typ"
#include "supp-05-branch.typ"
#include "supp-05-examples.typ"
#counter(heading).update((0, 0))
#set heading(numbering: table-numbering)
#include "app-table-m.typ"
#set heading(numbering: none)
#include "original-bibliography.typ"
#include "subject-index.typ"
#if editorial-notes { include "editorial-bibliography.typ" }
