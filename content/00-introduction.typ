#import "main-defs.typ": bib-ref, res, source

#source(13, "1")
#heading(level: 1, numbering: none)[Introduction] <front:introduction>

The problem of computing finite and infinite sums (generating functions) arising
in diverse areas of discrete and continuous mathematics, along with its
applications, makes up the object of this investigation, while the integral
representation of the sums being studied makes up the method and the result.

The study of this problem is of special interest in the framework of
combinatorial analysis for solving enumeration problems. A number of remarkable
results here are due to Fermat, Pascal, Leibniz, Euler, Hindenburg, J.
Bernoulli, Steiner, Gauss, Jacobi, Möbius, Sylvester, Cayley, MacMahon,
Ramanujan, Hardy, Pólya, de Bruijn, Harary, Erdös, Rota, Stanley, and other
scholars, most of whom have played prominent roles in the development of
mathematical analysis.

The results of computing combinatorial expressions give rise to corresponding
_combinatorial identities_ which, as a rule, can be meaningfully interpreted in
the language of sets of objects being enumerated. Interest in the study of
combinatorial identities has increased appreciably in recent times. The books
#bib-ref("Schwatt1924"), #bib-ref("Riordan1968"), #bib-ref("Gould1972a"),
#bib-ref("Egorychev1974c"), and #bib-ref("Kaucky1975") of Schwatt, Riordan,
Gould, Egorychev, and Kaucký are the first devoted entirely to this area of
investigation, which lies at the juncture of discrete and continuous
mathematics. Attempts were made in these books to systematize the vast amount of
material, and a history of the problem and various proofs of known combinatorial
identities (see also the monograph #bib-ref("Knuth1969") of Knuth) are given.

Riordan (#bib-ref("Riordan1968"), pp. vii–viii) gives the following
characterization of combinatorial identities (with binomial coefficients) as an
object of investigation, and it reflects the opinions of the majority of
specialists in combinatorial analysis: “Identities in binomial coefficients…
have a peculiar standing in mathematics. Because binomial coefficients are
perhaps the simplest combinatorial entities (the numbers of combinations with—or
without—repetition), some identities arise from alternative solutions of
combinatorial problems and incidentally give added significance to doing
problems the ‘hard’ way… The identity is verified, apart from its putative
combinatorial origin, by operations in which properties of the binomial
coefficients are employed. Combinatorialists use #source(14, "2")recurrence,
generating functions, and such transformations as the Vandermonde convolution;
others, to my horror, use contour integrals, differential equations, and other
resources of mathematical analysis… The central fact developed is that
identities are both inexhaustible and unpredictable; the age-old dream of
putting order in this chaos is doomed to failure.”

“The identities examined are not solely those for binomial coefficients; other
combinatorial entities, like the Catalan, Fibonacci, and Stirling numbers, recur
frequently and call for the generality of the title: _Combinatorial Identities_.
This is taken in the vague sense suitable to the growing state of combinatorial
mathematics at the moment.”

At the end of the 18th century Laplace set forth the main ideas of the method of
generating functions in his work on probability theory, and this method is
presently the principal analytic method for getting combinatorial identities.
Generating functions (generating integrals) are being used with success for the
study of properties of the numerical sequences (systems of polynomials) that
give rise to them, including the determination of explicit formulas, the
determination of and solution of recursion relations (differential, integral,
and differential-difference equations) connecting these sequences of numbers,
the determination of asymptotic formulas for the numbers (functions) generated,
and so on (see, for example, the survey in #bib-ref("Erdelyi1955"), §§17 and
19).

In the course of the last two centuries the method of generating functions has
received a certain theoretical foundation and has found important applications
in the theory of finite differences and algebraic invariants, the theory of
special functions, and especially in probability theory, mathematical
statistics, and analytic number theory (see, for example, #bib-ref(
  "Goncharov1944",
), #bib-ref("David1962"), #bib-ref("Feller1968"), #bib-ref("Malyshev1970"),
#bib-ref("Takacs1967"), #bib-ref("Linnik1972") and the surveys in #bib-ref(
  "Postnikov1971",
), #bib-ref("Hardy1938"), #bib-ref("Karatsuba1975") and #bib-ref(
  "Gelfond1962",
)).

