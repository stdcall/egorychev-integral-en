#import "index-style.typ": index-mark
#import "statements.typ": remark, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(217, "205")
#heading(level: 2)[
  Computation of Szegő and Bergman kernels for certain bounded $n$-circular
  domains
] <sec:bounded-kernels>
#index-mark([@sec:bounded-kernels], group: [Kernels])[Bergman]
#index-mark([@sec:bounded-kernels], group: [Kernels])[Szegö]

Our initial work on these kernels concerned bounded domains. The method of
integral representation of sums yielded integral representations, power-series
representations with explicit monomial coefficients, and closed formulas; see
#bib-ref("Egorychev1975b") and #bib-ref("Egorychev1973b").

#source(218, "206")
Use the positive integers $n_1>dots>n_k$, the matrix $P$, the consecutive blocks
$B_(i,j)$ and the radial sums $L_(i,j)$ defined before
@eq:nested-exponential-domain, with $n=n_1$. The bounded domain is #eq(
  $
    D^P=lr({z in CC^n: F(z)<1}), quad
    F(z)=sum_(v=1)^(n_k) L_(k,v)(z)^(1/p_(k,v)).
  $,
) <eq:bounded-nested-domain>
Thus every level, including the last, takes its specified root before summing.

#remark[
  The defining function $F$ is plurisubharmonic. Indeed, away from coordinate
  hyperplanes the logarithms of the nested sums are formed from $log abs(z_j)^2$
  by positive scaling and the convex, coordinatewise increasing operation
  $(u_1,dots,u_r) mapsto log(sum_j e^(u_j))$. The resulting nonnegative
  functions extend continuously across the hyperplanes. See #bib-ref(
    "Hormander1966",
  ), Theorem 1.6.7 and Corollaries 1.6.6 and 1.6.8. The function $-log(1-F)$ is
  then a plurisubharmonic exhaustion of $D^P$, so $D^P$ is a domain of
  holomorphy.

  #keep-next[
    Let $Q(x)$ be the Bergman kernel of @eq:bounded-nested-domain with respect
    to ordinary volume, and let $R(x)$ be its Szegő kernel for the normalized
    graph measure corresponding to
  ]
  $
    frac(1, (2 pi i)^n) dif abs(ζ)^2 [1] ∧ frac(dif ζ, ζ).
  $
  Here the omitted radial coordinate is the first. Put
  $
    σ_(i,j)=exp(2 pi i α_(i,j)/p_(i,j)), quad U_(1,j)(x)=x_j,
  $
  $
    U_(i,j)(x)=sum_(r in B_(i,j)) σ_(i-1,r)
    U_(i-1,r)(x)^(1/p_(i-1,r)) quad (2<=i<=k).
  $
  In the sum below, every $α_(i,j)$ independently ranges from $1$ to $p_(i,j)$,
  for all $1<=i<=k$ and $1<=j<=n_i$.

  #source(219, "207")
]

#theorem[
  _The following relations hold:_
  #eq(
    $
      Q(x) & =frac(1, pi^n)
      lr((product_(i=1)^k product_(j=1)^(n_i) p_(i,j)^(-1)))
      frac(∂^n, ∂ x_1 dots ∂ x_n) \
      & quad times sum_α frac(
        1, 1-sum_(v=1)^(n_k) σ_(k,v)U_(k,v)(x)^(1/p_(k,v)),
      ),
    $,
  ) <eq:bounded-bergman-kernel>
  #eq($Q(x)=frac(1, pi^n) frac(∂, ∂ x_1)R(x).$) <eq:bounded-kernel-relation>
  The complete root sum in @eq:bounded-bergman-kernel is independent of the
  initial branch choices and is holomorphic near $x=0$.
] <th:bounded-bergman-kernel>

#remark[
  Every algebraic conjugation permutes the complete set of root choices in
  @eq:bounded-bergman-kernel, so their sum, and hence $Q(x)$, is rational. For
  the general principle concerning globally single-valued algebraic functions,
  see #bib-ref(
    "Hurwitz1929",
  ), p. 393, and #bib-ref("Shabat1969"), Problem 16b, p. 302.

  The proof follows the same scheme as @sec:bergman-kernel[Example] of
  §@sec:method-examples and §@sec:szego-computation. We omit the details because
  the calculations and notation are cumbersome. In #bib-ref(
    "Egorychev1973b",
  ) and #bib-ref(
    "Egorychev1974c",
  ) a complete proof is given for $k=3$ and $n_3=2$; it illustrates several
  principal computational difficulties of the general theorem.

  The method developed in §§@sec:unbounded-szego-kernels and
  @sec:bounded-kernels applies to Szegő and Bergman kernels for a large class of
  concrete bounded and unbounded domains.
]
