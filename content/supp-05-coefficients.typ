#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": proof, remark, theorem
#import "supp-defs.typ": seq

#source(273, "261")
#heading(level: 3)[
  Coefficients of implicit power series in terms of the original coefficients.
  Inversion of systems of power series
] <supp:implicit-coefficients>

Suppose that the functions @eq:implicit-functions are given by convergent power
series #seq(
  $
    F_j (w,z)=z_j+sum_(mu,nu)' a_(j mu nu) w^mu z^nu,
    quad j=1,dots,n.
  $,
) <eq:implicit-formal-system>
#source(274, "262")
Here and below, the primed sums, products and families range over
$mu in ZZ_(>=0)^m$ and $nu in ZZ_(>=0)^n$ such that either $abs(mu)+abs(nu)>=2$,
or $abs(mu)=1$ and $nu=0$. Let #seq(
  $ Phi(w, z)=sum_(alpha,beta>=0) b_(alpha beta) w^alpha z^beta. $,
) <eq:implicit-composite-series>

#theorem[
  #footnote[
    @th:implicit-combinatorial-coefficients was obtained by the author jointly
    with V. A. Bolotov. The proof given here is due to the author. Bolotov
    obtained @eq:implicit-combinatorial-coefficients from
    @eq:inverse-map-coefficients.
  ] The coefficients of the power series @eq:implicit-taylor-series for
  $Phi(w, phi(w))$, where $z=phi(w)$ is determined by @eq:implicit-system, can
  be expressed in terms of the coefficients of @eq:implicit-formal-system and
  @eq:implicit-composite-series as follows: #seq(
    $
      d_alpha=sum_((eta,tau),S) (-1)^(abs(rho(S))) b_(eta tau) D(S)
      product_(j=1)^n lr(
        [
          [rho(S_j)-1]! product_(mu,nu)'
          frac(a_(j mu nu)^(s_(j mu nu)), s_(j mu nu)!)
        ]
      ).
    $,
  ) <eq:implicit-combinatorial-coefficients>
  Here $S=(S_1,dots,S_n)$, where $S_j=\{s_(j mu nu)\}_(mu,nu)'$ is a family of
  nonnegative integers with finite support. Write
  $
    rho(S)=(rho(S_1),dots,rho(S_n)),
    quad rho(S_j)=sum_(mu,nu)' s_(j mu nu),
  $
  $
    sigma_k (S_j)=sum_(mu,nu)' nu_k s_(j mu nu),
    quad lambda_k (S_j)=sum_(mu,nu)' mu_k s_(j mu nu),
  $
  and define
  $
    D(S)=det lr([delta_(k j)rho(S_j)-sigma_k (S_j)])_(k,j=1)^n.
  $
  The sum in @eq:implicit-combinatorial-coefficients ranges over
  $eta in ZZ_(>=0)^m$, $tau in ZZ_(>=0)^n$ and all $S$ satisfying #seq(
    $
      eta_k+sum_(j=1)^n lambda_k (S_j) & =alpha_k, quad k=1,dots,m, \
       tau_k+sum_(j=1)^n sigma_k (S_j) & =rho(S_k), quad k=1,dots,n.
    $,
  ) <eq:implicit-index-constraints>
  If $rho(S_j)=0$, replace the entire $j$th bracketed factor in
  @eq:implicit-combinatorial-coefficients by $1$, and replace column $j$ of the
  matrix defining $D(S)$ by $(delta_(k j))_(k=1)^n$.
] <th:implicit-combinatorial-coefficients>

#source(275, "263")
#remark[
  For $Phi(w, z)=z_q$, $q=1,dots,n$, formula
  @eq:implicit-combinatorial-coefficients gives the coefficients of the implicit
  function $phi_q$. The sum over $eta,tau$ disappears, and
  @eq:implicit-index-constraints becomes #seq(
    $
                 sum_(j=1)^n lambda_k (S_j) & =alpha_k, quad k=1,dots,m, \
      delta_(q k)+sum_(j=1)^n sigma_k (S_j) & =rho(S_k), quad k=1,dots,n.
    $,
  ) <eq:implicit-component-constraints>
] <remark:implicit-component-constraints>

