#import "index-style.typ": index-mark
#import "statements.typ": proof, remark, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(199, "187")
#heading(level: 1)[Applications] <ch:applications>
#heading(
  level: 2,
  numbering: none,
)[Introduction] <sec:applications-introduction>

This chapter presents results in function theory and group theory directly
connected with the method of integral representation of sums.

In §@sec:unbounded-szego-kernels, written jointly with L. A. Aizenberg, we study
integral representations with Szegő kernels for functions holomorphic in
unbounded $n$-circular domains. We obtain closed formulas for the kernels of a
large class of such domains. The hypotheses reflect properties of functions of
several complex variables; boundary square-integrability alone does not give the
analogous representation in a general one-dimensional domain.

In §@sec:bounded-kernels we obtain integral, power-series and closed-form
representations of the Szegő and Bergman kernels for a large class of bounded
$n$-circular domains depending on integer parameters. A formal passage to the
limit in these formulas suggested the kernels for unbounded domains that are
computed in §@sec:unbounded-szego-kernels. Special parameter values recover
formulas previously obtained by other methods in #bib-ref("Aizenberg1964"),
#bib-ref(
  "Fuks1962",
), #bib-ref("Borodin1969"), #bib-ref("Chalmers1968"), #bib-ref("Zinovev1971"),
#bib-ref("Zinovev1974") and #bib-ref("Zinovev1973").

In §@sec:solvable-polynilpotent-ranks we use combinatorial methods to find the
ranks of the factors of the lower central series of a free solvable group of
derived length $k$ and of a free polynilpotent group. This extends
§@sec:enumeration-integrals, where an analogous formula for derived length three
was obtained analytically. These results led to §@sec:p-central-ranks, written
jointly with Yu. D. Ushakov.

#source(200, "188")
#heading(level: 2)[
  Integral representations with Szegő kernels for unbounded $n$-circular domains
] <sec:unbounded-szego-kernels>
#index-mark([@sec:unbounded-szego-kernels], group: [Kernels])[Szegö]
#heading(level: 3)[
  Integral representations with Szegő kernels for holomorphic functions
] <sec:szego-representation>

Throughout this section, $D$ is an unbounded complete $n$-circular domain
centred at the origin in $CC^n$, where $n>1$; see #bib-ref("Vladimirov1964"),
Chapter I, §7.5, and #bib-ref("Fuks1962"), Chapter I, §3.2. Completeness means
that, with each $z in D$, the domain contains every $w$ satisfying
$abs(w_j)<=abs(z_j)$ for $j=1,dots,n$.

Write $abs(z)=(abs(z_1),dots,abs(z_n))$ for the image of $z$ in the nonnegative
octant of $RR^n$. The image $abs(D)$ determines $D$; likewise $abs(∂ D)$ denotes
the image of its boundary. Let $λ$ be a positive $σ$-finite measure on
$abs(∂ D)$ for which Borel sets are measurable; see #bib-ref("Halmos1950"),
Chapter II, §7, and Chapter IV, §17.

The boundary is the union of the tori
$
  Γ(ρ)=lr(
    {ζ: ζ_j=ρ_j e^(i θ_j),
      0<=θ_j<=2π, quad j=1,dots,n}
  ), quad ρ in abs(∂ D).
$
Angular integration uses normalized Haar measure $d θ/(2π)^n$. When every
$ρ_j>0$, this is the same as $d ζ/((2π i)^n ζ)$ on $Γ(ρ)$. The angular
definition also applies to degenerate tori with zero radii. Let $λ'$ be the
pushforward of $d λ(ρ) d θ/(2π)^n$ under $(ρ,θ) mapsto (ρ_j e^(i θ_j))_(j=1)^n$.

