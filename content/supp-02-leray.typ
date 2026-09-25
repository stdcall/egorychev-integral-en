#import "index-style.typ": index-mark
#import "supp-statements.typ": theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source
#import "supp-defs.typ": seq

#let tube-map = $limits(arrow.r.long)^delta$
#let residue-map = $limits(arrow.r.long)^(op("Res"))$

#source(255, "243")
#heading(level: 3)[The Leray theory of residues. Froissart's decomposition
  theorem] <supp:leray-residues>

We follow #bib-ref("Leray1959"), #bib-ref("Pham1967") and #bib-ref("Hwa1966").
Let $X$ be a complex analytic manifold and $S$ a closed complex submanifold of
codimension one. The _Leray coboundary_ is represented on suitably subdivided
chains by #seq($ delta:C_p (S)->C_(p+1)(X without S). $) <eq:leray-coboundary>

Choose a smooth tubular neighbourhood of $S$, identified with a neighbourhood of
the zero section in its complex normal line bundle. To each $z in S$ assign the
small circle $delta z$ in the normal fibre, oriented positively in that complex
line. The construction has the following properties:

#enum(
  numbering: "a)",
  [$delta S=union.big_(z in S) delta z$ is a smooth circle bundle over $S$.],
  [Distinct base points have disjoint fibres.],
  [In a local trivialization of the normal bundle, the zero section is $zeta=0$
    and the fibre over $a$ is $abs(zeta)=epsilon(a)$, where the smooth positive
    radius is sufficiently small.],
)

For a parametrized simplex $sigma_p$, pull back this circle bundle to its
parameter simplex. Locally its total space is $S^1 times Delta_p$; map it into
$X without S$ and triangulate it, with the circle orientation first and the
simplex orientation second. Extend linearly, using compatible subdivisions. This
preserves the multiplicities of the chain. The product boundary rule gives
$
  partial delta sigma_p=-delta partial sigma_p.
$
Thus @eq:leray-coboundary induces a homomorphism
$
  delta:H_p (S)->H_(p+1)(X without S),
$
independent of the sufficiently small tubular neighbourhood and the auxiliary
choices.

Let $omega in Z^p (X without S)$, $p>=1$, have a pole of order at most one along
$S$. This means that, near every $a in S$, the form $s omega$ extends smoothly
across $S$, where $s$ is a holomorphic local defining function with $dif s!=0$
on $S$. The extension is a regular differential form. Locally one can write
$
  omega=frac(dif s, s) ∧ phi+theta,
$
#source(256, "244")
where $phi$ and $theta$ are regular forms. The restriction $phi|_(S ∩ U_a)$ is
closed and independent of this decomposition, the coordinates and the local
defining function. These restrictions define the _residue form_
$op("res")[omega] in Z^(p-1)(S)$.

#theorem(name: [Leray residue formula])[
  _If $gamma in Z_(p-1)(S)$ and $omega in Z^p (X without S)$ has a pole of order
  at most one along $S$, then_
  #seq(
    $ integral_(delta gamma) omega=2 pi i integral_gamma op("res")[omega]. $,
  ) <eq:leray-residue>
] <th:leray-residue>
#index-mark([@th:leray-residue], group: [Formulas])[Leray residue]

#theorem(suffix: [* (Leray)*])[
  #bib-ref("Leray1959"). _Every closed regular $p$-form $omega$ on
  $X without S$, $p>=1$, is cohomologous there to a closed form $tilde(omega)$
  with a pole of order at most one along $S$._
] <th:simple-pole-representative>
#index-mark([@th:simple-pole-representative], group: [Residues])[Residue class]
#index-mark([@th:simple-pole-representative], group: [Theorems])[Leray]

The class $[op("res")[tilde(omega)]] in H^(p-1)(S)$ is independent of this
choice of representative. It is the _residue class_ of $[omega]$, denoted by
$op("Res")[omega]$. This defines a homomorphism
$
  op("Res"):H^p (X without S)->H^(p-1)(S).
$
Formula @eq:leray-residue now gives
$
  integral_(delta gamma) omega=2 pi i integral_gamma op("Res")[omega]
$
for every closed regular form on $X without S$.

