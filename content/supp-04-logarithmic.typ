#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": lemma, proof, proposition, remark, theorem
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(261, "249")
#heading(level: 2)[Multidimensional analogues of the logarithmic
  residue] <supp:logarithmic-residue>
In one complex variable the logarithmic residue counts the zeros of a
holomorphic function. Its multidimensional analogues count the common zeros of a
system of holomorphic functions.

#heading(level: 3)[
  Multiplicity of a common zero. The logarithmic residue over the whole boundary
] <supp:zero-multiplicity>

See #bib-ref("Caccioppoli1949"), #bib-ref("Milnor1968"), #bib-ref("Shabat1969")
and #bib-ref("Yuzhakov1973"). Let #seq(
  $ w_j=f_j (z)=f_j (z_1,dots,z_n), quad j=1,dots,n, $,
) <eq:holomorphic-map>
#index-mark([@eq:holomorphic-map], group: [Zeros of a system of holomorphic
  functions])[Definition]
#index-mark([@eq:holomorphic-map], group: [Zeros of a system of holomorphic
  functions])[Simple]
be holomorphic functions in a domain $G subset CC^n$, defining a holomorphic map
$w=f(z)$, where $f=(f_1,dots,f_n)$. A point $a in G$ is a zero of this system if
$f_j (a)=0$ for every $j$. Write
$
  cal(E)_f=\{z in G:f_1 (z)=dots=f_n (z)=0\}.
$
Assume that $cal(E)_f$ is discrete.
#keep-next[The Jacobian]
$
  J_f=frac(partial(f), partial(z))
  =frac(partial(f_1, dots, f_n), partial(z_1, dots, z_n))
$
is not identically zero in $G$. A zero $a$ is _simple_ if $J_f (a)!=0$.

#proposition[
  Let $U_a ⋐ G$ be a neighbourhood of a zero $a$, with piecewise smooth boundary
  and $overline(U_a) ∩ cal(E)_f=\{a\}$. For every $epsilon>0$ there is a regular
  value $zeta=(zeta_1,dots,zeta_n)$ of $f$, with $abs(zeta)<epsilon$, such that
  #seq(
    $ w=f(z)-zeta=(f_1 (z)-zeta_1,dots,f_n (z)-zeta_n) $,
  ) <eq:shifted-holomorphic-map>
  #source(262, "250")
  has only simple zeros in $U_a$. For sufficiently small $epsilon$, the number
  of these zeros is independent of the regular value $zeta$ chosen with
  $abs(zeta)<epsilon$. Here and below $abs(dot)$ is the Euclidean norm.
] <prop:shifted-holomorphic-map>
#index-mark([@prop:shifted-holomorphic-map], group: [Zeros of a system of
  holomorphic functions])[Multiple]

This number is called the _multiplicity_ of the zero $a$ of @eq:holomorphic-map.
It is independent of the isolating neighbourhood $U_a$.

#theorem(name: [logarithmic residue])[
  Suppose that @eq:holomorphic-map has a discrete zero set in $G subset CC^n$
  and $J_f$ is not identically zero. Let $D ⋐ G$ have piecewise smooth boundary
  and $partial D ∩ cal(E)_f=emptyset$. The number of zeros in $D$, counting
  multiplicities,#footnote[
    More precisely, the sum of the multiplicities of these zeros.
  ] is #seq(
    $ N(f,D)=integral_(partial D) omega(f(z)), $,
  ) <eq:zero-count-boundary>
  where
  $
    omega(f)=frac((n-1)!, (2 pi i)^n) frac(1, abs(f)^(2n))
    sum_(j=1)^n overline(f)_j dif f_j ∧
    lr(
      (dif overline(f)_1 ∧ dif f_1 ∧ dots [j] dots ∧
        dif overline(f)_n ∧ dif f_n)
    ).
  $
  The symbol $[j]$ omits the entire pair $dif overline(f)_j ∧ dif f_j$. This is
  the Martinelli–Bochner kernel; see #bib-ref("Aizenberg1975") and #bib-ref(
    "Shabat1969",
  ). Boundaries have the induced outward orientation.
] <th:zero-count-boundary>
#index-mark([@th:zero-count-boundary], group: [Theorems])[Logarithmic residue]

