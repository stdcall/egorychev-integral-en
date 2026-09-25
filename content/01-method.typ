#import "index-style.typ": index-mark
#import "statements.typ": example, solution
#import "main-defs.typ": dv, dw, eq, res, source
#let eq = eq.with(series: "algorithm")

#source(21, "9")
#heading(level: 1)[
  The Method of Integral Representation of Combinatorial Sums
] <ch:integral-method>

#heading(level: 2, numbering: none)[Introduction] <sec:method-introduction>

In this book we explicitly formulate and systematically use _the method of
integral representation_ of one-dimensional and multiple sums with combinatorial
numbers, including the operational method as well as a unified technique for
investigating the integrals obtained. The basis for the method is given with the
help of multiple residues (@ch:integral-method[Chapter]). The method can be
employed for a rather large class of combinatorial expressions which are
representable in terms of known combinatorial numbers by means of addition and
multiplication operations, and which admit representation in the corresponding
algebra in terms of the coefficients of a composite series of finitely many
known combinatorial series. The method of integral representation of sums
enables us, in particular, to compute in a uniform way sums that can be
calculated by the method of generating functions in the algebra of formal power
series. The application of integrals unifies the whole computation process, and
the knowledge of integral representations of sums (generating functions) makes
it possible to compute sums (integrals) and obtain combinatorial identities and
recursion relations for sums, to obtain asymptotic expressions and estimates for
sums, to originate new ways of computing sums (integrals), and to solve
enumeration problems in combinatorial analysis.

#heading(level: 2)[The computation algorithm] <sec:computation-algorithm>
#index-mark([@sec:computation-algorithm], group: [Methods])[Integral
  representations of sums]

The general scheme of the method of integral representation of sums developed in
@ch:integral-method[Chapter] can be broken up into the following steps.

#source(22, "10")
+ Assignment of a table of integral representations for an initial collection of
  combinatorial numbers—for example (see the formulas $M_(1)(w)$, $M_(8)(s)$ and
  $M_(7)(w)$ in the #link(<app:table-m>)[Appendix]) #eq(
    $
      binom(n, k) =
      1 / (2 pi i) integral.cont (1 + w)^n w^(-k-1) dw,
      quad n! = integral_0^infinity e^(-s) s^n dif s, \
      s_(2)(n, k) = n! / k! 1 / (2 pi i)
      integral.cont (-1 + exp w)^k w^(-n-1) dw.
    $,
  ) <eq:initial-integrals>
  #index-mark([@eq:initial-integrals], group: [Methods], after: [Integral
    representations of sums])[Computation algorithm]
  This table can be supplemented in the course of the computations.

+ A preliminary preparation of the original expression, with the purpose of
  representing it in terms of a sum of products of combinatorial numbers in the
  initial table. To each (elementary) transformation of the numbers in this step
  there corresponds an equivalent transformation of the integral representations
  for them.

+ Replacement of the combinatorial numbers by integral representations of them.

+ Reduction of products of integrals to multiple integrals.

+ Interchange of the order of summation and integration. The use of this
  transformation sometimes requires us to deform the domain of integration in
  such a way as to obtain a series under the integral sign which converges
  uniformly on this domain, without changing the value of the integral. As a
  rule, this series turns out to be a geometric progression.

+ Summation of the series under the integral sign and determination of an
  _integral representation for the original sum_.

+ Computation of the resulting integral by means of iterated integration, the
  theory of (multiple) residues, or tables of integrals. Here it is sometimes
  necessary to resort to various methods for transforming multiple integrals:
  deformation of the contour of integration, change of variables, and passage to
  integrals of higher dimension (§§@sec:splitting-method and
  @sec:splitting-integrals, the splitting method). The idea of the splitting
  method arose in carrying transformations used by Carlitz (1965) on binomial
  coefficients to compute sums over to the language of integral transformations.
  The splitting procedure (§@sec:splitting-lemma, the splitting lemma) enables
  us to reduce the original integral of meromorphic forms over cycles to
  integrals with respect to a greater number of variables, but with a simpler
  structure for the singularities of the integrand forms. The splitting
  procedure actually enables us to find the needed change of variables and, in
  the case of separating cycles, to use one of the variants of the multiple
  logarithmic residue theorem (@th:splitting-sum-integral).
  @th:splitting-sum-integral generalizes two known integral constructions:
  Good's theorem and MacMahon's master theorem, both used previously to compute
  combinatorial sums.