#metadata((kind: "index-anchor")) <idx:multiple-residue>
#index-mark([@idx:multiple-residue], group: [Residues])[Residue class, multiple]
#metadata((kind: "index-anchor")) <idx:general-position>
#index-mark([@idx:general-position], group: [General position])[Manifolds]
Let $S_1,dots,S_k$ be closed complex hypersurfaces in _general position_: at any
point of an intersection $S_(j_1) ∩ dots ∩ S_(j_r)$, the differentials of the
corresponding local defining functions are linearly independent. With the order
$S_1,dots,S_k$ fixed, define the _multiple coboundary_
$
  delta^k:H_p (S_1 ∩ dots ∩ S_k)
  ->H_(p+k)(X without (S_1 union dots union S_k))
$
#keep-next[as the following composition, starting with the tube about $S_k$:]
$
  & H_p (S_1 ∩ dots ∩ S_k) \
  & #tube-map H_(p+1)((S_1 ∩ dots ∩ S_(k-1)) without S_k) \
  & #tube-map dots \
  & #tube-map H_(p+k-1)(S_1 without (S_2 union dots union S_k)) \
  & #tube-map H_(p+k)(X without (S_1 union dots union S_k)).
$
The _multiple residue class_ is obtained in the reverse order of these maps:
$
  & H^(p+k)(X without (S_1 union dots union S_k)) \
  & #residue-map H^(p+k-1)(S_1 without (S_2 union dots union S_k)) \
  & #residue-map dots \
  & #residue-map H^(p+1)((S_1 ∩ dots ∩ S_(k-1)) without S_k) \
  & #residue-map H^p (S_1 ∩ dots ∩ S_k).
$

#source(257, "245")
For $omega in Z^(p+k)(X without (S_1 union dots union S_k))$ and
$gamma in Z_p (S_1 ∩ dots ∩ S_k)$, successive applications of @eq:leray-residue
give the _Leray multiple residue formula_ #seq(
  $
    integral_(delta^k gamma) omega=(2 pi i)^k integral_gamma op("Res")^k[omega].
  $,
) <eq:multiple-leray-residue>
Changing the order of the hypersurfaces by a permutation changes both the
multiple tube and the multiple residue by the sign of that permutation.

#metadata((kind: "index-anchor")) <idx:multiple-leray>
#index-mark([@idx:multiple-leray], group: [Formulas])[Leray residue, multiple]
An algorithm for determining the residue class of semimeromorphic forms is given
in #bib-ref("Leray1959"), Chapter VI, and #bib-ref("Pham1967"), Chapter III,
§4.3. Such forms become regular locally after multiplication by suitable powers
of the local defining functions of their polar hypersurfaces.

#theorem(suffix: [* (Froissart decomposition theorem)*])[
  #bib-ref(
    "Hwa1966",
  ).
  _Let $Sigma_1,dots,Sigma_m$ and $S_0,S_1,dots,S_k$ be closed complex
  hypersurfaces in $CC P^n$, with their combined family in general position. Let
  $S_0=CC P^(n-1)$ be the hyperplane at infinity, so that
  $CC P^n without S_0=CC^n$, and put_
  $
    X=CC^n ∩ inter.big_(j=1)^m Sigma_j,
    quad X_h=X ∩ inter.big_(j in h) S_j,
    quad X_emptyset=X.
  $
  #keep-next[_There is a direct-sum decomposition, with complex homology
  coefficients,_]
  $
    H_q (X without (S_1 union dots union S_k);CC)
    & ≅ ⨁_(h subset.eq \{1,dots,k\})
    H_(q-abs(h))(X_h;CC) \
    & =H_q (X;CC)
    ⊕ ⨁_(j=1)^k H_(q-1)(X ∩ S_j;CC) \
    & quad ⊕ ⨁_(1<=i<j<=k) H_(q-2)(X ∩ S_i ∩ S_j;CC) ⊕ dots.
  $
  The summands are realized by successive Leray tubes, with compatible choices
  of cycle lifts away from the remaining hypersurfaces. The copy indexed by $h$
  is traditionally written $delta^(abs(h)) H_(q-abs(h))(X_h)$; these embeddings
  are not canonical. The empty subset gives the ordinary $H_q (X)$ term, and
  negative homology degrees contribute zero.
] <th:froissart-decomposition>
#index-mark([@th:froissart-decomposition], group: [Theorems])[Froissart
  decomposition]

Thus, under these hypotheses, a homology class is a sum of a lift from $X$ and
multiple coboundary classes. The integrals over the latter reduce by the Leray
formulas to integrals over cycles of lower dimension on the corresponding
intersections.