#theorem(name: [Rouché principle])[
  Let $f$ and $D$ satisfy Theorem @th:zero-count-boundary[], and let
  $g=(g_1,dots,g_n)$ be holomorphic in $G$. Suppose that, on $partial D$, #seq(
    $ abs(g(z))<abs(f(z)) quad "or" quad norm(g(z))<norm(f(z)), $,
  ) <eq:rouche-bound>
  where $norm(f)=max\{abs(f_1),dots,abs(f_n)\}$. Then the systems #seq(
    $ f+g=(f_1+g_1,dots,f_n+g_n) $,
  ) <eq:perturbed-map>
  and @eq:holomorphic-map have the same number of zeros in $D$, counting
  multiplicities.
] <th:rouche-bound>
#index-mark([@th:rouche-bound], group: [Theorems])[Rouché principle]

#lemma[
  Under the hypotheses of Theorem @th:zero-count-boundary[], choose piecewise
  smooth neighbourhoods $U_a$ of the zeros $a in cal(E)_f ∩ D$ with pairwise
  disjoint closures in $D$. Then #seq(
    $
      integral_(partial D) omega(f)
      =sum_(a in cal(E)_f ∩ D) integral_(partial U_a) omega(f).
    $,
  ) <eq:zero-count-localization>
] <lem:zero-count-localization>

Indeed, direct differentiation shows that $omega(f)$ is closed and regular in
$G without cal(E)_f$. In that set,
$ partial D ∼ sum_(a in cal(E)_f ∩ D) partial U_a, $
#source(263, "251")
since the difference is the boundary of the region between $partial D$ and the
$partial U_a$. Thus @eq:zero-count-localization follows from
@cor:null-homologous-periods of §@supp:forms-and-stokes.

#lemma[
  If all the zeros in Theorem @th:zero-count-boundary[] are simple, their number
  is given by @eq:zero-count-boundary.
] <lem:simple-zero-count>

#proof[
  Near each zero, the map $f$ is biholomorphic. Choose a sufficiently small ball
  $abs(w)<epsilon$ in this coordinate neighbourhood and take its inverse image
  for $U_a$. Put
  $
    A(w)=sum_(j=1)^n overline(w)_j dif w_j ∧
    lr(
      (dif overline(w)_1 ∧ dif w_1 ∧ dots [j] dots ∧
        dif overline(w)_n ∧ dif w_n)
    ).
  $
  Changing variables and applying Stokes' formula gives #seq(
    $
      integral_(partial U_a) omega(f)
      & =integral_(abs(w)=epsilon) omega(w) \
      & =frac((n-1)!, (2 pi i)^n epsilon^(2n))
      integral_(abs(w)=epsilon) A(w) \
      & =frac(n!, (2 pi i)^n epsilon^(2n))
      integral_(abs(w)<=epsilon)
      dif overline(w)_1 ∧ dif w_1 ∧ dots ∧
      dif overline(w)_n ∧ dif w_n \
      & =frac(n!, pi^n epsilon^(2n))
      integral_(abs(w)<=epsilon)
      dif u_1 ∧ dif v_1 ∧ dots ∧ dif u_n ∧ dif v_n \
      & =frac(n!, pi^n epsilon^(2n)) V_(2n)(epsilon)=1,
    $,
  ) <eq:simple-zero-degree>
  where $V_(2n)(epsilon)=pi^n epsilon^(2n)/n!$ is the volume of the
  $2n$-dimensional ball, and $w_j=u_j+i v_j$.#footnote[
    The orientation of $CC_w^n=RR_(u,v)^(2n)$ is determined by the order
    $u_1,v_1,dots,u_n,v_n$ of the coordinates.
  ] Now use @eq:zero-count-localization.
]

#lemma[
  Under the hypotheses of Theorem @th:rouche-bound[], #seq(
    $
      integral_(partial D) omega(f)
      =integral_(partial D) omega(f+g).
    $,
  ) <eq:rouche-integral-invariance>
] <lem:rouche-integral-invariance>

#proof[
  In the Euclidean case of @eq:rouche-bound, for $z in partial D$ and $0<=t<=1$
  we have $abs(f(z)+t g(z))>=abs(f(z))-t abs(g(z))>0$.#footnote[
    The inequality $norm(g(z))<norm(f(z))$ also implies $abs(f(z)+t g(z))>0$.
  ] Hence
  $ I(t)=integral_(partial D) omega(f+t g) $
  is continuous on $[0,1]$. It is also an integer: the pushforward cycle
  $(f+t g)_* (partial D)$, with its parametrization and multiplicities,
  represents an integer multiple $k(t)$ of the positively oriented unit sphere
  in $CC^n without \{0\}$. The form $omega(w)$ is closed there and has integral
  $1$ over that sphere by @eq:simple-zero-degree.
  #source(264, "252")
  Thus $I(t)=k(t)$ is constant, and $I(0)=I(1)$ proves
  @eq:rouche-integral-invariance.
]

