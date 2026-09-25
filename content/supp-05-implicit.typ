#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": proof, proposition, remark, theorem
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(268, "256")
#heading(level: 2)[
  Implicit functions and inverse holomorphic mappings from the multiple
  logarithmic residue
] <supp:implicit-and-inverse-maps>

The logarithmic residue in one variable gives the Lagrange expansion #bib-ref(
  "Whittaker1927",
), also called the Bürmann–Lagrange expansion #bib-ref("Shabat1969"): it
expresses a holomorphic function $f(z)$ as a series in $zeta$ when
$z=a+zeta psi(z)$. The multiple logarithmic residue similarly gives
multidimensional generalizations; see #bib-ref("Good1960"), #bib-ref(
  "Poincare1887",
) and #bib-ref("Yuzhakov1975b"). Some generalizations were obtained without
residues in #bib-ref("Percus1964"), #bib-ref("Sack1965") and elsewhere. We give
a version for arbitrary implicit functions.

#source(269, "257")
#heading(level: 3)[
  Generalization of the Lagrange expansion to systems of implicit functions
] <supp:implicit-lagrange-series>

See #bib-ref("Yuzhakov1975b") and #bib-ref("Yuzhakov1975c"). Suppose that #seq(
  $ F_j (w,z), quad j=1,dots,n, $,
) <eq:implicit-functions>
and $Phi(w, z)$ are holomorphic near $(0,0) in CC^(m+n)$, with
$w=(w_1,dots,w_m)$ and $z=(z_1,dots,z_n)$. Assume that
$
  F_j (0,0)=0, quad j=1,dots,n,
  quad J(0,0)!=0,
$
where
$
  J(w,z)=frac(partial(F_1, dots, F_n), partial(z_1, dots, z_n)).
$
We seek an explicit representation of $Phi(w, phi(w))$, where the implicit
holomorphic map $z=phi(w)=(phi_1 (w),dots,phi_n (w))$, with $phi(0)=0$, is
specified by #seq($ F_j (w,z)=0, quad j=1,dots,n. $) <eq:implicit-system>
Taking $Phi(w, z)=z_j$ gives the implicit functions themselves. We may assume
#seq(
  $
    frac(partial F_j, partial z_k)(0,0)=delta_(j k),
    quad j,k=1,dots,n,
  $,
) <eq:implicit-normalization>
where $delta_(j k)$ is the Kronecker delta. Otherwise replace $F$ by $A^(-1)F$,
where $A$ is its invertible matrix of $z$-derivatives at $(0,0)$.

#theorem[
  There are $delta>0$ and $epsilon>0$ such that, for $w$ in the closed polydisc
  $
    overline(V)_delta=\{w in CC^m:abs(w_j)<=delta, quad j=1,dots,m\},
  $
  we have #seq(
    $
      Phi(w, phi(w))=frac(1, (2 pi i)^n) integral_(Gamma_epsilon)
      frac(Phi(w, zeta)J(w,zeta), product_(j=1)^n F_j (w,zeta)) dif zeta.
    $,
  ) <eq:implicit-cauchy-integral>
  Here $Gamma_epsilon=\{zeta in CC^n:abs(zeta_j)=epsilon, quad j=1,dots,n\}$,
  $dif zeta=dif zeta_1 ∧ dots ∧ dif zeta_n$, and the torus is positively
  oriented by its ordered angular coordinates. For $Phi(w, z)=z_j$, this is an
  integral representation of $phi_j (w_1,dots,w_m)$.
] <th:implicit-cauchy-integral>

#source(270, "258")
#theorem[
  Let $h=(h_1,dots,h_n)$ be holomorphic near $0 in CC^m$, with $h(0)=0$. In a
  sufficiently small closed polydisc about $0$, the following series converges
  absolutely and uniformly: #seq(
    $
      Phi(w, phi(w))=sum_(beta>=0) frac((-1)^(abs(beta)), beta!)
      frac(partial^(abs(beta)), partial z^beta)
      lr([Phi(w, z)theta^beta (w,z)J(w,z)])|_(z=h(w)).
    $,
  ) <eq:implicit-series>
  Here $beta=(beta_1,dots,beta_n)$ is a multi-index of nonnegative integers,
  $abs(beta)=beta_1+dots+beta_n$, $beta!=beta_1! dots beta_n!$,
  $
    frac(partial^(abs(beta)), partial z^beta)
    =frac(partial^(abs(beta)), partial z_1^(beta_1) dots partial z_n^(beta_n)),
  $
  and $theta^beta=theta_1^(beta_1) dots theta_n^(beta_n)$, where
  $
    theta_j (w,z)=F_j (w,z)-z_j+h_j (w), quad j=1,dots,n.
  $
] <th:implicit-series>

