#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": corollary, proof, theorem
#import "supp-defs.typ": seq

#source(272, "260")
#heading(level: 3)[Local inversion of a holomorphic mapping in
  $CC^n$] <supp:local-inversion>
The following is a special case of the preceding problem. Let #seq(
  $ w=f(z)=f(z_1,dots,z_n), quad f=(f_1,dots,f_n), $,
) <eq:inverse-map>
be holomorphic near $0 in CC^n$, with #seq(
  $
    f_j (0)=0, quad frac(partial f_j, partial z_k)(0)=delta_(j k),
    quad j,k=1,dots,n.
  $,
) <eq:inverse-map-normalization>
We seek an expansion of a function $Phi(z)$, holomorphic near $0$, in powers of
the functions @eq:inverse-map. In particular, we seek a power series for the
local inverse #seq(
  $ z=phi(w)=phi(w_1, dots, w_n), quad phi=(phi_1,dots,phi_n). $,
) <eq:local-inverse-map>
#source(273, "261")
Write
$
  J_f (z)=frac(partial(f_1, dots, f_n), partial(z_1, dots, z_n)).
$

#theorem(suffix: [])[
  (#bib-ref("Percus1964"), #bib-ref("Yuzhakov1975b")). Under these assumptions,
  the following function series converges absolutely and uniformly in a
  sufficiently small closed polydisc about $0$: #seq(
    $
      Phi(phi(w))=sum_(beta>=0) frac((-1)^(abs(beta)), beta!)
      frac(partial^(abs(beta)), partial z^beta)
      lr([Phi(z)theta^beta (z)J_f (z)])|_(z=w),
    $,
  ) <eq:inverse-map-series>
  where $theta_j (z)=f_j (z)-z_j$ and
  $theta^beta=theta_1^(beta_1) dots theta_n^(beta_n)$. Its Taylor series is
  #seq(
    $
      Phi(phi(w))=sum_(alpha>=0) d_alpha w^alpha
      =sum_(alpha_1,dots,alpha_n>=0)
      d_(alpha_1,dots,alpha_n) w_1^(alpha_1) dots w_n^(alpha_n),
    $,
  ) <eq:inverse-map-taylor>
  with coefficients #seq(
    $
      d_alpha=sum_(abs(beta)<=abs(alpha))
      frac((-1)^(abs(beta)), alpha! beta!)
      frac(partial^(abs(alpha)+abs(beta)), partial z^(alpha+beta))
      lr([Phi(z)theta^beta (z)J_f (z)])|_(z=0).
    $,
  ) <eq:inverse-map-coefficients>
] <th:inverse-map-series>

#proof[
  In Theorem @th:implicit-series[], take $m=n$, $F_j (w,z)=f_j (z)-w_j$ and
  $h_j (w)=w_j$. Formula @eq:implicit-series gives @eq:inverse-map-series.
  Expand its terms at $w=0$. Each $theta_j$ vanishes to order at least $2$, so
  $Phi theta^beta J_f$ has order at least $2 abs(beta)$. Its derivative of order
  $abs(alpha)+abs(beta)$ at $0$ can therefore be nonzero only if
  $abs(beta)<=abs(alpha)$. This gives @eq:inverse-map-taylor and
  @eq:inverse-map-coefficients.
]

#corollary[
  Taking $Phi(z)=z_j$, $j=1,dots,n$, in @eq:inverse-map-series or
  @eq:inverse-map-taylor–@eq:inverse-map-coefficients gives the components of
  the inverse mapping @eq:local-inverse-map.
] <cor:inverse-map-components>

#theorem(suffix: [])[
  (#bib-ref("Good1960"), #bib-ref("Poincare1887"), #bib-ref(
    "Yuzhakov1973",
  )). Suppose that the holomorphic mapping @eq:inverse-map has components #seq(
    $
      w_j=f_j (z)=z_j psi_j (z), quad psi_j (0)!=0,
      quad j=1,dots,n.
    $,
  ) <eq:multiplicative-map>
  For its local inverse, the following expansion holds near $0$: #seq(
    $
      Phi(phi(w))=sum_(beta>=0) frac(w^beta, beta!)
      frac(partial^(abs(beta)), partial z^beta)
      lr([frac(Phi(z)J_f (z), psi^(beta+I)(z))])|_(z=0),
    $,
  ) <eq:lagrange-good-series>
  where $I=(1,dots,1)$ and $psi^(beta+I)=product_(j=1)^n psi_j^(beta_j+1)$. Here
  the constants $psi_j (0)$ need not be $1$.
] <th:multiplicative-map>

#proof[
  Choose a small closed polydisc on which all $psi_j$ are nonzero, and let
  $Gamma_epsilon$ be its positively oriented distinguished boundary. For
  sufficiently small $w$, the residue formula @eq:implicit-cauchy-integral gives
  $
    Phi(phi(w))=frac(1, (2 pi i)^n) integral_(Gamma_epsilon)
    frac(Phi(z)J_f (z), product_(j=1)^n (f_j (z)-w_j)) dif z.
  $
  If necessary, first divide the $j$th equation and $w_j$ by $psi_j (0)$ to
  normalize the derivative at $0$; the constant factors in the Jacobian and the
  product denominator cancel. On the torus, choose
  $abs(w_j)<min_(Gamma_epsilon) abs(f_j)$, so that
  $
    frac(1, product_(j=1)^n (f_j (z)-w_j))
    =sum_(beta>=0) frac(w^beta, z^(beta+I) psi^(beta+I)(z)).
  $
  The geometric series converges absolutely and uniformly when $w$ ranges over a
  smaller closed polydisc. Termwise integration and the product Cauchy formula
  give @eq:lagrange-good-series.
]
