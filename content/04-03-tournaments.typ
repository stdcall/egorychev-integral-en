#import "statements.typ": corollary, proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(139, "127")
#heading(level: 2)[
  Determination of Integral Representations for Solutions of Enumeration
  Problems
] <sec:enumeration-integrals>

#heading(level: 3)[
  Tournaments with a unique Hamiltonian circuit
] <sec:unique-hamiltonian-tournaments>

Let $S_n$ be the number of nonisomorphic tournaments with $n$ vertices having a
unique Hamiltonian circuit. It is shown in #bib-ref("Douglas1970") that $S_4=1$
and, for $n>=5$, #eq(
  $
    S_n & =1+sum_(k=1)^(n-3)sum_(p=0)^(min(k-1, n-k-3))2^(n-k-p-4) \
        & quad times lr(
            (
              2 binom(n-k-3, p)binom(k-1, p+1)
              +binom(n-k-4, p)binom(k-1, p)
            )
          ).
  $,
) <eq:tournament-sum>
In this formula and @eq:tournament-identity, a binomial coefficient is zero
unless $0<=p<=a$ for $binom(a, p)$; in particular, $binom(-1, 0)=0$.

#theorem(suffix: [])[
  #bib-ref("Egorychev1974b"). _The generating function_
  $ T(u)=sum_(n=4)^infinity S_n u^(n-4) $
  _is given by_
  #eq($ T(u)=(1-3u+u^2)^(-1), $) <eq:tournament-generating-function>
  #eq(
    $
      S_n=frac(1, sqrt(5))lr(
        (
          lr((frac(3+sqrt(5), 2)))^(n-3)-lr((frac(3-sqrt(5), 2)))^(n-3)
        )
      ), quad n>=4,
    $,
  ) <eq:tournament-closed-form>
  _or, equivalently,_
  #eq(
    $ S_n=floor(frac(1, sqrt(5))lr((frac(3+sqrt(5), 2)))^(n-3)), quad n>=4. $,
  ) <eq:tournament-floor-form>
  _Here $floor(dots)$ denotes the integer part. The recurrence is_
  #eq(
    $
      S_n=3S_(n-1)-S_(n-2)
      =det mat(S_5, S_4; S_(n-2), S_(n-1)), quad n>=6,
    $,
  ) <eq:tournament-recurrence>
  _with $S_4=1$ and $S_5=3$._
] <th:tournament-generating-function>

#corollary[
  _For every integer $n>=4$,_
  #eq(
    $
      1 & +sum_(k=1)^(n-3)sum_(p=0)^(min(k-1, n-k-3))2^(n-k-p-4) \
        & quad times lr(
            (
              2 binom(n-k-3, p)binom(k-1, p+1)
              +binom(n-k-4, p)binom(k-1, p)
            )
          ) \
        & =frac(1, sqrt(5))lr(
            (
              lr((frac(3+sqrt(5), 2)))^(n-3)-lr((frac(3-sqrt(5), 2)))^(n-3)
            )
          ).
    $,
  ) <eq:tournament-identity>
]

#source(140, "128")
#proof[
  Replace the binomial coefficients in @eq:tournament-sum by their
  representations $M_1$. By linearity, #eq(
    $
      S_n & =1+sum_k sum_p 2^(n-k-p-4)
            res_(u,v)(1-u)^(-p-1)(1+v)^(k-1) \
          & quad times (2+u v)u^(-(n-k-3)+p-1)v^(-p-2),
    $,
  ) <eq:tournament-double-residue>
  #block(sticky: true)[
    where the ranges are those in @eq:tournament-sum. Add the term $p=-1$, which
    has zero residue for every $1<=k<=n-3$, and then increase the index by one.
    This gives
  ]
  $
    S_n=1+sum_(k=1)^(n-3)sum_(p=0)^(min(k, n-k-2))2^(n-k-p-3)
    res_(u,v)frac(
      (1-u)^(-p)(1+v)^(k-1)(2+u v),
      u^(n-k-2-p+1)v^(p+1)
    ).
  $
  The sum over $p$ may be extended to all nonnegative integers: terms beyond the
  upper bound have zero residue. Since $z=u/[2(1-u)]$ has zero constant term,
  the substitution rule gives
  $
    sum_(p=0)^infinity z^p res_v frac((1+v)^(k-1)(2+u v), v^(p+1))
    =(1+z)^(k-1)(2+u z)=frac((2-u)^(k+1), 2^k (1-u)^k).
  $
  Consequently,
  $
    S_n=1+sum_(k=1)^(n-3)2^(n-2k-3)
    res_u frac((1-u)^(-k)(2-u)^(k+1), u^(n-k-1)).
  $
  The same summand at $k=n-2$ equals $1$, so it absorbs the initial term. Thus
  $
    S_n=sum_(k=1)^(n-2)frac(2^(n-2k-3), 2pi i)
    integral_(|u|=rho)frac((1-u)^(-k)(2-u)^(k+1), u^(n-k-1))dif u.
  $
  Here $0<rho<1$ and the circles are positively oriented. Terms with $k>n-2$
  have zero integral, so we can extend the sum to infinity. Take $rho=1/2$; on
  $|u|<=1/2$ the geometric ratio satisfies
  $ lr(|frac(u(2-u), 4(1-u))|)<=frac(5, 8)<1. $
  #source(141, "129")
  We may therefore sum the uniformly convergent series under the integral sign,
  obtaining #eq(
    $
      S_n & =frac(2^(n-3), 2pi i)integral_(|u|=1/2)
            frac((2-u)^2, u^2-6u+4)frac(dif u, u^(n-2)) \
          & =frac(1, 2pi i)integral_(|v|=1/4)
            frac(1, 1-3v+v^2)frac(dif v, v^(n-3)).
    $,
  ) <eq:tournament-integral>
  For the second equality, substitute $u=2v$ and use $(1-v)^2=(1-3v+v^2)+v$. The
  resulting extra term $v^(-n+2)$ has zero residue for $n>=4$.

  #block(sticky: true)[
    Reading the coefficient in the last integral proves
    @eq:tournament-generating-function. Factoring its denominator and taking
    partial fractions gives @eq:tournament-closed-form. If $b=(3-sqrt(5))/2$,
    then $0<b^(n-3)/sqrt(5)<1$, which proves @eq:tournament-floor-form and gives
    the asymptotic estimate
  ]
  $ S_n ∼ frac(1, sqrt(5))lr((frac(3+sqrt(5), 2)))^(n-3). $
  Multiplication of @eq:tournament-generating-function by $1-3u+u^2$ gives
  @eq:tournament-recurrence.

  The two sides of @eq:tournament-identity thus have a common integral
  representation, @eq:tournament-integral. The reduction uses the algebraic
  properties of $res$, while the contour calculation provides an analytic
  justification of the infinite summation. The resulting rational generating
  function can also be handled entirely by formal coefficient extraction.
]
