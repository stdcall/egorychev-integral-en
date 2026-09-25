#import "index-style.typ": index-mark
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, res, source

#source(161, "149")
#heading(level: 1)[
  Integral Representations and Computation of Multidimensional Sums
] <ch:multivariate-sums>
#heading(
  level: 2,
  numbering: none,
)[Introduction] <sec:multivariate-introduction>
#index-mark([@sec:multivariate-introduction], group: [Sums])[Multidimensional
  (multiple)]

In this chapter we use multidimensional residues to compute combinatorial sums.
Such residues arise when we seek integral representations of sums that depend on
several positive integer arguments, or whose summands contain products of the
numbers in #link(<app:table-m>)[Table M].

In @sec:independent-indices we compute the Dixon sum using MacMahon's master
theorem #bib-ref("MacMahon1915"), Dyson's multidimensional partition function
#bib-ref(
  "Dyson1962",
) using a nontrivial change of variables in a contour integral, and several sums
of Carlitz and of Sarmanov, Sevast'yanov and Tarakanov using multiple contour
integrals. In @sec:linear-constraints we compute sums with linear constraints on
the summation indices and obtain new identities of the same type.

The most interesting material is in @sec:splitting-method and
@sec:splitting-integrals, where we develop a method for computing combinatorial
sums depending on one or several parameters by passing to sums of higher
dimension: the _splitting method_. The original sequence of combinatorial
quantities often occurs as a subsequence of a simpler sequence of higher
dimension, whose integral representation and generating function are also
simpler. Computing the corresponding integral gives the original quantity as a
special case.

@sec:splitting-integrals explains this phenomenon. Splitting is used to compute
one-dimensional and multiple integrals (residues) by passing to integrals of
higher dimension whose singular surfaces have a simpler structure (see the
splitting lemma in @sec:splitting-integrals). #source(162, "150")In practice,
the procedure helps find both the appropriate dimension and a change of
variables that reduces the original integral to a standard contour integral or
generating function.

#heading(level: 2)[
  Computation of multiple sums (with independent summation indices)
] <sec:independent-indices>
#heading(level: 3)[
  Computation of the Dixon sum using MacMahon's master theorem
] <sec:dixon-sum>

As an application of his master theorem (see @sec:main-residue-theorem),
MacMahon #bib-ref("MacMahon1915") computed the sum #eq(
  $ S_m=sum_(i=0)^m (-1)^i binom(m, i)^3, $,
) <eq:dixon-cubic-sum>
first considered by Dixon in 1890, evaluated by elementary means by Ljunggren in
1947, and subsequently generalized by various authors. Here $m$ is a nonnegative
integer.

We follow Hall's analysis of MacMahon's proof (#bib-ref("Hall1958"), pp. 49–50),
highlighting its special choices and using residue notation.

First, MacMahon observed that #eq(
  $
    S_m=res_(x,y,z) (x-y)^m (z-x)^m (y-z)^m (x y z)^(-m-1),
  $,
) <eq:dixon-triple-residue>
and applied the master theorem with
$ A=mat(0, -1, 1; 1, 0, -1; -1, 1, 0). $
The product of the three linear forms given by this matrix is the negative of
$(x-y)(z-x)(y-z)$. This sign does not change the required coefficient: for even
$m$ it disappears, and for odd $m$ we have $S_m=0$ by pairing the terms with
indices $i$ and $m-i$.

Second, he expanded the denominator in @eq:coefficient-majorant according to
@th:coefficient-majorant. In its symbolic notation,
$
  & lr(|(1-a_1 x)(1-a_2 y)(1-a_3 z)|) \
  & =1-|a_1|x-|a_2|y-|a_3|z \
  & quad+|a_1 a_2|x y+|a_1 a_3|x z+|a_2 a_3|y z \
  & quad-|a_1 a_2 a_3|x y z.
$
#keep-next[Computing the principal minors gives $1+x y+x z+y z$. Thus]
#eq(
  $
    S_m & =res_(x,y,z) (1+x y+x z+y z)^(-1)(x y z)^(-m-1) \
        & =res_(x,y,z) lr((1+sum_(t=1)^infinity (-1)^t (x y+x z+y z)^t))
          (x y z)^(-m-1) \
        & =cases(
            0 & quad m "odd",
            (-1)^(3n) res_(x,y,z) (x y+y z+x z)^(3n)(x y z)^(-2n-1) & quad m=2n.
          )
  $,
) <eq:dixon-rational-residue>

#source(163, "151")
Third, identify polynomial coefficients by writing $y z=u^2$, $z x=v^2$ and
$x y=w^2$, so that $x^2 y^2 z^2=u^2 v^2 w^2$. Only the term
$(y z)^n (z x)^n (x y)^n$ contributes to the required diagonal coefficient. The
multinomial theorem therefore gives
$
  S_(2n) & =(-1)^(3n) res_(u,v,w) (u^2+v^2+w^2)^(3n)(u v w)^(-2n-1) \
         & =(-1)^n (3n)!/(n!)^3.
$
We obtain Dixon's identity #eq(
  $
    sum_(i=0)^(2n) (-1)^i binom(2n, i)^3=(-1)^n (3n)!/(n!)^3.
  $,
) <eq:dixon-identity>
In @sec:splitting-integrals we give a proof without the special choices used
above. Good (#bib-ref("Good1961a", "Good1962a", "Good1962b")) also evaluated
sums using MacMahon's master theorem and multiple residues.
