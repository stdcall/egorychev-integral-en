#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": lemma, proof, theorem
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(265, "253")
#heading(level: 3)[The logarithmic residue as an $n$-fold
  integral] <supp:logarithmic-torus-integral>
See #bib-ref("Martinelli1955"), #bib-ref("Shabat1969"), #bib-ref("Sorani1960")
and #bib-ref("Yuzhakov1973"). In the integrals below, choose regular level
cycles and transverse intersections with the relevant boundary faces. The radii
may be varied independently to achieve this. Equal radii may be used when they
give regular cycles.

#theorem(name: [logarithmic residue])[
  Under the hypotheses of Theorem @th:zero-count-boundary[], the number of zeros
  in $D$ is #seq(
    $
      N(f,D)=frac(1, (2 pi i)^n) integral_Gamma frac(dif f, f)
      =frac(1, (2 pi i)^n) integral_Gamma
      frac(dif f_1, f_1) ∧ dots ∧ frac(dif f_n, f_n),
    $,
  ) <eq:logarithmic-residue-count>
  where
  $
    Gamma=\{z in partial D:abs(f_j (z))=epsilon_j, quad j=2,dots,n\},
    quad 0<epsilon_j<min_(partial D) norm(f).
  $
  Orient $Gamma$ as the boundary of the surface
  $\{z in D:abs(f_j (z))=epsilon_j, quad j=2,dots,n\}$, whose orientation at
  points with $J_f!=0$ is determined by the parameters
  $(u_1,v_1,theta_2,dots,theta_n)$, where
  $
    f_1=u_1+i v_1, quad f_j=epsilon_j e^(i theta_j), quad j=2,dots,n.
  $
] <th:logarithmic-residue-count>
#index-mark([@th:logarithmic-residue-count], group: [Theorems])[Logarithmic
  residue, generalized]

A useful modification is the following.

#theorem[
  Let $f$ satisfy the hypotheses of Theorem @th:zero-count-boundary[]. Suppose
  that $D ⋐ G$ is a connected component, or a finite union of connected
  components, of
  $
    \{z in G:abs(f_j (z))<rho_j, quad j=1,dots,n\}.
  $
  Then @eq:logarithmic-residue-count holds for the distinguished boundary
  $
    Gamma=\{z in overline(D):abs(f_j (z))=rho_j, quad j=1,dots,n\},
  $
  oriented by $(arg f_1,dots,arg f_n)$ at points where $J_f!=0$.
] <th:logarithmic-torus-count>
#index-mark([@th:logarithmic-torus-count], group: [Theorems])[Logarithmic
  residue, generalized]

#theorem(name: [weighted logarithmic residue])[
  If $phi$ is holomorphic in $G$, then under the hypotheses of Theorems
  @th:logarithmic-residue-count[] and @th:logarithmic-torus-count[],
  respectively, #seq(
    $
      frac(1, (2 pi i)^n) integral_Gamma phi(z) frac(dif f(z), f(z))
      =sum_(a_nu in cal(E)_f ∩ D) m_nu phi(a_nu),
    $,
  ) <eq:logarithmic-weighted-count>
  where $m_nu$ is the multiplicity of $a_nu$, and
  $
    frac(dif f, f)=frac(dif f_1, f_1) ∧ dots ∧ frac(dif f_n, f_n).
  $
] <th:logarithmic-weighted-count>

The next result is useful in applications.

#theorem[
  Let $f$, $D$ and $Gamma$ satisfy the hypotheses of Theorem
  @th:logarithmic-torus-count[], and let #seq(
    $ g=(g_1,dots,g_n) $,
  ) <eq:torus-perturbed-map>
  #source(266, "254")
  be holomorphic in $G$. Suppose that, on $Gamma$, #seq(
    $ abs(f_j (z)-g_j (z))<abs(f_j (z))=rho_j, quad j=1,dots,n. $,
  ) <eq:torus-rouche-bound>
  Then $f$ and $g$ have the same number of zeros in $D$, counting
  multiplicities. Moreover, for every holomorphic function $phi$ in $G$, #seq(
    $
      frac(1, (2 pi i)^n) integral_Gamma phi(z)
      frac(dif g_1 (z), g_1 (z)) ∧ dots ∧ frac(dif g_n (z), g_n (z))
      =sum_(b_nu in cal(E)_g ∩ D) m_nu phi(b_nu),
    $,
  ) <eq:torus-weighted-perturbation>
  where $m_nu$ is the multiplicity of the zero $b_nu$ of $g$.
] <th:torus-perturbed-map>

#lemma[
  Under the hypotheses of Theorem @th:torus-perturbed-map[], there is a
  $delta_0>0$ such that, for sufficiently small regular choices
  $0<delta_j<delta_0$,
  $
    Gamma ∼ gamma(delta)
    =\{z in D:abs(g_j (z))=delta_j, quad j=1,dots,n\}
  $
  in the domain
  $ G_g=G without \{z in G:g_1 (z) dots g_n (z)=0\}. $
] <lem:local-polyhedron-excision>

