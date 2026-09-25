#import "statements.typ": proof, remark, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, res, source

#source(175, "163")
#theorem(suffix: [])[
  #bib-ref("Egorychev1975a"). Let $n=(n_1,dots,n_k)$ have positive integer
  coordinates, and let $alpha_1,dots,alpha_k$ and $beta != 0$ be complex
  numbers. Put
  $
        I_n & ={r=(r_1,dots,r_k):0<=r_i<=n_i, r_i in ZZ, |r|>=1}, \
    R_(n k) & ={J=(j_r)_(r in I_n):j_r in NN,
                sum_(r in I_n)r_i j_r=n_i " for every " i}.
  $
  #keep-next[
    Here $|r|=sum_(i=1)^k r_i$, $r! =r_1! dots r_k!$, and all $j_r$ are
    nonnegative integers. Then
  ]
  #eq(
    $
      & sum_(J in R_(n k)) product_(r in I_n)
        (beta^(j_r)lr((sum_(i=1)^k alpha_i r_i))^(j_r (|r|-1)))/
        ((r!)^(j_r)j_r!) \
      & =beta (beta+sum_(i=1)^k alpha_i n_i)^(|n|-1)/(n_1! dots n_k!),
    $,
  ) <eq:multivariate-forest-identity>
  where $0^0=1$. In particular, #eq(
    $
      sum_(J in K_(n n)(1,dots,n)) n!/(j_1! dots j_n!)
      product_(r=1)^n lr((r^(r-1)/r!))^(j_r)=(n+1)^(n-1).
    $,
  ) <eq:rooted-forest-identity>
] <th:multivariate-forest-identity>

#remark[
  Formula @eq:rooted-forest-identity follows from
  @eq:multivariate-forest-identity with $k=1$ and $beta=alpha_1=1$. Its
  right-hand side counts labelled trees on $n+1$ vertices. The corresponding
  exponential generating function for rooted labelled trees is
  $
    Theta(t)=sum_(n=1)^infinity n^(n-1)/n! t^n.
  $
  The decomposition of a rooted tree into its root and an unordered set of
  rooted subtrees gives #eq(
    mark: "*",
    $ Theta(t)=t exp(Theta(t)). $,
  ) <eq:rooted-tree-equation>
  This is also the relation implicit in @eq:rooted-forest-generating-function,
  after multiplication by $t$. It gives $n^(n-1)$ rooted labelled trees on $n$
  vertices; forgetting the root divides the count by $n$ and gives $n^(n-2)$
  unrooted labelled trees (see also #bib-ref("Ramanujacharyulu1969")).
]