The method of generating functions has been most intensively developed in the
framework of combinatorial analysis for solving enumeration problems (see the
surveys in #bib-ref("Linnik1972"), #bib-ref("Riordan1958"), #bib-ref(
  "Rybnikov1972",
) and #bib-ref("Sachkov1973")). We should mention the grandiose project and
initial results of Leibniz (see #bib-ref("Beckenbach1964"), Introduction), and
then the work of Hindenburg and the German school of mathematicians during the
18th and the beginning of the 19th century, the English school of mathematicians
in the 19th and the beginning of the 20th century, with MacMahon #bib-ref(
  "MacMahon1915",
) the most conspicuous figure, and the work of Netto #bib-ref("Netto1927"). In
the contemporary period Pólya made an essential shift in the purposeful use of
the method of generating functions in 1937 (see #bib-ref("Polya1937"), and
#bib-ref("Beckenbach1964"), Chapter 5). Of recent work, the achievements of Rota
and his school on the foundations of combinatorial analysis should be mentioned
(see, for example, #bib-ref("Rota1969"), #bib-ref("Rota1964"), #bib-ref(
  "Goldman1970",
), #bib-ref("Andrews1971"), #bib-ref("Doubilet1972b"), #bib-ref("Doubilet1972a")
and #bib-ref("Rota1973")).

#source(15, "3")And of results due to Soviet authors on combinatorial methods
and problems in probability theory and mathematical statistics we should point
to the accomplishments of a group of mathematicians including V. A. Malyshev, V.
N. Sachkov, V. E. Stepanov, B. A. Sevast'yanov, V. P. Chistyakov, and others in
working with concrete generating functions and in determining the asymptotic
behavior for the statistics of distributions (see the surveys #bib-ref(
  "Kolchin1974",
), #bib-ref("Kolchin1976"), #bib-ref("Stepanov1973"), #bib-ref("Linnik1972") and
#bib-ref("Malyshev1976")).

At the same time many investigators, in analyzing the nature of the use of
generating functions in combinatorial analysis in the contemporary period and
the causes for the decline of the German and English schools, direct attention
to the inadequate computational possibilities and the awkwardness of the
symbolic apparatus of this method. Some specialists in discrete analysis,
beginning with Bell #bib-ref("Bell1923")–#bib-ref("Bell1940"), regard it as
expedient to use only formal (power) series in computations, with corresponding
rejection of the concept of convergence as a tool (see the surveys in #bib-ref(
  "Niven1969",
) and §@sec:historical-notes), which has led to an opulent development of
diverse symbolic methods of calculus, most of which, in the author's opinion,
are not of independent value. We emphasize that the method of generating
functions does not pose (indeed, cannot pose, for the reasons given above) the
problem of determining an integral representation for combinatorial sums and
computing them, which is a problem more general than that of obtaining
combinatorial identities.

The present book deals with the systematic development of the method of integral
representation of sums to the computation of finite and infinite sums by
reducing them to one-dimensional and multiple integrals, most often contour
integrals. At the first stage of the computations we realize in an elementary
form the fundamental idea of an integral representation for a solution
satisfying given boundary conditions, while at the concluding stage we use the
theory of residues of one and several complex variables in the case where the
solution is represented by contour integrals. The principal difference between
this method of computing combinatorial sums and the previously known approaches
is the creation of a single standardized procedure for getting integral
representations of the sums to be computed, with a complete justification of
this method (as well as the method of generating functions) by means of the
theory of one-dimensional and multiple residues. In the case of formal series we
introduce the concept of $res$, which is directly connected with the concept of
residue in the theory of analytic functions and is suitable for use with various
series, including power series. The connection with the theory of residues has
enabled us to express properties of $res$ analogous to those of the residue and
to unify the scheme of the method of integral representation of #source(
  16,
  "4",
)sums independently of what kind of series—convergent or formal—is being used in
the computations.