#proof[
  Set
  $
    r_j=max_(z in overline(D)) abs(f_j (z)-g_j (z)), quad j=1,dots,n.
  $
  A holomorphic function on a neighbourhood of the closure of this analytic
  polyhedron attains its maximum modulus on the distinguished boundary $Gamma$;
  see #bib-ref("Fuks1963"), §15. Thus @eq:torus-rouche-bound implies
  $r_j<rho_j$. Take $delta_0=min_j (rho_j-r_j)$. For $p=0,dots,n$, let
  $
    Gamma_p=\{z in overline(D):
    abs(g_j (z))=delta_j, quad j<=p; quad
    abs(f_j (z))=rho_j, quad j>p\}.
  $
  These cycles lie in $G_g$: for $j>p$, $abs(g_j)>=rho_j-r_j>delta_j>0$, and for
  $j<=p$ their moduli are fixed and positive. We have $Gamma_0=Gamma$ and
  $Gamma_n=gamma(delta)$. For $p=1,dots,n$, consider
  $
    B_p=\{z in overline(D):
    abs(g_j (z))=delta_j, quad j<p; quad
    abs(g_p (z))>=delta_p; quad
    abs(f_j (z))=rho_j, quad j>p\}.
  $
  The inequality $abs(f_p)<=rho_p$ is included in $z in overline(D)$. Orient
  $B_p$ so that its outer boundary is $Gamma_(p-1)$ and its inner boundary is
  $-Gamma_p$. There are no further boundary faces: if $j<p$, then
  $abs(f_j)<=delta_j+r_j<rho_j$. Hence
  $
    partial B_p=Gamma_(p-1)-Gamma_p, quad B_p subset G_g,
  $
  and
  $ Gamma=Gamma_0 ∼ Gamma_1 ∼ dots ∼ Gamma_n=gamma(delta). $
]

#proof(title: [Proof of @th:logarithmic-torus-count])[
  Enclose the zeros $a_nu in cal(E)_f ∩ D$ in neighbourhoods $U_nu$ with
  disjoint closures in $D$. Choose regular radii $epsilon_j>0$ so small that
  $
    max_j epsilon_j<min_(overline(D) without union_nu U_nu) norm(f(z)),
    quad epsilon_j<rho_j.
  $
  The small distinguished boundary
  $
    gamma(epsilon)=\{z in D:abs(f_j (z))=epsilon_j, quad j=1,dots,n\}
  $
  lies in the union of the $U_nu$. Write
  $
    gamma_nu=gamma(epsilon) ∩ U_nu,
    quad gamma(epsilon)=sum_(a_nu in cal(E)_f ∩ D) gamma_nu.
  $
  #source(267, "255")
  Apply the deformation in Lemma @lem:local-polyhedron-excision[] with $g=f$. It
  gives $Gamma ∼ gamma(epsilon)$ in
  $G_f=G without \{z:f_1 (z) dots f_n (z)=0\}$. The Cauchy–Poincaré theorem
  therefore gives #seq(
    $
      frac(1, (2 pi i)^n) integral_Gamma frac(dif f, f)
      =sum_(a_nu in cal(E)_f ∩ D)
      frac(1, (2 pi i)^n) integral_(gamma_nu) frac(dif f, f).
    $,
  ) <eq:logarithmic-localization>

  If $a_nu$ is simple, choose $U_nu$ inside a biholomorphic coordinate
  neighbourhood of $f$. The change of variables $w=f(z)$ gives #seq(
    $
      frac(1, (2 pi i)^n) integral_(gamma_nu) frac(dif f, f)
      =frac(1, (2 pi i)^n) integral_(abs(w_j)=epsilon_j)
      frac(dif w, w)=1,
    $,
  ) <eq:simple-logarithmic-residue>
  where the last integral is over the product torus, oriented by
  $(arg w_1,dots,arg w_n)$.

  If $a_nu$ has multiplicity $m_nu$, choose a sufficiently small regular value
  $zeta$ with $abs(zeta_j)<epsilon_j$. By Proposition
  @prop:shifted-holomorphic-map[], $f-zeta$ has $m_nu$ simple zeros $a_(nu,j)$
  in $U_nu$. Apply Lemma @lem:local-polyhedron-excision[] to the small
  polyhedron inside $U_nu$, with distinguished boundary $gamma_nu$, and to
  $g=f-zeta$. For sufficiently small regular radii
  $0<delta_j<epsilon_j-abs(zeta_j)$, it gives
  $
    gamma_nu ∼ gamma_nu (delta)
    =\{z in U_nu:abs(f_j (z)-zeta_j)=delta_j, quad j=1,dots,n\}
  $
  in $G_(f-zeta)$. Choose these radii small enough that the latter cycle is a
  sum of tori $gamma_(nu,j)$, each lying in a biholomorphic neighbourhood of one
  of the simple zeros. Formula @eq:simple-logarithmic-residue yields
  $
    frac(1, (2 pi i)^n) integral_(gamma_nu) frac(dif(f-zeta), f-zeta)
    & =frac(1, (2 pi i)^n) integral_(gamma_nu (delta))
    frac(dif(f-zeta), f-zeta) \
    & =sum_(j=1)^(m_nu) frac(1, (2 pi i)^n)
    integral_(gamma_(nu,j)) frac(dif(f-zeta), f-zeta)=m_nu.
  $
  Letting $zeta$ tend to zero through regular values, on the fixed cycle
  $gamma_nu$ we obtain #seq(
    $
      frac(1, (2 pi i)^n) integral_(gamma_nu) frac(dif f, f)
      =lim_(zeta->0) frac(1, (2 pi i)^n)
      integral_(gamma_nu) frac(dif(f-zeta), f-zeta)=m_nu.
    $,
  ) <eq:multiple-logarithmic-residue>
  Together with @eq:logarithmic-localization, this proves Theorem
  @th:logarithmic-torus-count[].
]