#proof(title: [Proof of @th:linear-constraint-sum])[
  Let #eq(
    $
      T_m=T_(m_1,dots,m_k)=-sum_(J in K_(n m)(A))
      (j_1+dots+j_n-1)!/(j_1! dots j_n!)
      product_(r=1)^n (-beta_r)^(j_r),
    $,
  ) <eq:exact-linear-constraint-sum>
  where
  $
    K_(n m)(A) & ={J in NN^n:J A=m}, \
        Phi(t) & =sum_(m_1,dots,m_k=1)^infinity T_m t_1^(m_1) dots t_k^(m_k).
  $

  #source(176, "164")
  #keep-next[
    The sets
    $
      K_(n m)^(s)(A)={J in NN^n:|J|=s, J A=m}, quad s=1,2,dots,
    $
    are pairwise disjoint and their union is $K_(n m)(A)$. Consequently,
  ]
  $
    Phi(t) & =-sum_(m_1,dots,m_k=1)^infinity t^m sum_(s=1)^infinity \
           & quad times sum_(J in K_(n m)^(s)(A))
             (-1)^s/s (j_1+dots+j_n)!/(j_1! dots j_n!)
             product_(r=1)^n beta_r^(j_r),
  $
  where $t^m=t_1^(m_1) dots t_k^(m_k)$. Following the computation scheme in
  @sec:computation-algorithm, use
  $
        (-1)^s/s & =-1/(2pi i) integral_(Gamma(rho_1))
                   w^(-s-1)ln(1+w)dif w, quad s>=1, \
    Gamma(rho_1) & ={w:|w|=rho_1}, quad 0<rho_1<1,
  $
  and, for $|J|=s$,
  $
    & product_(r=1)^n beta_r^(j_r)
      (j_1+dots+j_n)!/(j_1! dots j_n!) \
    & =1/(2pi i)^n integral_(Gamma(rho_2))
      lr((sum_(r=1)^n beta_r z_r))^s
      product_(r=1)^n z_r^(-j_r-1)dif z,
  $
  where
  $ Gamma(rho_2)={z:|z_r|=rho_2, r=1,dots,n}. $
  Introduce $k$ weight variables $tau=(tau_1,dots,tau_k)$ and write
  $
        P(z,tau) & =sum_(r=1)^n beta_r z_r product_(l=1)^k tau_l^(a_(r l)), \
    Gamma(rho_3) & ={tau:|tau_l|=rho_3, l=1,dots,k}.
  $
  Coefficient extraction in these variables enforces $J A=m$. Write
  $
    z^(-J-1)=product_(r=1)^n z_r^(-j_r-1), quad
    tau^(-m-1)=product_(l=1)^k tau_l^(-m_l-1).
  $
  #keep-next[We obtain]
  #eq(
    $
      Phi(t) & =sum_(m_1,dots,m_k>=0)t^m sum_(s=0)^infinity
               sum_(j_1,dots,j_n>=0) \
             & quad times lr(
                 (1/(2pi i) integral_(Gamma(rho_1))
                   ln(1+w)w^(-s-1)dif w)
               ) \
             & quad times 1/(2pi i)^(n+k)
               integral_(Gamma(rho_2) times Gamma(rho_3))
               P(z,tau)^s z^(-J-1)tau^(-m-1)dif z ∧ dif tau.
    $,
  ) <eq:logarithmic-multiple-integral>
  The new terms with $s=0$ vanish because $ln(1+w)$ has zero constant term. For
  $s>=1$, positivity of every $a_(r l)$ makes terms with a zero coordinate of
  $m$ vanish as well. The coefficient in $z$ enforces $|J|=s$.

  Choose radii with $0<r_1<rho_1<1$, $1<r_2<rho_2$, and $0<r_3<rho_3<1$, so
  small in the last pair that
  $
    rho_2 sum_(r=1)^n |beta_r|rho_3^(sum_(l=1)^k a_(r l))<r_1.
  $
  Finally choose $0<rho<r_3$ and restrict $|t_l|<=rho$. Summing the geometric
  series in @eq:logarithmic-multiple-integral gives #eq(
    $
      Phi(t) & =1/(2pi i)^(n+k+1)
               integral_(Gamma(rho_3)) integral_(Gamma(rho_1))
               integral_(Gamma(rho_2)) (ln(1+w))/(w-P(z,tau)) \
             & quad times product_(r=1)^n (z_r-1)^(-1)
               product_(l=1)^k (tau_l-t_l)^(-1)dif z ∧ dif w ∧ dif tau.
    $,
  ) <eq:logarithmic-reduced-integral>

  #source(177, "165")
  Indeed, on the closed domain
  $
    r_1<=|w|<=rho_1, quad r_2<=|z_r|<=rho_2, quad
    r_3<=|tau_l|<=rho_3, quad |t_l|<=rho,
  $
  the ratios $P(z,tau)/w$, $1/z_r$, and $t_l/tau_l$ are uniformly bounded in
  modulus by constants less than $1$. The sums therefore converge uniformly
  absolutely, which justifies interchanging them with the integrals.

  Apply Cauchy's formula successively in $z$, $w$, and $tau$ (compare #bib-ref(
    "Shabat1969",
  ), pp. 42–43). The first integrals substitute $z_r=1$; the next substitutes
  $w=P(1,tau)$, which lies inside $|w|=rho_1$; the final integrals substitute
  $tau_l=t_l$. Thus, for all $t$ sufficiently close to the origin, #eq(
    $
      Phi(t_1, dots, t_k)=ln lr(
        (1+sum_(r=1)^n beta_r
          product_(l=1)^k t_l^(a_(r l)))
      ).
    $,
  ) <eq:linear-constraint-logarithm>
  The set $H_(n m)(A)$ is the disjoint union of $K_(n p)(A)$ over all $p$ with
  $1<=p_l<=m_l$ for every $l$. Hence $S_m=sum_(1<=p<=m)T_p$, and
  $
    F(t)=Phi(t)product_(l=1)^k (1-t_l)^(-1).
  $
  Together with @eq:linear-constraint-logarithm, this proves
  @th:linear-constraint-sum.
]