#source(23, "11")The following example illustrates the method. The numbering in
this example corresponds to the steps of the computation scheme.

#example[
  Compute the sum
  $ S_(n,m) = sum_(k=m)^n (-4)^k binom(k, m) n / (n + k) binom(n + k, 2k). $
] <ex:moriarty-sum>

#solution[
  We have #eq(
    $
      S_(n,m) = sum_(k=m)^n
      (-4)^k binom(k, m) lr(
        {binom(n + k, 2k)
          - 1 / 2 binom(n + k - 1, 2k - 1)}
      )
    $,
  ) <eq:moriarty-decomposition>
  #eq(
    $
      = sum_(k=0)^infinity (-4)^k
      1 / (2 pi i) integral_(abs(w)=rho) (1 + w)^k / w^(m+1) dw \
      times lr(
        {1 / (2 pi i) integral_(abs(v)=tau)
          (1 + v)^(n+k) / v^(2k+1) dv
          - 1 / (2 pi i) integral_(abs(v)=tau)
          (1 + v)^(n+k-1) / (2v^(2k)) dv}
      )
    $,
  ) <eq:moriarty-factor-integrals>
  #eq(
    $
      = sum_(k=0)^infinity (-4)^k
      1 / (2 pi i)^2 integral_(vec(delim: #none, abs(w)=rho, abs(v)=tau))
      ((1 + w)^k (1 + v)^(n+k-1) (1 + v / 2)) / (w^(m+1) v^(2k+1))
      dw and dv
    $,
  ) <eq:moriarty-double-integral>
  #eq(
    $
      = 1 / (2 pi i)^2
      integral_(vec(delim: #none, abs(w)=1/7, abs(v)=6))
      ((1 + v)^(n-1) (1 + v / 2)) / (w^(m+1) v) \
      times lr({sum_(k=0)^infinity lr([-4 ((1 + w) (1 + v)) / v^2])^k})
      dw and dv
    $,
  ) <eq:moriarty-geometric-series>
  #eq(
    $
      = 1 / (2 pi i)^2
      integral_(vec(delim: #none, abs(w)=1/7, abs(v)=6))
      ((1 + v)^(n-1) v (1 + v / 2)) /
      (w^(m+1) (v^2 + 4 (1 + v) (1 + w))) dw and dv.
    $,
  ) <eq:moriarty-rational-integrand>

  Taking the last integral successively with respect to $w$ and $v$ according to
  the residue theorem, we have #eq(
    $
      S_(n,m) = (-4)^m / 2 1 / (2 pi i)
      integral_(abs(v)=6) (v (1 + v)^(n+m-1)) / (v + 2)^(2m+1) dv \
      = (-1)^n 4^m n / (n + m) binom(n + m, 2m),
    $,
  ) <eq:moriarty-residue-evaluation>
  which gives a new proof of the known identity of Moriarty #eq(
    $
      sum_(k=m)^n (-4)^k
      binom(k, m) n / (n + k) binom(n + k, 2k)
      = (-1)^n 4^m n / (n + m) binom(n + m, 2m).
    $,
  ) <eq:moriarty-identity>

  The method presented has been used by the author in this book and other
  publications to compute in a concise and uniform manner a large number of
  #source(24, "12")sums with combinatorial numbers, including most of the sums
  in the books of Schwatt (1924), Riordan (1968), Gould (1972), and Kaucký
  (1975) on combinatorial identities. As a result of our computations we have
  obtained combinatorial identities of which some coincide with known identities
  and some simplify or modify known identities previously obtained by a great
  variety of methods. Certain known identities turned out to be erroneous, and
  the method permitted us to find the correct values of the sums on the
  left-hand sides of these identities. Certain sums had not been considered
  previously and were computed for the first time (for example,
  @th:linear-constraint-sum and @th:szego-general-series).

  The method of integral representation of sums enables us to compute in a
  uniform manner also those sums that can be calculated with the help of the
  algebra of formal power series over the field of complex numbers
  (§@sec:generating-function-operations). In this case we can either use contour
  integrals, replacing the formal series by their partial sums
  (§§@sec:residue-rule-proofs and @sec:historical-notes), or employ the concept
  and properties of the operator $res_w$ (§@sec:residue-rules), which in the
  case of convergent series are equivalent to the classical concept and
  properties of the residue at the point $w = 0$
  (§@sec:complex-analysis-connection). The latter modification of the method as
  an operational method is of independent value when the algebra of formal power
  series over an arbitrary field is applicable in the computations.
]
