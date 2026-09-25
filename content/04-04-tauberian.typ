#import "index-style.typ": index-mark
#import "statements.typ": theorem
#import "main-defs.typ": bib-ref, eq, source

#source(149, "137")
#heading(level: 2)[Asymptotic Estimates] <sec:asymptotic-estimates>
#heading(level: 3)[
  Asymptotic theorems of Tauberian type for the coefficients of a generating
  function
] <sec:tauberian-estimates>

A closed form for a generating function $A(w)=sum_(m=0)^infinity a_m w^m$ often
makes it possible to determine the asymptotic behavior of its coefficients. When
the radius of convergence is finite and there are only finitely many
singularities on the circle of convergence, suitable local expansions at these
points determine the coefficient asymptotics. For an entire generating function,
its growth for large $|w|$ can instead be used. Darboux's method #bib-ref(
  "Darboux1878",
) was a starting point for the finite-radius case. It has been used successfully
for classical orthogonal polynomials and certain arithmetic functions. A survey
of related asymptotic results, including logarithmic and exponential
singularities, is given in #bib-ref("Erdelyi1955"), §19.5; see also #bib-ref(
  "Postnikov1971",
) and #bib-ref("Subkhankulov1976").

Darboux's method leads to the following result of Szegő.

#theorem(suffix: [])[
  (#bib-ref("Szego1959"), Theorem 8.4).
  _Let $h(w)$ be holomorphic in $|w|<1$ and extend holomorphically across the
  unit circle except at finitely many distinct points $zeta_k=e^(i phi_k)$,
  $k=1,dots,ell$. Suppose that near each $zeta_k$ it has the convergent local
  expansion_
  #eq(
    $
      h(w)=sum_(nu=0)^infinity c_nu^((k))
      (1-w e^(-i phi_k))^(alpha_k+nu beta_k), quad k=1,dots,ell,
    $,
  ) <eq:darboux-local-expansion>
  _where $beta_k>0$, with the branches agreeing with $h$ inside the disc. Then_
  #eq(
    $
      sum_(nu=0)^infinity sum_(k=1)^ell c_nu^((k))
      binom(alpha_k+nu beta_k, n)(-e^(-i phi_k))^n
    $,
  ) <eq:darboux-coefficient-expansion>
  _is an asymptotic expansion of $[w^n]h(w)$: for every $Q>0$, retaining
  sufficiently many terms of the outer sum gives an error $O(n^(-Q))$ as
  $n arrow.r infinity$. The infinite sum is understood asymptotically._
] <th:darboux-local-expansion>
#index-mark([@th:darboux-local-expansion], group: [Theorems])[Szegö]

We will use a consequence of the following theorem of Freud to estimate
solutions of two combinatorial problems.

#theorem(suffix: [])[
  #bib-ref("Freud1951"). _Let $f(t)>=0$ for $t>=0$ and let $tau$ be
  nondecreasing. Suppose the Laplace–Stieltjes integral_ #eq(
    $ F(s)=integral_0^infinity f(t)e^(-s t)dif tau(t) $,
  ) <eq:laplace-stieltjes-transform>
  #source(150, "138")
  _converges for real $s>0$. Let $alpha>0$. If, as $s arrow.r 0^+$,_
  #eq(
    $ F(s)=frac(A Gamma(1+alpha), s^alpha)(1+r(s)), $,
  ) <eq:laplace-leading-term>
  _where_
  #eq($ |r(s)|<=c_0 s^epsilon $) <eq:laplace-remainder-bound>
  _for positive constants $A,c_0,epsilon$ and all sufficiently small $s>0$,
  then_
  #eq(
    $ integral_0^x f(t)dif tau(t)=A x^alpha (1+rho(x)), $,
  ) <eq:tauberian-integrated-asymptotic>
  _where, for a constant $c_1>0$ and all sufficiently large $x$,_
  #eq($ |rho(x)|<frac(c_1, ln x). $) <eq:tauberian-remainder-bound>
] <th:laplace-stieltjes-transform>
#index-mark([@th:laplace-stieltjes-transform], group: [Theorems])[Freud]

There are corresponding results for power series.

#theorem(suffix: [])[
  (Hardy and Littlewood; see #bib-ref("Hardy1930")).
  _Let $A(z)=sum_(m=0)^infinity a_m z^m$ have real coefficients and converge for
  $|z|<1$. If the finite limit_
  #eq(
    $ lim_(z arrow.r 1^-) (1-z)^(alpha+1)A(z)=B $,
  ) <eq:generating-function-limit>
  _exists for some $alpha>=0$, and_
  #eq($ m(a_m-a_(m-1)) > -c, quad m=1,2,dots, $) <eq:tauberian-difference-bound>
  _where $c>0$ is a constant, then_
  #eq(
    $ lim_(m arrow.r infinity)frac(a_m, m^alpha)=frac(B, Gamma(alpha+1)). $,
  ) <eq:tauberian-coefficient-limit>
] <th:generating-function-limit>
#index-mark(
  [@th:generating-function-limit],
  group: [Theorems],
)[Hardy–Littlewood]

#block(sticky: true)[
  Freud's theorem also implies that if $a_m>=0$ and
]
#eq(
  $
    sum_(m=0)^infinity a_m z^m=(1-z)^(-alpha)
    lr((1+O lr(((1-z)^epsilon))))
  $,
) <eq:quantitative-generating-estimate>
_as $z arrow.r 1^-$, where $alpha>0$ and $epsilon>0$, then_
#eq(
  $
    sum_(0<=m<=x)a_m=frac(x^alpha, Gamma(1+alpha))
    +O lr((frac(x^alpha, ln x)))
  $,
) <eq:quantitative-coefficient-sum>
as $x arrow.r infinity$. Indeed, put $z=e^(-s)$ and apply the theorem to the
measure with mass $a_m$ at each nonnegative integer $m$. Since
$1-e^(-s)=s(1+O(s))$, the relative error in its Laplace transform is
$O(s^(min(epsilon, 1)))$.

A. G. Postnikov #bib-ref("Postnikov1971") gave a complex analogue of
@th:generating-function-limit: additional conditions on $A(z)$ in a complex
neighborhood can substantially improve the remainder estimate.