Ideas of this kind were stated by one of the creators of the theory of analytic
functions, namely, Cauchy, who first used contour integrals to solve problems in
mathematical physics. It is thus not difficult to see the common features
between our approach and two methods of mathematical physics: the method of
contour integrals and the operational symbolic method of Heaviside (see, for
example, #bib-ref("Efros1937"), #bib-ref("Rasulov1964") and #bib-ref(
  "Rasulov1975",
)). Ideas similar to ours have been employed by many classical mathematicians
(see #bib-ref("Hermite1865"), #bib-ref("Poincare1887") and #bib-ref(
  "Cayley1856",
))\; however, they used their methods only in the framework of mathematical
analysis. Contour integrals are also used in the main methods of analytic number
theory: the method of complex integration, the circle method (the “circular
wheel” method) of Hardy, Littlewood, and Ramanujan, and Vinogradov's method of
trigonometric sums for obtaining estimates of the Weyl trigonometric sums and
for solving other problems (see, for example, the surveys in #bib-ref(
  "Vinogradov1971",
), #bib-ref("Prachar1957"), #bib-ref("Postnikov1971") and #bib-ref(
  "Karatsuba1975",
)). The idea of making systematic use of contour integrals in estimating
combinatorial sums was apparently first worked out by Hardy, Littlewood, and
Ramanujan in the “circular wheel” method (see #bib-ref("Hardy1918"), #bib-ref(
  "Ramanujan1927",
), #bib-ref("Hardy1930") and #bib-ref("Karatsuba1975")). Some technical points
common with our approach are encountered in the book #bib-ref("Schwatt1924") of
Schwatt in the computation of one-dimensional finite sums with binomial
coefficients by means of formal power series in one variable. Of recent work
connected with the solution of problems of a combinatorial nature and using
generating functions to compute multiple contour integrals, we should mention
results of Good (#bib-ref("Good1961a"), #bib-ref("Good1962b"), #bib-ref(
  "Good1962a",
)) and Dyson #bib-ref("Dyson1962"). Among investigations on the determination
and use of generating functions the fundamental works of MacMahon #bib-ref(
  "MacMahon1915",
) and Feller #bib-ref("Feller1968") have aroused the greatest interest (see also
#bib-ref("McBride1971")). A more detailed characterization of the methods used
in obtaining combinatorial identities and in computing combinatorial sums is
presented in §@sec:historical-notes and in the #link(
  <sec:univariate-introduction>,
)[Introduction] to @ch:univariate-sums[Chapter].

In @ch:integral-method[Chapter] we explain the method of integral representation
of sums. In §§@sec:computation-algorithm–@sec:complex-analysis-connection and
@sec:method-examples an algorithm is described, properties of $res$ are
presented and proved, and examples are given of the use of the method. In
§@sec:main-residue-theorem multidimensional residues are used to study a general
construction (the main theorem) arising frequently in the use of the idea of
integral representations and generalizing the result of MacMahon's master
theorem (#bib-ref(
  "MacMahon1915",
), pp. 93–123). The main problem in the method of generating functions, that of
passing from functional dependences between power generating functions $A(w)$,
$B(w)$, …, to corresponding systems of relations between the coefficients of
these generating functions, is studied along with the inverse problem in
§@sec:generating-function-operations.

#source(17, "5")The idea of integral representations is used in
@ch:univariate-sums[Chapter] to compute several (chiefly one-dimensional) of the
combinatorial sums with binomial coefficients given in the books of Riordan
#bib-ref("Riordan1968"), Gould #bib-ref("Gould1972a"), Kaucký #bib-ref(
  "Kaucky1975",
), and others. The computation of some sums is carried out in
§@sec:sum-computation with the help of the properties of $res$; this has enabled
us to obtain new proofs for a number of known combinatorial identities. Integral
representations are found in §@sec:binomial-sum-classification, and on the basis
of them several types of sums (identities) with binomial coefficients are
classified, including more than 200 of the first sums (identities) in Gould's
book #bib-ref("Gould1972a"). An analysis of the singularities in the integrands,
which depend on combinations of values of the original parameters, enabled us to
find, in particular, why it turned out to be possible to compute the first 70
sums in #bib-ref("Gould1972a") in closed form. An interesting idea of Bateman is
discussed in §@sec:hypergeometric-summation: computation of one-dimensional sums
with ordinary and $q$-binomial coefficients by means of summation formulas and
other transformations of hypergeometric series.