#remark[
  It is often convenient to take $h_j (w)=0$ or $h_j (w)=-F_j (w,0)$.
] <remark:implicit-shift-choice>

#theorem[
  Near $0 in CC^m$, #seq(
    $
      Phi(w, phi(w))=sum_(alpha>=0) d_alpha w^alpha
      =sum_(alpha_1,dots,alpha_m>=0)
      d_(alpha_1,dots,alpha_m) w_1^(alpha_1) dots w_m^(alpha_m),
    $,
  ) <eq:implicit-taylor-series>
  where $alpha in ZZ_(>=0)^m$ and #seq(
    $
      d_alpha=sum_(abs(beta)<=2 abs(alpha))
      frac((-1)^(abs(beta)), alpha! beta!)
      frac(partial^(abs(alpha)+abs(beta)), partial w^alpha partial z^beta)
      lr([Phi(w, z)g^beta (w,z)J(w,z)])|_(w=0,z=0).
    $,
  ) <eq:implicit-coefficients>
  Here $g_j (w,z)=F_j (w,z)-z_j$, $j=1,dots,n$, and
  $g^beta=g_1^(beta_1) dots g_n^(beta_n)$.
] <th:implicit-taylor-series>

#remark[
  The coefficients also have the integral representation
  @eq:implicit-coefficient-integral.

  For $n=1$, formulas @eq:implicit-series and @eq:implicit-coefficients can be
  simplified.
] <remark:univariate-implicit-simplification>

