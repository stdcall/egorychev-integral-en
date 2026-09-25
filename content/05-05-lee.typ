#import "index-style.typ": index-mark
#import "equations.typ": equation-alias
#import "statements.typ": proof, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, res, source

#source(193, "181")
#heading(level: 3)[A generalization of Lee's identity] <sec:lee-identity>
#index-mark([@sec:lee-identity], group: [Identities])[Lee]

The following generalization of Lee's identity, which arises in the theory of
bichromatic graphs, was obtained in #bib-ref("Gould1967"): #eq(
  $S=sum_(i=0)^n sum_(j=0)^n (-1)^(i+j)binom(n, i)binom(n, j)
  binom(alpha+i j, n)=n!,$,
) <eq:lee-identity>
where $alpha$ and $n$ are nonnegative integers. The case $alpha=0$ is Lee's
identity.

To compute the left side, apply the substitution rule:
$
  S & = sum_(i,j=0)^n lr((res_u (1-u)^n u^(-i-1)))
      lr((res_v (1-v)^n v^(-j-1))) \
    & quad times res_w (1+w)^(alpha+i j)w^(-n-1) \
    & = sum_(i=0)^n res_(u,w) (1-u)^n (1+w)^alpha
      lr((1-(1+w)^i))^n u^(-i-1)w^(-n-1).
$
#source(194, "182")
For $i>=1$, we have $1-(1+w)^i=-i w lr((1+(i-1)w/2+dots))$. Consequently, #eq(
  $
    & res_w (1+w)^alpha lr((1-(1+w)^i))^n w^(-n-1) \
    & =res_w (1+w)^alpha (-i w)^n
      lr((1+frac(i-1, 2)w+dots))^n w^(-n-1)=(-i)^n.
  $,
) <eq:lee-inner-residue>
The same result holds for $i=0$ when $n>=1$, since both sides vanish. If $n=0$,
@eq:lee-identity is immediate. For $n>=1$, another application of the
substitution rule gives #eq(
  $
    S & =sum_(i=0)^n res_u (1-u)^n (-i)^n u^(-i-1) \
      & =n!sum_(i=0)^n res_(u,v) (1-u)^n e^(-i v)
        v^(-n-1)u^(-i-1) \
      & =n!res_v (1-e^(-v))^n v^(-n-1)=n!,
  $,
) <eq:lee-outer-residue>
which proves @eq:lee-identity.

The key step is @eq:lee-inner-residue, whose value is independent of $alpha$.
Varying the integral representations used for $(-i)^n$ leads to the following
more general identities.

#theorem(suffix: [])[
  #bib-ref("Egorychev1974c"). _Let $a,b,c,d,k,m,n$ be positive integers, and
  define_ #eq(
    $
      A=A_(n,m,k,a,b,c,d) \
      =sum_(i=0)^n sum_(j=0)^m (-1)^(i+j)binom(n, i)binom(m, j)
      binom(a i j+b i+c j+d, k),
    $,
  ) <eq:lee-binomial-sum>
  #eq(
    $
      B=B_(n,m,k,a,b,c,d) \
      =sum_(i=0)^n sum_(j=0)^m (-1)^(i+j)binom(n, i)binom(m, j)
      frac((a i j+b i+c j+d)^k, k!).
    $,
  ) <eq:lee-power-sum>
  #keep-next[_Then_]
  #block(breakable: false)[
    #equation-alias(<eq:lee-values>) <eq:lee-power-values>
    #eq(
      count: 2,
      $
        A=B=cases(
          0 & "if" k<min(m, n),
          a^n n! & "if" k=m=n,
          (-1)^(m+n)n!s_(2)^((c))(m,n,a) & "if" k=m>n.
        )
      $,
    ) <eq:lee-values>
  ]
  Here the generalized Stirling numbers use the convention of #link(
    <app:table-m>,
  )[Table M]:
  $
    n!s_(2)^((c))(m,n,a)
    =sum_(i=0)^n (-1)^(n-i)binom(n, i)(a i+c)^m.
  $
] <th:lee-binomial-sum>

#proof[
  Each summand in @eq:lee-binomial-sum or @eq:lee-power-sum, before the binomial
  weights are applied, is a polynomial of degree at most $k$ in each variable.
  An alternating binomial sum of order $r$ annihilates polynomials of degree
  less than $r$; this gives the first case. For $k=m$, the coefficient of $j^m$
  in either polynomial is $(a i+c)^m/m!$. Summing over $j$ therefore gives
  $
    A=B=(-1)^m sum_(i=0)^n (-1)^i binom(n, i)(a i+c)^m
    =(-1)^(m+n)n!s_(2)^((c))(m,n,a).
  $
  When $m=n$, only the leading term $a^n i^n$ survives the remaining alternating
  sum, giving $a^n n!$.
]