In @ch:inverse-relations[Chapter] the idea of integral representation is used to
give a solution of the problem of classifying many known pairs of inverse
combinatorial relations (a problem posed by Riordan in #bib-ref("Riordan1968"),
p. ix). The problem is solved by establishing that the pairs belong to a single
general pair of inverse relations $F_n^1$ which admits a simple combinatorial
interpretation. Interesting theorems are obtained on the structure of matrices
of type $F_n^1$, and an inversion is performed for a system of relations arising
in the enumeration of graphs with distinguished vertices.

The results in @ch:combinatorial-interpretation[Chapter] are obtained primarily
in the consideration of enumeration problems in combinatorial analysis and graph
theory. A survey of some results connected with the idea of a generating
function and due to Rota and his school on the foundations of combinatorial
analysis is given in §@sec:rota-generating-functions. In
§@sec:identity-interpretations there is an analytic proof of several
combinatorial identities first proved by combinatorial means. In
§§@sec:enumeration-integrals and @sec:asymptotic-estimates we compute and
estimate asymptotically some complicated analytic expressions arising in
practice in enumeration problems, with use of theorems of Tauberian type
relative to the asymptotic behavior of the coefficients of the generating
function.

In @ch:multivariate-sums[Chapter] multidimensional contour integrals are used to
compute various (chiefly multidimensional) sums, including the known sums of
Dixon and Le-Jen Shoo and some sums with linear constraints on the summation
indices. The most interesting results are contained in §§@sec:splitting-method
and @sec:splitting-integrals, where a new method is suggested for computing
combinatorial sums (the splitting method) by increasing the dimension of the
expressions under consideration. After computing them (if this turns out to be
possible), along with the general #source(18, "6")result, the desired one is
obtained by the inverse transition. We use the same idea in computing both
one-dimensional and multiple integrals by reducing them to integrals of a
different (larger) dimension, but with a singular surface of a simpler structure
(§@sec:splitting-integrals, the splitting lemma). As an application we obtain a
generalization of the result in the main theorem of @ch:integral-method[Chapter]
and a theorem on the generating function for the terms of a subsequence of a
multiple sequence. Several new identities are found in §@sec:new-identities (see
also §§@sec:binomial-sum-classification,
@sec:matrix-inversion–@sec:multivariate-inversion,
@sec:identity-interpretations, @sec:enumeration-integrals, and
@sec:linear-constraints).

The method of integral representation of sums is applied to function theory and
group theory in @ch:applications[Chapter]. In §@sec:unbounded-szego-kernels,
written jointly with L. A. Aĭzenberg, we consider the question of integral
representations with Szegö kernels for functions holomorphic in unbounded
$n$-circular domains, and find formulas in closed form for Szegö kernels for a
large class of concrete unbounded $n$-circular domains. The conditions for these
integral representations to be valid are distinctive for functions of several
complex variables and do not have analogues for holomorphic functions of a
single complex variable. In §@sec:bounded-kernels we find formulas in closed
form for the Szegö and Bergman kernels for certain concrete bounded domains in
$C^n$. A combinatorial derivation of the rank formula for the factors of the
lower central series of free solvable and polynilpotent groups (see #bib-ref(
  "Egorychev1972a",
), #bib-ref("Gorchakov1972") and #bib-ref("Gorchakov1973")) is given in
§@sec:solvable-polynilpotent-ranks. This solves a problem posed by Kargapolov
(#bib-ref(
  "Kourovka1967",
), Question (2.18)). Such a formula was first found in
§@sec:enumeration-integrals for a class three solvable group by simplifying a
result which Sokolov #bib-ref(
  "Sokolov1969",
) obtained by combinatorial means. The results in
§@sec:solvable-polynilpotent-ranks led to the determination of a rank formula
for the factors of the $p$-central series of free groups in varieties
(§@sec:p-central-ranks).

