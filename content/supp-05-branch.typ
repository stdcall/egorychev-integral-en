#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": corollary, theorem
#import "supp-defs.typ": seq

#source(276, "264")
#heading(level: 3)[
  A single-valued regular branch of a system of implicit functions
] <supp:regular-branches>

We state without proof a criterion for a single-valued holomorphic branch of the
implicit vector function determined by @eq:implicit-system, in the degenerate
case
#source(277, "265")
$
  J(0,0)=frac(partial(F_1, dots, F_n), partial(z_1, dots, z_n))(0,0)=0;
$
see #bib-ref("Yuzhakov1975b"). Suppose that, near $(0,0) in CC^(m+n)$, #seq(
  $ F_j (w,z)=z_j cal(P)_j (w,z)+theta_j (w,z), quad j=1,dots,n, $,
) <eq:branched-system>
where $z_j cal(P)_j$ is the nonzero homogeneous part of lowest total degree in
$F_j$, and $cal(P)_j (w,0)$ is not identically zero. Let
$
  w^(lambda_(j))=w_1^(lambda_(j 1)) dots w_m^(lambda_(j m))
$
be the lexicographically largest monomial of $cal(P)_j (w,0)$, normalized to
have coefficient $1$. Thus, for any other exponent $mu$, the first index $k$ at
which it differs from $lambda_(j)$ satisfies $mu_k<lambda_(j k)$.

Put
$
  g_j (w,z)=F_j (w,z)-z_j w^(lambda_(j)), quad j=1,dots,n,
$
and, for $beta in ZZ_(>=0)^n$, write
$
  lambda(beta+I)=sum_(j=1)^n (beta_j+1)lambda_(j),
  quad I=(1,dots,1).
$
Let $delta$ and $epsilon$ be sufficiently small positive numbers, and set
$
  gamma_delta=\{omega in CC^m:abs(omega_k)=delta, quad k=1,dots,m\},
$
$
  Gamma_epsilon=\{zeta in CC^n:abs(zeta_j)=epsilon, quad j=1,dots,n\}.
$
Orient both tori by their ordered angular coordinates, and set
$g^beta=product_(j=1)^n g_j^(beta_j)$. The all-ones multi-index $I$ in a
parameter exponent has $m$ entries. The coefficient integrals below are taken
term by term. For each fixed $alpha$, only finitely many are nonzero, and each
is independent of the sufficiently small positive radii.

#theorem(suffix: [])[
  (#bib-ref("Yuzhakov1975b")). There exists a system of holomorphic functions
  near $0 in CC^m$, #seq(
    $ z_j=phi_j (w)=phi_j (w_1,dots,w_m), quad j=1,dots,n, $,
  ) <eq:branched-solution>
  satisfying @eq:implicit-system and #seq(
    $
      phi_j (0)=0, quad frac(partial phi_j, partial w_k)(0)=0,
      quad j=1,dots,n, quad k=1,dots,m,
    $,
  ) <eq:branched-normalization>
  if and only if, for every $j=1,dots,n$, #seq(
    $
      sum_(beta>=0) frac((-1)^(abs(beta)), (2 pi i)^(m+n))
      integral_(gamma_delta times Gamma_epsilon)
      frac(
        zeta_j g^beta (omega,zeta)J(omega,zeta),
        zeta^(beta+I) omega^(lambda(beta+I)+alpha+I)
      )
      dif omega ∧ dif zeta=0
    $,
  ) <eq:branched-coefficient-integral>
  for all integer multi-indices $alpha=(alpha_1,dots,alpha_m)$ with
  $abs(alpha)>=2$ and at least one negative component. Here
  $abs(alpha)=alpha_1+dots+alpha_m$, also for integer multi-indices.
] <th:branched-solution>

#source(278, "266")
Under these conditions, the Taylor expansion #seq(
  $
    Phi(w, phi(w))=sum_(alpha>=0) d_alpha w^alpha
    =sum_(alpha_1,dots,alpha_m>=0)
    d_(alpha_1,dots,alpha_m) w_1^(alpha_1) dots w_m^(alpha_m),
  $,
) <eq:branched-taylor-series>
for any $Phi(w, z)$ holomorphic near $(0,0)$, has coefficients #seq(
  $
    d_alpha & =sum_(beta>=0)
              frac((-1)^(abs(beta)), beta! [lambda(beta+I)+alpha]!) \
            & quad times frac(
                partial^(abs(beta)+abs(lambda(beta+I)+alpha)),
                partial z^beta partial w^(lambda(beta+I)+alpha)
              )
              lr([Phi(w, z)g^beta (w,z)J(w,z)])|_(w=0,z=0).
  $,
) <eq:branched-series-coefficients>
For each fixed $alpha$, only finitely many terms in
@eq:branched-coefficient-integral and @eq:branched-series-coefficients are
nonzero.

#corollary[
  Under the assumptions of Theorem @th:branched-solution[] and condition
  @eq:branched-coefficient-integral, the regular branch @eq:branched-solution is
  represented by @eq:branched-taylor-series–@eq:branched-series-coefficients
  with $Phi(w, z)=z_j$ for its $j$th component.
] <cor:regular-branch-series>

#corollary[
  If $m=1$, conditions @eq:branched-coefficient-integral hold automatically.
  Hence a holomorphic implicit vector function satisfying @eq:implicit-system
  and @eq:branched-normalization exists.
] <cor:univariate-regular-branch>