#proof(title: [Proof of @th:logarithmic-residue-count])[
  Put $c=min_(partial D) norm(f)>0$. At every point of $Gamma$, the components
  $f_j$ with $j>=2$ have their prescribed positive moduli, all less than $c$.
  Since $norm(f)>=c$, necessarily $abs(f_1)>=c$. Thus $Gamma subset G_f$. Choose
  also $0<epsilon_1<min_(partial D) norm(f)$ and set
  $
    D_1=\{z in D:abs(f_j (z))<epsilon_j, quad j=1,dots,n\},
  $
  with distinguished boundary $Gamma_1$. Its closure is in $D$, and
  $D_1 ∩ cal(E)_f=D ∩ cal(E)_f$.
  #source(268, "256")
  The chain
  $
    B=\{z in overline(D):abs(f_1 (z))>=epsilon_1,
    quad abs(f_j (z))=epsilon_j, quad j=2,dots,n\}
  $
  lies in $G_f$ and has boundary $Gamma-Gamma_1$. Apply the Cauchy–Poincaré
  theorem and Theorem @th:logarithmic-torus-count[] to $D_1$ and $Gamma_1$.
]

#proof(title: [Proof of @th:logarithmic-weighted-count])[
  Repeat these arguments with the closed holomorphic $n$-form $phi dif f/f$. At
  a simple zero, the product Cauchy formula gives
  $
    frac(1, (2 pi i)^n) integral_(gamma_nu) phi(z) frac(dif f(z), f(z))
    & =frac(1, (2 pi i)^n) integral_(abs(w_j)=epsilon_j)
    phi(f^(-1)(w)) frac(dif w, w) \
    & =phi(a_nu),
  $
  where $f^(-1)$ is the local inverse. At a multiple zero,
  $
    frac(1, (2 pi i)^n) integral_(gamma_nu) phi frac(dif f, f)
    & =lim_(zeta->0) frac(1, (2 pi i)^n)
    integral_(gamma_nu) phi frac(dif(f-zeta), f-zeta) \
    & =lim_(zeta->0) sum_(j=1)^(m_nu) phi(a_(nu,j))
    =m_nu phi(a_nu).
  $
  Here the perturbed zeros tend to $a_nu$, and the integrals converge on the
  fixed cycle, where all denominators stay bounded away from zero.
]

#proof(title: [Proof of @th:torus-perturbed-map])[
  As in Lemma @lem:local-polyhedron-excision[], $abs(f_j-g_j)<=r_j<rho_j$
  throughout $overline(D)$. Define
  $
    F_j=f_j/rho_j, quad H_j=(g_j-f_j)/rho_j.
  $
  On $partial D$ at least one $abs(F_j)$ equals $1$, and all are at most $1$.
  Consequently $norm(H)<1=norm(F)$ there. Theorem @th:rouche-bound[], applied to
  $F$ and $H$, proves equality of the zero counts for $f$ and $g$.

  For small regular $delta_j$ as in Lemma @lem:local-polyhedron-excision[], put
  $
    D_1=\{z in D:abs(g_j (z))<delta_j, quad j=1,dots,n\}.
  $
  Its closure lies in $D$ and it contains all zeros of $g$ in $D$. The lemma and
  Theorem @th:logarithmic-weighted-count[] give
  $
    frac(1, (2 pi i)^n) integral_Gamma phi frac(dif g, g)
    & =frac(1, (2 pi i)^n) integral_(gamma(delta)) phi frac(dif g, g) \
    & =sum_(b in cal(E)_g ∩ D) m_b phi(b),
  $
  which is @eq:torus-weighted-perturbation.
]