#proof(title: [Proof of @prop:shifted-holomorphic-map])[
  By Sard's theorem, the set of critical values of $f$ has measure zero; see
  #bib-ref("deRham1955"). Therefore arbitrarily small regular values $zeta$
  exist, and all zeros of $f-zeta$ are simple. If
  $abs(zeta)<min_(z in partial U_a) abs(f(z))$, there are no zeros on
  $partial U_a$, and Lemma @lem:rouche-integral-invariance[] gives #seq(
    $
      integral_(partial U_a) omega(f)
      =integral_(partial U_a) omega(f-zeta).
    $,
  ) <eq:shifted-local-degree>
  By Lemma @lem:simple-zero-count[], the right side counts the zeros of $f-zeta$
  in $U_a$. The left side is independent of $zeta$, proving the claim. The
  number is positive: choose a noncritical point sufficiently near $a$; its
  local image contains a small regular value whose fibre meets $U_a$. Stokes'
  formula between two isolating boundaries shows that the number is also
  independent of $U_a$.
]

#proof(title: [Proof of @th:zero-count-boundary])[
  The definition of multiplicity and @eq:shifted-local-degree give #seq(
    $ m_a=integral_(partial U_a) omega(f(z)). $,
  ) <eq:zero-multiplicity>
  Sum over the zeros and use Lemma @lem:zero-count-localization[].

  Theorem @th:rouche-bound[] now follows from Theorem @th:zero-count-boundary[]
  and Lemma @lem:rouche-integral-invariance[]. Indeed, the zero set of $f+g$ in
  $D$ is a compact analytic subset of $D subset CC^n$, and is therefore finite.
  If it is nonempty, the existence of an isolated zero implies that the Jacobian
  of $f+g$ is not identically zero. If it is empty, its boundary integral
  vanishes by Stokes' formula.
]

#remark[
  A simple zero has multiplicity $1$. Conversely, if $J_f (a)=0$ at a zero, then
  $m_a>1$.
] <remark:simple-zero-multiplicity>

#theorem(name: [weighted logarithmic residue])[
  Under the hypotheses of Theorem @th:zero-count-boundary[], let $phi$ be
  holomorphic in $G$. Then #seq(
    $
      integral_(partial D) phi(z) omega(f(z))
      =sum_(a_nu in cal(E)_f ∩ D) m_nu phi(a_nu),
    $,
  ) <eq:weighted-zero-count>
  where $m_nu$ is the multiplicity of $a_nu$.
] <th:weighted-zero-count>
#index-mark([@th:weighted-zero-count], group: [Theorems])[Logarithmic residue]
#index-mark([@th:weighted-zero-count], group: [Zeros of a system of holomorphic
  functions])[Multiple]

#proof[
  The form $omega(f)$ is closed and has holomorphic degree $n$. Consequently
  $phi omega(f)$ is also closed, and the argument for
  @eq:zero-count-localization gives #seq(
    $
      integral_(partial D) phi omega(f)
      =sum_(a_nu in cal(E)_f ∩ D) integral_(partial U_nu) phi omega(f).
    $,
  ) <eq:weighted-zero-localization>
  #source(265, "253")
  Inside fixed disjoint isolating neighbourhoods, take $U_nu (epsilon)$ to be
  the component of $\{abs(f)<epsilon\}$ containing $a_nu$. Choose regular levels
  tending to zero. These neighbourhoods shrink to their respective zeros. On
  $abs(w)=epsilon$, the form $omega(w)$ is the positive normalized surface
  measure. Its pullback to $partial U_nu (epsilon)$ is nonnegative, since a
  holomorphic map preserves orientation at regular points and the pulled-back
  form vanishes at critical points. By @eq:zero-multiplicity, its total mass is
  $m_nu$. Hence
  $
    abs(
      integral_(partial U_nu (epsilon))
      (phi(z)-phi(a_nu)) omega(f(z))
    )
    <=m_nu sup_(z in partial U_nu (epsilon)) abs(phi(z)-phi(a_nu))
    ->0.
  $
  It follows that
  $
    lim_(epsilon->0) integral_(partial U_nu (epsilon)) phi(z) omega(f(z))
    =m_nu phi(a_nu).
  $
  Together with @eq:weighted-zero-localization, this proves
  @eq:weighted-zero-count.
]