There are lists of problems of varying difficulty at the ends of Chapters
@ch:univariate-sums–@ch:multivariate-sums.

In @ch:open-problems[Chapter] we direct our attention to the possibility of
extending the method of integral representation of sums to other types of series
(other than power series), which, if successful, would enable us to extend a
single approach for summation problems to combinatorial sums of other types, and
to repeat in full scope the same investigation for them as is carried out in
this book for power series.

The #link(<supp:supplement>)[Supplement], by A. P. Yuzhakov, contains a number
of original results allowing the direct computation of multidimensional contour
integrals in some cases. It should be mentioned that some results in
§§@supp:logarithmic-residue and @supp:implicit-and-inverse-maps of the
Supplement were obtained in the course of collaborating with the book's author.

Unfortunately, far from all summation problems (even those connected with the
use of power series) could be included here, due to limited space. We did
#source(19, "7")not consider such interesting sums as determinants and
permanents,#footnote[
  _Editor's note._ The author has solved a long-standing problem in his paper
  _The solution of van der Waerden's problem for permanents_ (Adv. in Math. *42*
  (1981), no. 3, 299–305).
] Clebsch–Gordon coefficients, and so on. Completely absent is an investigation
of generating functions other than power series, even though the idea of an
integral representation can be extended to series of other types. Some important
areas, including the computation of multidimensional sums in statistical
physics, identities with $q$-binomial coefficients, the solution of systems of
recursion relations, and the determination of asymptotic estimates for
combinatorial sums, are examined only in cursory fashion, insofar as required by
the interests of the other areas. The bibliography makes no claims as to
completeness. A combinatorial interpretation is not always given to
computations, and, therefore, the interesting idea of establishing a
correspondence between the transformations (invariants) of integrals
representing a given combinatorial quantity and the ways of calculating it that
are invariant with respect to the value of the same quantity is not properly
developed.

It is to be hoped that the method of integral representation of sums will turn
out to be useful in overcoming the difficulties which arise in the
simplification (computation) of diverse cumbersome expressions in combinatorial
practice and in determining asymptotic estimates for them. With the evolution of
computational means the center of gravity of investigations in the solution of
enumeration problems is inevitably shifting toward the determination of
enumeration formulas in a form that is accessible to an investigator
independently of its complexity and the way of calculating it. In turn, the
determination by analytical means of a “beautiful” concise formula for a
combinatorial quantity that realizes the process of enumerating a specified set
of objects sometimes enables us to better comprehend the structure of this set
and to proceed to the discovery of a more general result (see, for example,
§§@sec:enumeration-integrals, @sec:solvable-polynilpotent-ranks and
@sec:p-central-ranks). Moreover, the determination of integral representations
for the solutions of diverse enumeration problems leads to an extensive class of
interesting and difficult problems in mathematical analysis: the finding of an
_asymptotic representation for multiple contour integrals with respect to
several parameters_.

It should be mentioned that, unlike in the traditional presentation, the
solution of the problems under consideration here is carried out briefly and in
a uniform fashion. Certain parts of this book contain most of the results
obtained in the books cited above on combinatorial identities. We give new,
analytic proofs of all the identities and pairs of _inverse_ relations
considered.

#source(20, "8")The majority of the examples analyzed are of independent
significance in combinatorial analysis, graph theory, probability theory, group
theory, in estimating the complexity of computational algorithms (on a
computer), and so on (concerning these applications see the sources indicated in
the corresponding references).

The specific character of the object and of the methods of investigation
required us to carry out a large number of unified computations. We hope that
this investigation will stimulate many specialists in discrete and continuous
mathematics to become more interested in combinatorial identities: one of the
oldest areas of mathematics, where, behind the beauty of the analytic
transformations, one may see fundamental applications in discrete analysis (see,
for example, #bib-ref("Knuth1969")).
