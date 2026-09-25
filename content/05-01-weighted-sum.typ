#import "statements.typ": example
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(169, "157")
In the next two examples we evaluate multidimensional combinatorial sums
considered in #bib-ref("Sarmanov1972"). The analytic method obtains the
identities without requiring their right-hand sides in advance.

#example(title: [])[
  Let $r>=0$ and $m_0,m_1,dots,m_r$ be integers, with every $m_j>=0$. Let
  $b_0,b_1,dots,b_r$ be complex numbers satisfying $sum_(alpha=0)^r b_alpha=1$.
  Evaluate #eq(
    $
      S & =sum_(alpha=0)^r sum_(k_1=0)^(m_(alpha+1)) dots
          sum_(k_r=0)^(m_(alpha+r))
          (m_alpha+|k|)!/(m_alpha! k_1! dots k_r!) \
        & quad times b_alpha^(m_alpha+1)
          b_(alpha+1)^(k_1) dots b_(alpha+r)^(k_r),
    $,
  ) <eq:weighted-multinomial-identity>
  where $|k|=k_1+dots+k_r$ and all subscripts are read modulo $r+1$. When $r=0$,
  the inner multiple sum consists of one term and the empty products equal $1$.

  Replacing $k_j$ by $m_(alpha+j)-k_j$ for $j=1,dots,r$ gives #eq(
    $
      S & =sum_(alpha=0)^r sum_(k_1=0)^(m_(alpha+1)) dots
          sum_(k_r=0)^(m_(alpha+r)) \
        & quad times
          (m_alpha+m_(alpha+1)+dots+m_(alpha+r)-|k|)!/
          (m_alpha!(m_(alpha+1)-k_1)! dots (m_(alpha+r)-k_r)!) \
        & quad times b_alpha^(m_alpha+1)
          b_(alpha+1)^(m_(alpha+1)-k_1) dots
          b_(alpha+r)^(m_(alpha+r)-k_r).
    $,
  ) <eq:weighted-reversed-sum>
  For the integral representation choose $rho>0$ so that $rho<1$ and
  $rho sum_(j=0)^r |b_j|<1$. Let $Gamma_rho={z:|z_j|=rho, j=0,dots,r}$ and
  extend the subscripts by $z_(r+1+j)=z_j$. Each summand in
  @eq:weighted-reversed-sum is
  $
    & b_alpha/(2pi i)^(r+1) integral_(Gamma_rho)
      lr((1-sum_(beta=alpha)^(alpha+r)b_beta z_beta))^(-1) \
    & quad times z_alpha^(-m_alpha-1)
      z_(alpha+1)^(-m_(alpha+1)+k_1-1) dots
      z_(alpha+r)^(-m_(alpha+r)+k_r-1)dif z.
  $
  We may extend each inner sum over $k_j$ to all nonnegative integers: the added
  terms ask for a negative coefficient of an analytic power series and have zero
  residue. The chosen radius makes the resulting geometric series uniformly
  absolutely convergent on the contour. Hence
  $
    S & =1/(2pi i)^(r+1) integral_(Gamma_rho)
        sum_(alpha=0)^r
        (b_alpha lr((1-sum_(beta=alpha)^(alpha+r)b_beta z_beta))^(-1))/
        (z_alpha^(m_alpha+1) dots z_(alpha+r)^(m_(alpha+r)+1)) \
      & quad times sum_(k_1,dots,k_r>=0)
        z_(alpha+1)^(k_1) dots z_(alpha+r)^(k_r)dif z.
  $

  #source(170, "158")
  Cyclic indexing gives
  $
    1-sum_(beta=alpha)^(alpha+r)b_beta z_beta
    =1-sum_(j=0)^r b_j z_j,
  $
  #keep-next[and the inner geometric sums give]
  $
    sum_(k_1,dots,k_r>=0)z_(alpha+1)^(k_1) dots z_(alpha+r)^(k_r)
    =product_(j=1)^r (1-z_(alpha+j))^(-1).
  $
  Finally, #eq(
    mark: "*",
    $
      sum_(alpha=0)^r b_alpha product_(j=1)^r (1-z_(alpha+j))^(-1)
      &=product_(j=0)^r (1-z_j)^(-1)
      sum_(alpha=0)^r b_alpha (1-z_alpha) \
      &=lr((1-sum_(alpha=0)^r b_alpha z_alpha))
      product_(j=0)^r (1-z_j)^(-1).
    $,
  ) <eq:weighted-factorization>
  The common factor cancels, leaving #eq(
    $
      S=1/(2pi i)^(r+1) integral_(Gamma_rho)
      product_(j=0)^r lr((1-z_j)^(-1)z_j^(-m_j-1))dif z=1.
    $,
  ) <eq:weighted-integral-value>
  The identity given by @eq:weighted-multinomial-identity and
  @eq:weighted-integral-value is equivalent to Theorem 2 of #bib-ref(
    "Sarmanov1972",
  ), proved there by combinatorial means. The factorization
  @eq:weighted-factorization corresponds to partitioning the weighted set of
  chains into the classes $C_(alpha k_1 dots k_r)$ used in that proof.
] <ex:weighted-multinomial-identity>
