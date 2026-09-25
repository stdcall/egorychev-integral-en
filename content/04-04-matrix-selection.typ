#import "statements.typ": proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(152, "140")
#heading(level: 3)[An example] <sec:matrix-selection>

Let $A$ be an $n times m$ matrix of distinct elements. We select $k$ elements
with at most one in each row, requiring elements selected from adjacent rows to
lie in the same column. The order of selection is irrelevant. Let $g_(n k)(m)$
be the number of such selections, where $n>=k>=1$ and $m>=1$ are integers.

#theorem(suffix: [])[
  (#bib-ref("Egorychev1974c"), pp. 59–61). _The generating function_
  $ G(z)=sum_(n=k)^infinity g_(n k)(m)z^n $
  _is_
  #eq(
    $ G(z)=m(1-z+m z)^(k-1)(1-z)^(-k-1)z^k, $,
  ) <eq:matrix-selection-generating>
  _and, for fixed $m,k$,_
  #eq($ g_(n k)(m) ∼ frac((n m)^k, k!) $) <eq:matrix-selection-asymptotic>
  _as $n arrow.r infinity$._
] <th:matrix-selection-generating>

#proof[
  It was shown in #bib-ref("Abramson1966") that #eq(
    $ g_(n k)(m)=sum_(r=1)^k m^r binom(k-1, r-1)binom(n-k+1, r). $,
  ) <eq:matrix-selection-exact-count>
  Indeed, if the selected rows form $r$ maximal runs, their positive lengths can
  be chosen in $binom(k-1, r-1)$ ways. The gaps place them in $binom(n-k+1, r)$
  ways. Each run has one common column, chosen independently in $m$ ways.

  #block(sticky: true)[
    Replacing $r$ by $r+1$ in @eq:matrix-selection-exact-count, and then making
    the substitution $v=z/(1-z)$ under the residue sign, gives
  ]
  $
    g_(n k)(m) & = sum_(r=0)^(k-1)m^(r+1)res_(u v)
                 (1+u)^(k-1)(1+v)^(n-k+1)u^(-r-1)v^(-n+k+r-1) \
               & = m res_v (1+m v)^(k-1)(1+v)^(n-k+1)v^(-n+k-1) \
               & = m res_z (1-z+m z)^(k-1)(1-z)^(-k-1)z^(k-n-1),
  $
  which proves @eq:matrix-selection-generating.

  #source(153, "141")
  To obtain @eq:matrix-selection-asymptotic from @th:generating-function-limit,
  put $g_(n k)(m)=0$ for $0<=n<k$. For every $n>=1$,
  $
    n lr((g_(n k)(m)-g_(n-1,k)(m)))
    &= n m res_z (1+(m-1)z)^(k-1)(1-z)^(-k)z^(-n+k-1) \
    &>=0,
  $
  since the relevant power series have nonnegative coefficients. Thus
  @eq:tauberian-difference-bound holds. Moreover,
  $ lim_(z arrow.r 1^-) (1-z)^(k+1)G(z)=m^k, $
  so @eq:tauberian-coefficient-limit with $alpha=k$ gives the asserted estimate.
]