#keep-next[Consider the Szegő kernel]
#eq(
  $
    h(z overline(ζ))=h(z_1 overline(ζ)_1,dots,z_n overline(ζ)_n)
    =sum_(k in NN^n) a_k z^k overline(ζ)^k,
  $,
) <eq:reproducing-kernel-series>
where
$
  z^k=product_(j=1)^n z_j^(k_j), quad
  M_k=integral_(abs(∂ D)) ρ^(2k) d λ(ρ), quad a_k=M_k^(-1).
$
Here $NN$ includes $0$, and $infinity^(-1)=0$. The hypotheses below ensure
$M_k>0$, while allowing $M_k=infinity$.

#keep-next[We seek conditions under which the representation]
#eq(
  $
    f(z)=frac(1, (2π i)^n)
    integral_(abs(∂ D)) d λ
    integral_(Γ(abs(ζ))) f(ζ) h(z overline(ζ)) frac(d ζ, ζ)
  $,
) <eq:reproducing-integral>
holds for every $f$ holomorphic in $D$, continuous at all finite points of
$overline(D)$, and square-integrable on $∂ D$ with respect to $λ'$. Denote this
class by $A_c^2 (D,λ)$. The angular interpretation above is understood in
@eq:reproducing-integral. We require the kernel to be holomorphic in
$overline(ζ)$ near every finite point of #source(201, "189")$overline(D)$ for
fixed $z in D$, holomorphic in $z in D$ for fixed $ζ in ∂ D$, and in $L^2 (λ')$
as a function of $ζ$ for fixed $z$.

#keep-next[Every holomorphic function in $D$ has a Taylor expansion]
#eq($f(z)=sum_(k in NN^n) b_k z^k.$) <eq:holomorphic-series>
Formally multiplying @eq:reproducing-kernel-series and @eq:holomorphic-series
and integrating term by term suggests @eq:reproducing-integral. The problem is
to justify these operations, including the possible infinite moments, and to
establish the required properties of the kernel.

For a bounded complete $n$-circular domain and a finite measure $λ$, this
question was studied in #bib-ref("Aizenberg1964") and #bib-ref("Aizenberg1973").
Continuity on the compact closure then makes the $L^2$ condition automatic. The
criterion involves the Shilov boundary $S(D)$; see #bib-ref("Fuks1963"), Chapter
III, §15.1. Its image in the octant of moduli is $abs(S(D))$.
#keep-next[
  A measure on $abs(∂ D)$ is called _massive_ on a set $F$ if
]
$
  overline(abs(∂ D) without E) supset.eq F
  quad "for every measurable" E subset.eq abs(∂ D)
  " with " λ(E)=0.
$
Equivalently, every neighbourhood of every point of $F$ has positive
$λ$-measure. In the bounded case with finite $λ$, the Szegő representation
exists if and only if $λ$ is massive on $abs(S(D))$.

For the unbounded domain, put
$
  D^R=D inter lr({z: abs(z_j)<R, quad j=1,dots,n}).
$
#theorem[
  _Suppose there is a sequence $R_m>0$ tending to infinity such that $λ$ is
  massive on $abs(S(D^(R_m)))$ for every $m$. Then the representation
  @eq:reproducing-integral holds for every $f in A_c^2 (D,λ)$, and the kernel
  has the properties stated above._
] <th:szego-reproducing-representation>