#proof(title: [Proof of the corollary])[
  For the equality constraints in @eq:linear-index-set,
  @th:linear-constraint-sum and @eq:linear-constraint-logarithm with $k=1$ give,
  for $m>=1$, #eq(
    $
      res_t ln(f(t))t^(-m-1) & =-sum_(J in K_(n m)(alpha_1,dots,alpha_n)) \
                             & quad times (j_1+dots+j_n-1)!/(j_1! dots j_n!)
                               product_(r=1)^n (-beta_r)^(j_r),
    $,
  ) <eq:polynomial-log-coefficient>
  where $f(t)=1+sum_(r=1)^n beta_r t^(alpha_r)$ and the logarithm is the branch
  at $f(0)=1$ with value $0$. Let $d=deg f$. If $d=0$, both sides of
  @eq:power-root-sum vanish. Otherwise, write the nonzero roots as
  $x_1,dots,x_d$, with multiplicities, and put $x^0=min_r |x_r|$. Then
  $f(x)=product_(r=1)^d (1-x/x_r)$.

  #source(178, "166")
  For $|x|<x^0$, the analytic logarithms normalized at $0$ satisfy
  $
    res_x ln(f(x))x^(-m-1) & =res_x ln lr((product_(r=1)^d (1-x/x_r)))x^(-m-1) \
                           & =-res_x x^(-m-1)sum_(r=1)^d
                             sum_(j=1)^infinity 1/j lr((x/x_r))^j \
                           & =-1/m sum_(r=1)^d x_r^(-m),
  $
  which proves @eq:power-root-sum.

  For the remaining identities with $m<=n$, only the coefficients of $f$ through
  degree $n$ are relevant in @eq:polynomial-log-coefficient. We may therefore
  use the corresponding full analytic series. Taking $f(t)=(1-q t)^(-p)$ gives,
  for $|q t|<1$,
  $
    (1-q t)^(-p) & =1+sum_(r=1)^infinity binom(p+r-1, r)(q t)^r, \
         ln f(t) & =-p ln(1-q t)=p sum_(m=1)^infinity (q t)^m/m,
  $
  #keep-next[which proves @eq:negative-binomial-log-sum. Similarly, for
    $f(t)=(1+q t)^n$,]
  $
    (1+q t)^n & =sum_(r=0)^n binom(n, r)(q t)^r, \
      ln f(t) & =n ln(1+q t)=-n sum_(m=1)^infinity (-q t)^m/m,
  $
  #keep-next[
    locally at $0$, proving @eq:binomial-log-sum. For $f(t)=exp(q t)$,
  ]
  $
    exp(q t)=1+sum_(r=1)^infinity (q t)^r/r!, quad ln f(t)=q t,
  $
  with the same local logarithm, proving @eq:exponential-log-sum.

  For @eq:secant-log-sum, @eq:inverse-sine-log-sum, and @eq:cosine-log-sum, use,
  respectively,
  $
    f(t)=cos t, quad
    f(t)=lr((t+sqrt(1+t^2)))^q=exp(q op("arsinh")t), quad
    f(t)=sec t,
  $
  with branches fixed at $t=0$. Expand $f$ and its analytic logarithm in power
  series; the relevant series are listed in #bib-ref("Gradshtein1963"), formulas
  (1.411.3), (1.518.2), (1.114.2), (1.514.2), (1.641.2), and (1.411.9). For the
  middle function, the equation $(1+t^2)f''+t f'-q^2 f=0$, with $f(0)=1$ and
  $f'(0)=q$, gives exactly the products defining $beta_r$. Also
  $ln f=q op("arsinh")t$ and
  $
    op("arsinh")t=sum_(j=0)^infinity
    ((-1)^j (2j)!)/(2^(2j)(j!)^2 (2j+1))t^(2j+1),
  $
  which gives @eq:inverse-sine-log-sum.
]