#proposition[
  Let $F(w,z)$ and $Phi(w, z)$ be holomorphic near $(0,0) in CC^(m+1)$, with
  $F(0,0)=0$ and $F'_z (0,0)=1$. Let $h(w)$ be holomorphic near $0 in CC^m$,
  with $h(0)=0$. For the implicit function $z=phi(w)$ determined by $F(w,z)=0$,
  we have the locally absolutely and uniformly convergent series #seq(
    variant: <eq:implicit-series>,
    $
      Phi(w, phi(w)) & =Phi(w, h(w)) \
                     & quad +sum_(k=1)^infinity frac((-1)^k, k!)
                       frac(partial^(k-1), partial z^(k-1))
                       lr([Phi'_z (w,z)theta^k (w,z)])|_(z=h(w)),
    $,
  ) <eq:implicit-series-univariate>
  #source(271, "259")
  where $theta(w, z)=F(w,z)-z+h(w)$. Its Taylor coefficients in
  @eq:implicit-taylor-series are #seq(
    variant: <eq:implicit-coefficients>,
    $
      d_alpha & =frac(1, alpha!)
                frac(partial^(abs(alpha)), partial w^alpha)Phi(0, 0) \
              & quad +sum_(k=1)^(2 abs(alpha)) frac((-1)^k, k! alpha!)
                frac(partial^(abs(alpha)+k-1), partial w^alpha partial z^(k-1))
                lr([Phi'_z (w,z)g^k (w,z)])|_(w=0,z=0),
    $,
  ) <eq:implicit-coefficients-univariate>
  where $g(w,z)=F(w,z)-z$.
] <prop:implicit-series-univariate>

#proof[
  By @eq:implicit-normalization, each $g_j$ has no constant term or term linear
  in $z$ alone. Choose $epsilon>0$ small, and then $delta>0$ small enough that
  $
    abs(g_j (w,z))<epsilon
  $
  for $w in overline(V)_delta$ and $abs(z_k)<=epsilon$ for all $k$. On
  $Gamma_epsilon$, this gives $abs(g_j (w,zeta))<abs(zeta_j)=epsilon$. The
  coordinate system $z$ has one simple zero. Theorem @th:torus-perturbed-map[]
  of §@supp:logarithmic-residue therefore shows that $F(w,z)=0$ has one zero,
  counted with multiplicity, in the polydisc
  $U_epsilon=\{z:abs(z_j)<epsilon, quad j=1,dots,n\}$. This zero is simple and
  depends holomorphically on $w$ by the implicit function theorem. Formula
  @eq:torus-weighted-perturbation gives @eq:implicit-cauchy-integral.

  For the given $h$, shrink the radii so that, on
  $overline(V)_delta times Gamma_epsilon$,
  $
    abs(h_j (w))<=epsilon/4, quad abs(g_j (w,zeta))<=epsilon/4.
  $
  Since $theta_j=g_j+h_j$, it follows that
  $
    abs(theta_j (w,zeta))<=epsilon/2,
    quad abs(zeta_j-h_j (w))>=3epsilon/4,
    quad abs(frac(theta_j (w,zeta), zeta_j-h_j (w)))<=2/3.
  $
  Thus the geometric expansion
  $
    frac(1, product_(j=1)^n F_j (w,zeta))
    & =product_(j=1)^n frac(1, zeta_j-h_j (w))
    lr((1+frac(theta_j (w,zeta), zeta_j-h_j (w))))^(-1) \
    & =sum_(beta>=0) frac(
      (-1)^(abs(beta))theta^beta (w,zeta),
      [zeta-h(w)]^(beta+I)
    )
  $
  converges absolutely and uniformly on this compact set. Here
  $[zeta-h]^(beta+I)=product_(j=1)^n (zeta_j-h_j)^(beta_j+1)$, with
  $I=(1,dots,1)$. Substitution in @eq:implicit-cauchy-integral and termwise
  integration give #seq(
    $
      Phi(w, phi(w))=sum_(beta>=0) frac((-1)^(abs(beta)), (2 pi i)^n)
      integral_(Gamma_epsilon)
      frac(Phi(w, zeta)theta^beta (w,zeta)J(w,zeta), [zeta-h(w)]^(beta+I))
      dif zeta.
    $,
  ) <eq:implicit-residue-expansion>
  The product Cauchy formula at $z=h(w)$ turns this into @eq:implicit-series.

  #source(272, "260")
  To obtain the Taylor coefficients, take $h=0$ and apply the integral form of
  Taylor's formula; see #bib-ref("Aizenberg1975") and #bib-ref("Shabat1969").
  With $gamma_delta=\{omega in CC^m:abs(omega_j)=delta, quad j=1,dots,m\}$,
  #seq(
    $
      d_alpha & =frac(1, (2 pi i)^m) integral_(gamma_delta)
                frac(Phi(omega, phi(omega)), omega^(alpha+I)) dif omega \
              & =sum_(beta>=0) frac((-1)^(abs(beta)), (2 pi i)^(m+n))
                integral_(gamma_delta times Gamma_epsilon)
                frac(
                  Phi(omega, zeta)g^beta (omega,zeta)J(omega,zeta),
                  omega^(alpha+I) zeta^(beta+I)
                ) dif omega ∧ dif zeta,
    $,
  ) <eq:implicit-coefficient-integral>
  where $dif omega=dif omega_1 ∧ dots ∧ dif omega_m$ and the all-ones
  multi-index $I$ has the dimension of the variable to which it is added.

  The summand in @eq:implicit-coefficient-integral extracts the coefficient of
  $w^alpha z^beta$ in $Phi g^beta J$. Give each $w$-variable weight $2$ and each
  $z$-variable weight $1$. Every monomial of $g_j$ has weight at least $2$, so
  every monomial of $Phi g^beta J$ has weight at least $2 abs(beta)$. The
  extracted monomial has weight $2 abs(alpha)+abs(beta)$. It can therefore occur
  only if $abs(beta)<=2 abs(alpha)$. The product Cauchy formula now gives the
  finite expression @eq:implicit-coefficients.

  For $n=1$, we have $J=1+theta'_z$. Write $D_z=frac(partial, partial z)$ and
  understand the following expressions to be evaluated at $z=h(w)$. Splitting
  the series in @eq:implicit-series and shifting the index in its second part
  gives
  $
    Phi(w, phi(w)) & =sum_(k=0)^infinity frac((-1)^k, k!)
                     D_z^k lr([Phi theta^k (1+theta'_z)]) \
                   & =Phi(w, h(w))
                     +sum_(k=1)^infinity frac((-1)^k, k!)
                     D_z^(k-1) lr([D_z (Phi theta^k)-Phi D_z (theta^k)]) \
                   & =Phi(w, h(w))
                     +sum_(k=1)^infinity frac((-1)^k, k!)
                     D_z^(k-1) lr([Phi'_z theta^k]).
  $
  This proves @eq:implicit-series-univariate. Taking $h=0$ and extracting the
  coefficient of $w^alpha$ gives @eq:implicit-coefficients-univariate. The same
  weight argument makes all terms with $k>2 abs(alpha)$ vanish.
]