#proof[
  Write $D_m=D^(R_m)$. First we construct a finite measure on each truncated
  boundary to which the bounded-domain result applies. Since $λ$ is $σ$-finite,
  choose a finite measure $ν<=λ$ with the same null sets. For example, take a
  measurable partition $E_j$ with $λ(E_j)<infinity$ and set
  $
    d ν=sum_(j>=1) frac(2^(-j), 1+λ(E_j)) bold(1)_(E_j) d λ.
  $
  The continuous map
  $
    T_m (ρ)=frac(ρ, max(1, norm(ρ)_infinity/R_m))
  $
  sends $abs(∂ D)$ to $abs(∂ D_m)$ and decreases every coordinate. It fixes
  $abs(S(D_m))$: these points lie in $abs(∂ D)$ by massiveness and have
  coordinates at most $R_m$. Thus the pushforward $ν_m=(T_m)_* ν$ is finite and
  massive on $abs(S(D_m))$.

  #keep-next[The bounded-domain result gives the auxiliary kernel]
  #eq(
    $
      h^m (z overline(ζ))=sum_(k in NN^n) a_k^m z^k overline(ζ)^k,
      quad a_k^m=lr((integral_(abs(∂ D_m)) ρ^(2k) d ν_m))^(-1).
    $,
  ) <eq:exhaustion-kernel-series>
  Its moments are positive and finite. Since $T_m$ decreases coordinates and
  $ν<=λ$,
  $
    0<integral_(abs(∂ D_m)) ρ^(2k) d ν_m
    <=M_k<=infinity, quad 0<=a_k<=a_k^m.
  $
  Consequently, the series for $h^m$ majorizes the series for $h$ in absolute
  value. Given $z in D$ and a finite $ζ in overline(D)$, choose $m$ so large
  that $z in D_m$ and $ζ in overline(D_m)$. The local normal convergence of the
  bounded kernel yields the required holomorphy of $h$.
  #keep-next[#source(202, "190")In particular,]
  $
    sum_k a_k abs(z)^(2k)<=h^m (z overline(z))<infinity.
  $

  Put $I=lr({k in NN^n: M_k<infinity})$. On each boundary torus, the angular
  Fourier coefficient of $f$ at $k$ is $b_k ρ^k$. Indeed, for $0<t<1$ the Taylor
  series of $f(t ζ)$ converges uniformly there, and continuity gives
  $f(t ζ) arrow.r f(ζ)$ uniformly as $t arrow.r 1$. Parseval's identity on the
  torus and Tonelli's theorem therefore give
  $
    integral_(∂ D) abs(f(ζ))^2 d λ'(ζ)
    =sum_k integral_(abs(∂ D)) abs(b_k)^2 ρ^(2k) d λ(ρ).
  $
  The left side is finite, so $b_k=0$ whenever $M_k=infinity$. Hence
  $
    norm(f)_(L^2 (λ'))^2=sum_(k in I) abs(b_k)^2 M_k.
  $
  The same angular orthogonality, applied to the kernel, yields
  $
    integral_(∂ D) abs(h(z overline(ζ)))^2 d λ'(ζ)
    =sum_(k in I) frac(abs(z)^(2k), M_k)<infinity.
  $
  Thus both series converge in $L^2 (λ')$ when ordered by finite sets of
  multi-indices. Cauchy–Schwarz justifies passing to the limit in their pairing,
  and angular orthogonality gives
  #source(203, "191")
  $
    integral_(∂ D) f(ζ) h(z overline(ζ)) d λ'(ζ)
    =sum_(k in I) b_k z^k=f(z).
  $
  This is @eq:reproducing-integral. All divisions in the argument involve
  finite, positive moments; the other Taylor coefficients vanish.
]

#remark[
  In these unbounded $n$-circular domains, membership in $A_c^2 (D,λ)$ suffices
  for the representation. This contrasts with the upper half-plane in one
  variable: $f(z)=e^(-z^2)$ is holomorphic there, continuous on the real axis
  and square-integrable on that axis, but is not represented by its Cauchy
  integral; see #bib-ref("Bremermann1965"), Chapter 7, §7.16. One usually
  imposes membership in the Hardy class $H^2$, which requires the integrals of
  $abs(f)^2$ along horizontal lines to remain uniformly #source(
    204,
    "192",
  )bounded. The theorem thus reflects the particular geometry of complete
  $n$-circular domains when $n>1$.
]

#remark[
  Some coefficients $a_k$ in @eq:reproducing-kernel-series may be zero because
  the corresponding moments are infinite. As the proof shows, every
  $f in A_c^2 (D,λ)$ then has $b_k=0$ at those indices.
]