#proof(title: [Proof of @th:multivariate-forest-identity for $k=1$])[
  Set #eq(
    $
      S_n=sum_(J in K_(n n)(1,dots,n)) n!/(j_1! dots j_n!)
      product_(r=1)^n lr((r^(r-1)/r!))^(j_r), quad n>=1.
    $,
  ) <eq:rooted-forest-sum>

  #source(179, "167")
  As in the proof of @th:linear-constraint-sum, write
  $
    1/j_r! lr((r^(r-1)/r!))^(j_r)
    =1/(2pi i)integral_(Gamma_(r)(rho))
    exp lr((r^(r-1)/r! w_r))w_r^(-j_r-1)dif w_r,
  $
  #keep-next[
    where $Gamma_(r)(rho)={w_r:|w_r|=rho}$ and $rho>1$. Introduce the weight
    variable $t$ to enforce $sum_r r j_r=n$, and put
  ]
  $
    Gamma(tau) & ={t:|t|=tau}, \
    Gamma(rho) & ={w:|w_r|=rho, r=1,dots,n}, \
    Q_(n)(w,t) & =sum_(r=1)^n r^(r-1)/r! w_r t^r.
  $
  #keep-next[Then]
  $
    S_n & =sum_(j_1,dots,j_n>=0)n!/(2pi i)integral_(Gamma(tau))t^(-n-1) \
        & quad times product_(r=1)^n lr(
            (1/(2pi i)integral_(Gamma_(r)(rho))
              exp lr((r^(r-1)/r! t^r w_r))w_r^(-j_r-1)dif w_r)
          )dif t \
        & =n!/(2pi i)^(n+1)integral_(Gamma(tau))t^(-n-1)
          integral_(Gamma(rho))exp(Q_(n)(w,t)) \
        & quad times sum_(j_1,dots,j_n>=0)product_(r=1)^n
          w_r^(-j_r-1)dif w ∧ dif t \
        & =n!/(2pi i)^(n+1)integral_(Gamma(tau))t^(-n-1)
          integral_(Gamma(rho)) \
        & quad times product_(r=1)^n (w_r-1)^(-1)exp(Q_(n)(w,t))dif w ∧ dif t \
        & =n!/(2pi i)integral_(Gamma(tau))t^(-n-1)
          exp lr((sum_(r=1)^n r^(r-1)/r! t^r))dif t.
  $
  Here the multiple geometric series
  $
    sum_(j_1,dots,j_n>=0)product_(r=1)^n w_r^(-j_r-1)
    =product_(r=1)^n (w_r-1)^(-1)
  $
  converges uniformly absolutely on any closed product annulus
  $1<r_1<=|w_r|<=rho$. The integrals in $w$ are Cauchy evaluations at $w_r=1$.

  #keep-next[
    Choose $0<tau<1/e$. The infinite tree series converges on this contour, and
    its terms of degree above $n$ cannot affect the coefficient of degree $n$
    after exponentiation. Therefore
  ]
  $
    S_n & =n!/(2pi i)integral_(Gamma(tau))t^(-n-1)
          exp lr((sum_(r=1)^n r^(r-1)/r! t^r))dif t \
        & =n!/(2pi i)integral_(Gamma(tau))t^(-n-1)
          exp lr((sum_(r=1)^infinity r^(r-1)/r! t^r))dif t,
  $
  and hence #eq(
    $
      A(t)=1+sum_(n=1)^infinity S_n/n! t^n
      =exp lr((sum_(n=1)^infinity n^(n-1)/n! t^n)).
    $,
  ) <eq:rooted-forest-generating-function>

  #source(180, "168")
  #keep-next[
    For $t=z exp(-z)$, the inverse near $0$ is given by Lagrange's formula:
  ]
  #eq(
    $
               z=phi(t) & =sum_(n=1)^infinity n^(n-1)/n! t^n, \
      exp z=exp(phi(t)) & =1+sum_(n=1)^infinity (n+1)^(n-1)/n! t^n.
    $,
  ) <eq:rooted-tree-series>
  Combining this with @eq:rooted-forest-generating-function yields
  $
    A(t)=1+sum_(n=1)^infinity S_n/n! t^n
    =1+sum_(n=1)^infinity (n+1)^(n-1)/n! t^n,
  $
  and so $S_n=(n+1)^(n-1)$ for $n>=1$, as asserted in
  @eq:rooted-forest-identity.

  For the general case @eq:multivariate-forest-identity, let $U(t)$ be the
  solution near the origin, with $U(0)=0$, of
  $
    U=sum_(i=1)^k t_i exp(alpha_i U).
  $
  To compute a coefficient of total degree $N$, replace $t$ by $lambda t$ and
  apply the one-variable Lagrange formula to
  $U=lambda sum_i t_i exp(alpha_i U)$. For an analytic $H$ and $N>=1$,
  $
    [lambda^N]H(U)=1/N [u^(N-1)]H'(u)
    lr((sum_(i=1)^k t_i exp(alpha_i u)))^N.
  $
  #keep-next[
    The multinomial theorem, first with $H(u)=u$ and then with
    $H(u)=exp(beta u)$, gives
  ]
  $
              [t^r]U & =(alpha_1 r_1+dots+alpha_k r_k)^(|r|-1)/r!,
                       quad |r|>=1, \
    [t^n]exp(beta U) & =
                       beta (beta+alpha_1 n_1+dots+alpha_k n_k)^(|n|-1)/n!.
  $
  Expanding $exp(beta U)$ as a product of exponentials of its monomials, its
  coefficient of $t^n$ is exactly the left-hand side of
  @eq:multivariate-forest-identity. Only indices $r in I_n$ can contribute. This
  proves the general identity.
]