#proof[
  Formulas @eq:implicit-cauchy-integral and @eq:implicit-coefficient-integral
  give #seq(
    $
      d_alpha=frac(1, (2 pi i)^(m+n))
      integral_(gamma_delta times Gamma_epsilon)
      frac(
        Phi(omega, zeta)J(omega,zeta),
        omega^(alpha+I) product_(j=1)^n F_j (omega,zeta)
      )
      dif omega ∧ dif zeta.
    $,
  ) <eq:implicit-double-integral>
  For suitably chosen radii, the function #seq(
    $
      frac(Phi(omega, zeta)J(omega,zeta), product_(j=1)^n F_j (omega,zeta))
      =Phi(omega, zeta)
      det lr([frac(partial ln F_j, partial zeta_k)])_(k,j=1)^n
    $,
  ) <eq:logarithmic-jacobian>
  is holomorphic on a neighbourhood of $overline(V)_delta times Gamma_epsilon$.
  It has an absolutely and uniformly convergent Laurent series there, and
  @eq:implicit-double-integral extracts its coefficient of
  $omega^alpha zeta^(-I)$.

  Let $g_j=F_j-z_j$. The radii can be chosen so that
  $abs(g_j (omega,zeta))<abs(zeta_j)=epsilon$ on this set. Choosing local
  logarithm branches gives #seq(
    $
      ln F_j (omega,zeta) & =ln zeta_j
                            +ln lr((1+frac(g_j (omega,zeta), zeta_j))) \
                          & =ln zeta_j+sum_(p=1)^infinity
                            frac((-1)^(p-1), p zeta_j^p) g_j^p (omega,zeta),
                            quad j=1,dots,n.
    $,
  ) <eq:logarithmic-expansion>
  Their derivatives are independent of the branch. Substitute
  $
    g_j (omega,zeta)=sum_(mu,nu)' a_(j mu nu) omega^mu zeta^nu.
  $
  For a fixed nonzero family $S_j$, put $r_j=rho(S_j)$ and
  $
    A_j (S_j)=[r_j-1]! product_(mu,nu)'
    frac(a_(j mu nu)^(s_(j mu nu)), s_(j mu nu)!).
  $
  The multinomial expansion in @eq:logarithmic-expansion gives the term
  $
    (-1)^(r_j-1) A_j (S_j)
    omega^(lambda(S_j)) zeta^(sigma(S_j)-r_j e_j),
  $
  where $e_j$ is the $j$th coordinate vector, and $lambda(S_j)$ and $sigma(S_j)$
  collect the corresponding components. Its derivative with respect to $zeta_k$
  is
  $
    (-1)^(r_j) A_j (S_j)
    [delta_(k j)r_j-sigma_k (S_j)]
    omega^(lambda(S_j)) zeta^(sigma(S_j)-r_j e_j-e_k).
  $
  For $r_j=0$, the term $partial_(zeta_k) ln zeta_j=delta_(k j)/zeta_j$ provides
  precisely the convention stated after @eq:implicit-index-constraints.

  Expand the determinant in @eq:logarithmic-jacobian by multilinearity in its
  columns. For each $S$, factor out the common monomials and coefficients. This
  yields
  $
    (-1)^(abs(rho(S))) D(S) product_(j=1)^n A_j (S_j)
    omega^(sum_j lambda(S_j))
    zeta^(sum_j sigma(S_j)-rho(S)-I),
  $
  with $A_j=1$ for a zero family. Multiplication by the series
  @eq:implicit-composite-series and extraction of $omega^alpha zeta^(-I)$ give
  exactly @eq:implicit-combinatorial-coefficients and its constraints
  @eq:implicit-index-constraints. Only finitely many families contribute: since
  each permitted pair satisfies $2 abs(mu)+abs(nu)>=2$, these constraints imply
  $abs(rho(S))<=2 abs(alpha)$, and bound every index occurring in $S$.

  As a consequence, we obtain formulas for inverting systems of power series.

  #source(276, "264")
  Suppose that the functions in @eq:inverse-map and $Phi(z)$ are given by #seq(
    $
      w_j=f_j (z)=z_j+sum_(abs(alpha)>=2) a_(j alpha)z^alpha,
      quad j=1,dots,n,
    $,
  ) <eq:inverse-formal-map>
  #seq($ Phi(z)=sum_(alpha>=0) b_alpha z^alpha, $) <eq:inverse-composite-series>
  where $alpha=(alpha_1,dots,alpha_n)$.
]

#theorem(suffix: [])[
  (#bib-ref("Cayley1856"), #bib-ref("Sack1965"), #bib-ref(
    "Sylvester1857",
  )). The coefficients in @eq:inverse-map-taylor for $Phi(phi(w))$, where $phi$
  is the local inverse of $f$, are #seq(
    $
      d_alpha=sum_(tau,S) (-1)^(abs(rho(S))) b_tau Delta(S)
      product_(j=1)^n lr(
        [
          frac([rho(S_j)+alpha_j-1]!, alpha_j!)
          product_(abs(nu)>=2) frac(a_(j nu)^(s_(j nu)), s_(j nu)!)
        ]
      ).
    $,
  ) <eq:inverse-combinatorial-coefficients>
  Here $S=(S_1,dots,S_n)$, with $S_j=\{s_(j nu)\}_(abs(nu)>=2)$ a family of
  nonnegative integers with finite support, and
  $
    rho(S_j)=sum_(abs(nu)>=2) s_(j nu),
    quad sigma_k (S_j)=sum_(abs(nu)>=2) nu_k s_(j nu),
  $
  $
    Delta(S)=det lr(
      [
        delta_(k j)[alpha_j+rho(S_j)]-sigma_k (S_j)
      ]
    )_(k,j=1)^n.
  $
  The sum ranges over $tau in ZZ_(>=0)^n$ and all $S$ satisfying
  $
    tau_k+sum_(j=1)^n sigma_k (S_j)=alpha_k+rho(S_k),
    quad k=1,dots,n.
  $
  If $rho(S_j)=alpha_j=0$, replace the $j$th bracketed factor in
  @eq:inverse-combinatorial-coefficients by $1$, and column $j$ of the matrix
  defining $Delta(S)$ by $(delta_(k j))_(k=1)^n$.
] <th:inverse-combinatorial-coefficients>

To obtain @eq:inverse-combinatorial-coefficients from
@eq:implicit-combinatorial-coefficients, set $F_j (w,z)=f_j (z)-w_j$ and take
$Phi$ independent of $w$. The first constraints in
@eq:implicit-index-constraints force exactly $alpha_j$ copies of the monomial
$-w_j$ in the $j$th family. Removing these copies leaves the families in
@eq:inverse-combinatorial-coefficients. Their signs, factorials and second
constraints reduce to those displayed above.

#remark[
  For $Phi(z)=z_j$, $j=1,dots,n$, formulas @eq:inverse-map-taylor and
  @eq:inverse-combinatorial-coefficients give the inverse of the system
  @eq:inverse-formal-map.
] <remark:formal-inverse-components>
