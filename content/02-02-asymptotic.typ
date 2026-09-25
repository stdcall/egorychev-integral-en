#import "statements.typ": example, remark, theorem
#import "book-style.typ": keep-next, keep-together
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(78, "66")
Formulas @eq:binomial-finite-integral and @eq:binomial-infinite-integral enable
us to obtain asymptotic representations for sums of the form
@eq:binomial-parameter-sum. Let $P$ be the zero set of a fixed nonzero
polynomial $cal(P)(w)$, and let $Gamma$ be a closed contour about the origin,
avoiding $P union {0}$.

#theorem[
  _Let $n$ tend to infinity through positive integers, and let $k=k(n)$ be an
  integer. Suppose that for every sufficiently large $n$ a positive solution
  $rho=rho_(n,k)$ of the equation_
  #eq(
    $ (n rho-k(1+rho))cal(P)(rho)-rho(1+rho)cal(P)'(rho)=0 $,
  ) <eq:saddle-equation>
  _exists. Assume that these solutions lie in a fixed interval $[a,b]$ with
  $0<a<b<infinity$, and that $cal(P)$ has no zeros in the closed annulus
  $a<=abs(w)<=b$. Assume also that the positively oriented circles
  $Gamma_(n,k)={w:abs(w)=rho_(n,k)}$ are homologous to $Gamma$ in
  $CC backslash (P union {0})$. Then the integral_
  #eq(
    $
      J=frac(1, 2pi i)integral_Gamma
      frac((1+w)^n, w^(k+1)cal(P)(w))dif w
    $,
  ) <eq:saddle-integral>
  #keep-next[_admits the uniform asymptotic representation_]
  #eq(
    $
      J=frac(
        (1+rho_(n,k))^(n+1),
        sqrt(2pi n)rho_(n,k)^(k+1/2)cal(P)(rho_(n,k))
      )
      (1+O(n^(-1/2))).
    $,
  ) <eq:saddle-estimate>
  The annulus condition is a sufficient separation hypothesis. In particular,
  @eq:saddle-equation then gives $k/n=rho/(1+rho)+O(n^(-1))$, so that $k/n$
  stays away from both $0$ and $1$.
] <th:saddle-equation>

The saddle-point scheme referred to in the original argument is that of
#bib-ref("Good1957"), Theorem 6.1.#editorial-note("saddle-hypotheses")[
  For the general method and higher-order expansions, see #cite(
    <Flajolet2009>,
    supplement: [Theorem VIII.3, p. 553; proof of Theorem VIII.8, p. 588],
  ).
] Under the hypotheses just stated, it can be carried out directly. Parametrize
the circle by $w=rho e^(i theta)$ and put $B=n rho/(1+rho)^2$. After dividing
the integrand by its value at $theta=0$, its local logarithm has the expansion
$
  -frac(B, 2)theta^2+O(theta^2)+c_3 theta^3+O(n theta^4),
  quad c_3=O(n).
$
The linear term vanishes by @eq:saddle-equation. All bounds are uniform in
$rho in [a,b]$. Moreover,
$
  abs(frac(1+rho e^(i theta), 1+rho))^2
  =1-frac(4rho, (1+rho)^2)sin^(2)(theta/2),
$
whereas $frac(cal(P)(rho), cal(P)(rho e^(i theta)))$ is uniformly bounded.
Consequently the part $abs(theta)>n^(-2/5)$ is exponentially small. In the
remaining integral the cubic term is odd and integrates to zero on the symmetric
interval. The quadratic correction, quartic remainder and square of the cubic
term contribute a relative $O(n^(-1))$. Completing the Gaussian integral gives
the factor $1/sqrt(2pi B)$.

#remark[
  In fact the same argument gives
  $
    J=frac(
      (1+rho_(n,k))^(n+1),
      sqrt(2pi n)rho_(n,k)^(k+1/2)cal(P)(rho_(n,k))
    )
    (1+O(n^(-1))).
  $
  Under these separation hypotheses, no additional assumption that $J$ be real
  is needed. A saddle approaching a zero of $cal(P)$ requires a separate uniform
  estimate, as in the following example.
]

