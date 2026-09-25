#import "main-defs.typ": bib-ref, res, source

#source(55, "43")
#heading(level: 1)[
  Integral Representation and Computation of One-Dimensional Combinatorial Sums
] <ch:univariate-sums>
#heading(level: 2, numbering: none)[Introduction] <sec:univariate-introduction>

Summation formulas for combinatorial expressions—combinatorial identities—are
scattered throughout the extensive literature of mathematics and related
subjects. It is difficult to isolate combinatorial identities as an independent
object of study,#footnote[
  Some researchers doubt, in general, the legitimacy of isolating combinatorial
  identities outside their connection with the study of concrete objects.
] and equally difficult to classify methods of evaluating sums and investigate
their connections. In the Introduction to #bib-ref("Gould1972a"), Gould compares
the state of this subject with the situation that would exist in mathematical
analysis if tables of integrals had never been compiled.

To evaluate sums, investigators have had to use a wide range of methods:
combinatorial interpretations, including lattice-point enumeration; combinations
and permutations; mathematical induction; properties of binomial coefficients
and other combinatorial numbers; generating functions; operators and symbolic
methods such as Blissard's calculus; and, at the other end of the range,
difference and integro-differential equations, contour integrals and other tools
of mathematical analysis.

Riordan offers a pessimistic prognosis (#bib-ref("Riordan1968"), p. vii): “The
central fact developed is that identities are both inexhaustible and
unpredictable; the age-old dream of putting order in this chaos is doomed to
failure.”

Riordan's assessment does not seem entirely justified.

First, interpretations of certain classes of combinatorial identities with
fairly general properties have been found in recent #source(56, "44")work on the
foundations of combinatorial theory (see, for example, #bib-ref("Rota1969"),
#bib-ref("Rota1964"), #bib-ref("Goldman1970"), #bib-ref("Andrews1971"),
#bib-ref("Doubilet1972b"), #bib-ref("Doubilet1972a"), #bib-ref("Stanley1972"),
#bib-ref("Andrews1974"), #bib-ref("Andrews1975"), and
§@sec:rota-generating-functions). This progress has been broadened and
accelerated by numerous studies of enumeration methods and combinatorial
interpretations of particular identities.

Second, extensive collections of known identities, chiefly one-dimensional
identities involving binomial coefficients, appear in #bib-ref("Riordan1968"),
#bib-ref("Egorychev1974c"), #bib-ref("Kaucky1975"), #bib-ref("Knuth1969"),
#bib-ref("Stanley1972"), #bib-ref("Stanley1975"), and especially #bib-ref(
  "Gould1972a",
). To present this material systematically, the authors had to address the
problem of grouping identities.

The classification of identities involving binomial coefficients is an old,
difficult and still unsolved problem. The authors of #bib-ref("Riordan1968"),
#bib-ref("Gould1972a") and #bib-ref("Kaucky1975") often group identities
according to their connections with familiar ones; this principle structures the
exposition in #bib-ref("Kaucky1975"). Riordan also uses mutually inverse linear
relations to obtain and classify such identities. Gould's grouping principle in
#bib-ref("Gould1972a") appears the simplest and most convenient in practice:
identities are placed in tables of type $p \/ q$, where $p$ and $q$ count the
binomial factors in the numerator and denominator of the summand. For example,
$
  sum_(k=0)^n (-1)^k 2^(2k)
  frac(binom(n, k) binom(2k, k), binom(j+k, k))
$
is of type $2 \/ 1$. This principle cannot provide a satisfactory
classification, however: as Gould himself points out, the same identity may
belong to different tables, and some identities cannot be assigned a definite
type at all.

Bateman's proposal to use hypergeometric series systematically seems the most
fruitful approach to classifying one-dimensional identities with binomial
coefficients (see §@sec:hypergeometric-summation). In #bib-ref("Andrews1974"),
which deals in particular with evaluating and classifying sums involving
ordinary and $q$-binomial coefficients, Andrews gives a simple procedure for
reducing such identities, when possible, to identities for basic hypergeometric
functions. This approach reduces the evaluation of one-dimensional binomial sums
to the difficult problem of evaluating #source(57, "45")hypergeometric series in
closed form, for which a complete solution has not yet been found.

Once again, most investigators dealing with complicated expressions arising in
combinatorics aim to compile the largest possible collection of individual
summation formulas, whether they use formal power series, hypergeometric series
or residues. In the author's opinion, no adequate and complete tables of
$n$-fold summation formulas involving binomial coefficients and other
combinatorial numbers can be compiled, even for $n=2$. While retaining tables of
the most common formulas, we place the main emphasis on methods for evaluating
sums by finding their integral representations. This approach also helps
determine whether a particular sum can be evaluated in closed form and how its
asymptotic behaviour can be found.

Section @sec:sum-computation evaluates a number of known and new combinatorial
sums. The calculations are brief and follow the single scheme of
§@sec:computation-algorithm, chiefly using $res$ and its properties.

In §@sec:binomial-sum-classification we consider more than 200 of the first
identities in Gould's book #bib-ref("Gould1972a"). We introduce integer
parameters, give a general form for the sums, and then represent them by one-
and two-dimensional integrals of rational functions over the distinguished
boundary of a polycylinder. Studying the singularities of the integrands
explains why these sums can be evaluated in closed form, yields a new identity
of the same type, and gives some asymptotic estimates.

Section @sec:hypergeometric-summation presents results from #bib-ref(
  "Erdelyi1953",
) and #bib-ref("Andrews1974"), where known sums involving ordinary and
$q$-binomial coefficients are evaluated using hypergeometric series.

The substantial collection of summation problems in §@sec:univariate-problems
forms an essential supplement to the chapter.
