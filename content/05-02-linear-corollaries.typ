#import "index-style.typ": index-mark
#import "statements.typ": corollary, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(172, "160")
#heading(level: 2)[
  Sums with linear constraints on the summation indices
] <sec:linear-constraints>

Multidimensional sums with constrained indices occur in enumeration problems,
especially in graph theory (see the problems in §@sec:multivariate-problems). To
handle linear constraints we introduce additional weight variables. This
increases the dimension of the integrals and reduces the problem to a sum with
independent indices.

#theorem(suffix: [])[
  #bib-ref("Egorychev1975a"). Let #eq(
    $
      S_m=-sum_(J in H_(n m)(A))
      (j_1+dots+j_n-1)!/(j_1! dots j_n!)
      product_(r=1)^n (-beta_r)^(j_r),
    $,
  ) <eq:linear-constraint-sum>
  where $m=(m_1,dots,m_k)$, $A=(a_(r l))$ is an $n times k$ matrix, every $m_l$
  and $a_(r l)$ is a positive integer, and
  $
    H_(n m)(A)={J=(j_1,dots,j_n) in NN^n: J != 0, J A<=m}.
  $
  The coordinates of $J$ are nonnegative integers. The inequality is
  componentwise and $beta_1,dots,beta_n$ are complex numbers. Then the
  generating series
  $
    sum_(m_1,dots,m_k=1)^infinity S_(m_1,dots,m_k)t_1^(m_1) dots t_k^(m_k)
  $


  #source(173, "161")
  converges in a neighborhood of the origin, and its sum is #eq(
    $
      F(t)=F(t_1,dots,t_k)=lr((product_(l=1)^k (1-t_l)^(-1)))
      ln f(t_1,dots,t_k),
    $,
  ) <eq:linear-constraint-generating-function>
  where
  $
    f(t_1,dots,t_k)=1+sum_(r=1)^n beta_r product_(l=1)^k t_l^(a_(r l)).
  $
  The logarithm is the branch analytic near $f(0)=1$, with $ln 1=0$.

  From @eq:linear-constraint-generating-function with $k=1$ we obtain the
  following corollary.
] <th:linear-constraint-sum>

#corollary[
  Let $m,alpha_1,dots,alpha_n$ be positive integers with
  $alpha_1<=dots<=alpha_n$, and put #eq(
    $
      K_(n m)(alpha_1,dots,alpha_n)
      ={J in NN^n:alpha_1 j_1+dots+alpha_n j_n=m}.
    $,
  ) <eq:linear-index-set>
  #index-mark([@eq:linear-index-set], group: [Identities], after: [Wu])[With
    linear constraints on summation indices]
  #keep-next[
    Let $q,beta_1,dots,beta_n$ be complex numbers, $p>0$ a real number, and
    $B_m$ the Bernoulli numbers. We use the convention $0^0=1$. Then
  ]
  #eq(
    $
      & sum_(J in K_(n m)(alpha_1,dots,alpha_n))
        (j_1+dots+j_n-1)!/(j_1! dots j_n!)
        product_(r=1)^n (-beta_r)^(j_r) \
      & =1/m sum_(r=1)^d x_r^(-m),
    $,
  ) <eq:power-root-sum>
  where $x_1,dots,x_d$ are the roots, counted with multiplicity, of
  $ P(x)=1+sum_(r=1)^n beta_r x^(alpha_r). $
  Here $d=deg P<=alpha_n$; if $P=1$, the root sum is empty. In addition, #eq(
    $
      & sum_(J in K_(n m)(1,dots,n))
        (j_1+dots+j_n-1)!/(j_1! dots j_n!)
        product_(r=1)^n lr((-q^r binom(p+r-1, r)))^(j_r) \
      & =-p/m q^m, quad m=1,dots,n;
    $,
  ) <eq:negative-binomial-log-sum>
  #eq(
    $
      & sum_(J in K_(n m)(1,dots,n))
        (j_1+dots+j_n-1)!/(j_1! dots j_n!)
        product_(r=1)^n lr((-q^r binom(n, r)))^(j_r) \
      & =n/m (-q)^m, quad m>=1;
    $,
  ) <eq:binomial-log-sum>
  and #eq(
    $
      & sum_(J in K_(n m)(1,dots,n))
        (j_1+dots+j_n-1)!/(j_1! dots j_n!)
        product_(r=1)^n lr((-q^r/r!))^(j_r) \
      & =cases(-q &quad m=1, 0 &quad 2<=m<=n).
    $,
  ) <eq:exponential-log-sum>
  #index-mark([@eq:exponential-log-sum], group: [Identities], after: [Wu])[With
    linear constraints on summation indices]
]

#source(174, "162")
For $1<=m<=n$, take $beta_r=(-1)^(r/2)/r!$ for even $r$ and $beta_r=0$ for odd
$r$. Then #eq(
  $
    & sum_(J in K_(n m)(1,dots,n))
      (j_1+dots+j_n-1)!/(j_1! dots j_n!)
      product_(r=1)^n (-beta_r)^(j_r) \
    & =cases(
        0 & quad m "odd",
        ((-1)^(m/2+1)2^m (2^m-1))/(m dot m!)B_m & quad m "even"
      ).
  $,
) <eq:secant-log-sum>
#keep-next[Next, for $k=0,1,dots$, define]
$
  beta_(2k+1) & =q/(2k+1)! product_(j=1)^k (q^2-(2j-1)^2), \
  beta_(2k+2) & =q^2/(2k+2)! product_(j=1)^k (q^2-(2j)^2).
$
In particular, $beta_1=q$ and $beta_2=q^2/2$. For $1<=m<=n$, #eq(
  $
    & sum_(J in K_(n m)(1,dots,n))
      (j_1+dots+j_n-1)!/(j_1! dots j_n!)
      product_(r=1)^n (-beta_r)^(j_r) \
    & =cases(
        ((-1)^(floor(m/2)+1)q (m-1)!)/
        (2^(m-1)(floor(m/2)!)^2 m) & quad m "odd",
        0 & quad m "even"
      ).
  $,
) <eq:inverse-sine-log-sum>
#index-mark([@eq:inverse-sine-log-sum], group: [Identities], after: [Wu])[With
  linear constraints on summation indices]
Finally, let $E_r$ be the Euler numbers and put $beta_r=0$ for odd $r$ and
$beta_r=|E_r|/r!$ for even $r$. For $1<=m<=n$, #eq(
  $
    & sum_(J in K_(n m)(1,dots,n))
      (j_1+dots+j_n-1)!/(j_1! dots j_n!)
      product_(r=1)^n (-beta_r)^(j_r) \
    & =cases(
        0 & quad m "odd",
        ((-1)^(m/2)2^m (2^m-1))/(m dot m!)B_m & quad m "even"
      ).
  $,
) <eq:cosine-log-sum>
#index-mark([@eq:cosine-log-sum], group: [Identities], after: [Wu])[With linear
  constraints on summation indices]

#source(175, "163")
#keep-next[The Sheehan identity #bib-ref("Sheehan1970"),]
#eq(
  $
    sum_(J in K_(n n)(1,dots,n))(-1)^(j_1+dots+j_n-1)
    (j_1+dots+j_n-1)!/(j_1! dots j_n!)=1/n,
  $,
) <eq:composition-log-sum>
#index-mark([@eq:composition-log-sum], group: [Identities])[Sheehan]
follows by taking the coefficient of degree $n$ in $ln(1+t+dots+t^n)$, with
$k=1$, $m=n$, $beta_r=1$, and $alpha_r=r$ for $r=1,dots,n$.