#example(suffix: [])[
  (see, for example, #bib-ref("Feller1957"), Chapter VII, §5, (5.2)). Let #eq(
    $ S=sum_(i=0)^k binom(n, i)p^(i)(1-p)^(n-i), quad 0<p<1. $,
  ) <eq:binomial-tail>
  Here $p$ is fixed and $k$ is an integer. We show that, if
  $k=n p-x sqrt(n p(1-p))$, $n arrow.r infinity$, $x arrow.r infinity$, and
  $x^3/sqrt(n) arrow.r 0$, then #eq(
    $ S tilde frac(1, sqrt(2pi)x)e^(-x^2/2). $,
  ) <eq:normal-tail-estimate>
  The parameter $x$ is defined by the displayed relation with the integer $k$.
  Equivalently, one may round a prescribed cutoff down to an integer; the
  resulting change in $x$ does not affect this equivalence.

  Write $q=1-p$ and $a=p/q$. According to @th:binomial-parameter-sum, for a
  positively oriented circle $Gamma_r$ of radius $0<r<a$,
  $
    S=-q^(n-k-1)p^(k+1)frac(1, 2pi i)integral_(Gamma_r)
    frac((1+z)^n, z^(k+1)(z-a))dif z.
  $
  #source(79, "67")
  In this case the saddle equation @eq:saddle-equation becomes
  $
    (n-k-1)rho^2-((n-k)a+k+1)rho+k a=0.
  $
  For all sufficiently large $n$, its smaller root is
  $
    rho_(n,k)=frac(A-sqrt(A^2-4k a(n-k-1)), 2(n-k-1)),
    quad A=(n-k)a+k+1.
  $
  Put $t=k/n$ and $r_0=t/(1-t)$. The quadratic is positive at $0$ and negative
  at $r_0$, while $r_0<a$; hence $0<rho_(n,k)<r_0<a$. Its equation also gives
  $
    r_0-rho_(n,k)=O(frac(1, x sqrt(n))), quad
    a-rho_(n,k) tilde frac(sqrt(p), q^(3/2))frac(x, sqrt(n)).
  $
  The saddle therefore approaches the pole, and the annulus hypothesis of
  @th:saddle-equation does not hold. The following argument supplies the needed
  uniform estimate.

  #keep-next[
    Let $b_j=binom(n, j)p^j q^(n-j)$ and $r=t q/((1-t)p)=r_0/a<1$. For
    $0<=j<=k$,
  ]
  $
    frac(b_(k-j), b_k)=r^j product_(ell=0)^(j-1)
    frac(1-ell/k, 1+(ell+1)/(n-k)).
  $
  Each factor in the product is at most $1$. Since $k$ and $n-k$ are both of
  order $n$, the difference between this product and $1$ is at most $C j^2/n$,
  with $C$ independent of $n$ and $j$. The same bound applies if the product is
  set equal to zero for $j>k$. Summing the resulting bounds against $r^j$ gives
  $
    frac(S, b_k)=frac(1, 1-r)
    (1+O(frac(1, n(1-r)^2)))
    =frac(1, 1-r)(1+O(x^(-2))).
  $
  Stirling's formula, uniformly for $t$ near $p$, gives
  $
    b_k=frac(e^(-n D(t parallel p)), sqrt(2pi n t(1-t)))
    (1+O(n^(-1))),
  $
  where
  $
    D(t parallel p)=t ln(t/p)+(1-t)ln((1-t)/q).
  $
  Now $n D(t parallel p)=x^2/2+O(x^3/sqrt(n))$ and $1-r=(p-t)/((1-t)p)$. Thus
  $
    S=frac(e^(-x^2/2), sqrt(2pi)x)
    (1+O(x^(-2)+x^3/sqrt(n))),
  $
  which proves @eq:normal-tail-estimate.

  The same calculation also justifies the form of the original saddle-point
  argument. Stirling's formula and the estimate for $r_0-rho_(n,k)$ yield
  $
    S=-q^(n-k-1)p^(k+1)
    frac(
      (1+rho_(n,k))^(n+1),
      sqrt(2pi n)rho_(n,k)^(k+1/2)(rho_(n,k)-a)
    )
    (1+O(x^(-2))).
  $
  Set $alpha=q rho_(n,k)-p$ and $beta=q rho_(n,k)/p-1$, so that $alpha=p beta$.
  Then
  $
    ln frac((1+rho_(n,k))^(n+1), rho_(n,k)^(k+1/2))
    &=(n+1)(-ln q+ln(1+alpha)) \
    &quad -(k+1/2)(ln(p/q)+ln(1+beta)).
  $
  #keep-next[
    Both $alpha$ and $beta$ tend to zero. Expansion of the logarithms, retaining
    the remainders, gives
  ]
  $
    ln frac((1+alpha)^(n+1), (1+beta)^(k+1/2))
    =-x^2/2+O(x^3/sqrt(n)+x^(-2)),
  $
  and
  $
    frac(1, sqrt(n)(rho_(n,k)-p/q))
    tilde -frac(q^(3/2), sqrt(p)x).
  $
  Together these estimates again give @eq:normal-tail-estimate.
] <ex:binomial-tail>
