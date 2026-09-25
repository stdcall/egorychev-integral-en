#import "index-style.typ": index-mark
#import "statements.typ": example
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(170, "158")
#example(title: [])[
  For a nonnegative integer $m$ and arbitrary complex numbers
  $a_0,dots,a_(2m+1)$ and $b_0,dots,b_(2m+1)$, prove the identity #eq(
    $
      & sum_(k=0)^m binom(m+k, k) sum_(l=0)^(m-k) binom(m-k, l) \
      & quad times lr([a_(k+l)b_(2m+1-k-l)+a_(m+1+l)b_(m-l)]) \
      & =sum_(k=0)^(2m+1) binom(2m+1, k)a_k b_(2m+1-k).
    $,
  ) <eq:bilinear-identity>
  #index-mark([@eq:bilinear-identity], group: [Identities])[Sarmanov,
    Sevast’yanov and Tarakanov]
  Theorem 3 of #bib-ref("Sarmanov1972") gives an equivalent identity using
  $a_k! =a_1 dots a_k$ and $b_k! =b_1 dots b_k$ in place of $a_k$ and $b_k$. We
  again derive the right-hand side by the analytic method. Write the two parts
  of the left-hand side as
  $
    S_(1)(a,b) & =sum_(k=0)^m binom(m+k, k)
                 sum_(l=0)^(m-k)binom(m-k, l)a_(k+l)b_(2m+1-k-l), \
    S_(2)(a,b) & =sum_(k=0)^m binom(m+k, k)
                 sum_(l=0)^(m-k)binom(m-k, l)a_(m+1+l)b_(m-l).
  $

  #source(171, "159")
  #keep-next[
    Replacing $k$ by $m-k$ and $l$ by $k-l$ in the first sum, and $k$ by $m-k$
    in the second, gives
  ]
  #eq(
    $
      S_(1)(a,b)=sum_(k=0)^m sum_(l=0)^k
      binom(2m-k, m-k)binom(k, l)a_(m-l)b_(m+1+l),
    $,
  ) <eq:bilinear-first-sum>
  #eq(
    $
      S_(2)(a,b)=sum_(k=0)^m sum_(l=0)^k
      binom(2m-k, m-k)binom(k, l)a_(m+1+l)b_(m-l).
    $,
  ) <eq:bilinear-second-sum>
  Thus $S_(2)(a,b)=S_(1)(b,a)$. Define the polynomials
  $
    A(z_3)=sum_(j=0)^(2m+1)a_j z_3^j, quad
    B(z_4)=sum_(j=0)^(2m+1)b_j z_4^j.
  $
  For positive radii, Cauchy's coefficient formula gives
  $
      a_(m-l) & =1/(2pi i)integral_(|z_3|=rho_3)
                A(z_3)z_3^(-m+l-1)dif z_3, \
    b_(m+l+1) & =1/(2pi i)integral_(|z_4|=rho_4)
                B(z_4)z_4^(-m-l-2)dif z_4.
  $
  Use the binomial representation $M_1$ from #link(<app:table-m>)[Table M] for
  both binomial factors. Choose $rho_1=1/4$, $rho_2=1$, $rho_3=1/2$, $rho_4=1$,
  and put
  $ Gamma_rho={z:|z_j|=rho_j, j=1,2,3,4}. $
  Use the ordered differential $dif z=dif z_1 ∧ dif z_2 ∧ dif z_3 ∧ dif z_4$.
  Then
  $
    S_(1)(a,b) & =sum_(k=0)^infinity sum_(l=0)^infinity
                 1/(2pi i)^4 integral_(Gamma_rho) \
               & quad times
                 ((1+z_1)^(2m-k)(1+z_2)^k A(z_3)B(z_4))/
                 (z_1^(m-k+1)z_3^(m-l+1)z_2^(l+1)z_4^(m+l+2)) dif z.
  $
  The extension of the sums adds only zero residues: for $k>m$ the required
  coefficient of $z_1$ is negative, whereas $(1+z_1)^(2m-k)$ is analytic for
  $|z_1|<1$; for $l>k$ the required coefficient exceeds the degree of
  $(1+z_2)^k$. Factoring out the terms independent of $k,l$ gives
  $
    S_(1)(a,b) & =1/(2pi i)^4 integral_(Gamma_rho)
                 ((1+z_1)^(2m) A(z_3)B(z_4))/
                 (z_1^(m+1)z_3^(m+1)z_4^(m+2)z_2) \
               & quad times sum_(k,l>=0)
                 lr(((z_1 (1+z_2))/(1+z_1)))^k
                 lr((z_3/(z_2 z_4)))^l dif z.
  $
  On this contour the two geometric ratios have moduli at most $2/3$ and $1/2$,
  respectively. Both series converge uniformly absolutely, so summing under the
  integral yields #eq(
    $
      S_(1)(a,b) & =1/(2pi i)^4 integral_(Gamma_rho) \
                 & quad times ((1+z_1)^(2m+1)A(z_3)B(z_4))/
                   (z_1^(m+1)z_3^(m+1)z_4^(m+1)(1-z_1 z_2)(z_2 z_4-z_3)) dif z.
    $,
  ) <eq:bilinear-integral>
  Integrate first with respect to $z_2$. The pole $z_3/z_4$ has modulus $1/2$
  and lies inside $|z_2|=1$; the other pole, $1/z_1$, has modulus $4$ and lies
  outside. Also $|z_1 z_3/z_4|=1/8<1$.

  #source(172, "160")
  With $Gamma'_rho={z:|z_j|=rho_j, j=1,3,4}$ and
  $dif z'=dif z_1 ∧ dif z_3 ∧ dif z_4$, the residue calculation gives
  $
    S_(1)(a,b) & =1/(2pi i)^3 integral_(Gamma'_rho)
                 ((1+z_1)^(2m+1)A(z_3)B(z_4))/
                 (z_1^(m+1)z_3^(m+1)z_4^(m+2)(1-z_1 z_3/z_4)) dif z' \
               & =sum_(k=0)^infinity 1/(2pi i)^3 integral_(Gamma'_rho)
                 ((1+z_1)^(2m+1)A(z_3)B(z_4))/
                 (z_1^(m+1)z_3^(m+1)z_4^(m+2))
                 lr(((z_1 z_3)/z_4))^k dif z' \
               & =sum_(k=0)^m binom(2m+1, m-k)a_(m-k)b_(m+k+1) \
               & =sum_(k=0)^m binom(2m+1, k)a_k b_(2m+1-k).
  $
  Similarly,
  $
    S_(2)(a,b) & =S_(1)(b,a)
                 =sum_(k=0)^m binom(2m+1, m-k)b_(m-k)a_(m+k+1) \
               & =sum_(k=m+1)^(2m+1)binom(2m+1, k)a_k b_(2m+1-k).
  $
  Adding these expressions gives
  $
    S_(1)(a,b)+S_(2)(a,b)=sum_(k=0)^(2m+1)binom(2m+1, k)a_k b_(2m+1-k),
  $
  which proves @eq:bilinear-identity.
] <ex:bilinear-identity>
