#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": corollary, example, theorem
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(253, "241")
#heading(level: 3)[Application of de Rham duality] <supp:derham-duality>
It is sometimes convenient to use de Rham duality in place of
Alexander–Pontryagin duality, following an analogous scheme.

#theorem(suffix: [* (de Rham duality)*])[
  #bib-ref("deRham1955"), #bib-ref(
    "Leray1959",
  ). _Let $X$ be a smooth manifold. For each group homomorphism
  $lambda:H_p (X)->CC$, there is a unique complex de Rham cohomology class
  $h^*=[omega] in H^p (X)$ such that, for every
  $h=[gamma] in H_p (X)$,_#footnote[
    Every closed form $omega in Z^p (X)$, or its cohomology class
    $[omega] in H^p (X)$, determines a homomorphism $lambda:H_p (X)->CC$ by
    $lambda(h)=integral_h [omega]$.
  ]
  $
    integral_h h^*=integral_gamma omega=lambda(h).
  $
] <th:derham-duality>
#index-mark([@th:derham-duality], group: [Theorems])[De Rham]

The de Rham theorem and Stokes' formula @eq:stokes-formula give the following
corollaries.

#corollary[
  _A cycle $gamma in Z_p (X)$ is weakly homologous to zero if and only if
  $integral_gamma omega=0$ for every closed form $omega in Z^p (X)$._
] <cor:homology-detection>

#source(254, "242")
#corollary[
  _A closed form $omega in Z^p (X)$ is exact if and only if
  $integral_gamma omega=0$ for every cycle $gamma in Z_p (X)$._
] <cor:exactness-detection>

For the following basis statements use homology with complex coefficients,
$H_p (X;CC)=H_p (X) ⊗_ZZ CC$. Integration extends complex linearly to this
space. A basis over $CC$ need not be an integral homology basis.

#corollary[
  _Let $gamma_1,dots,gamma_q$ be $p$-cycles and $omega_1,dots,omega_q$ closed
  $p$-forms such that_
  $
    det(a_(j k))!=0, quad a_(j k)=integral_(gamma_k) omega_j.
  $
  _If every closed $p$-form has a representation
  $omega approx sum_(j=1)^q c_j omega_j$ with $c_j in CC$, then the classes of
  the cycles form a basis of $H_p (X;CC)$ and the classes of the forms form a
  basis of $H^p (X)$._
] <cor:dual-homology-bases>
#index-mark([@cor:dual-homology-bases], major: true, after: [Dual homology
  bases, Alexander–Pontryagin])[Dual homology and cohomology bases, de Rham]

These bases are _dual in the de Rham sense_ if
$
  integral_(gamma_j) omega_k=delta_(j k).
$

#theorem(name: [on residues])[
  _Suppose that $[gamma_1],dots,[gamma_q]$ form a basis of $H_p (X;CC)$ and
  $[omega_1],dots,[omega_q]$ form its dual de Rham basis. For every $p$-cycle
  $gamma$ and every closed $p$-form $omega$,_
  $
    integral_gamma omega=sum_(j=1)^q N_j R_j,
  $
  #keep-next[_where_]
  $
    N_j=integral_gamma omega_j, quad R_j=integral_(gamma_j) omega.
  $
  _The $N_j$ are the coefficients of $[gamma]=sum_j N_j [gamma_j]$ in
  $H_p (X;CC)$, and $R_j$ is the residue, or period, of $omega$ with respect to
  $gamma_j$._ If the cycles form an integral basis modulo torsion, the
  coefficients $N_j$ of an integral cycle are integers.
] <th:period-decomposition>
#index-mark([@th:period-decomposition], group: [Residues])[Multidimensional
  (multiple)]
#index-mark([@th:period-decomposition], group: [Theorems])[On residues]

In function theory one often works with domains of holomorphy in $CC^n$ and
their generalizations, Stein manifolds (see #bib-ref("Fuks1963"), #bib-ref(
  "Shabat1969",
) and #bib-ref("Aizenberg1975")). The following theorem of Serre is useful in
this setting.

#theorem(suffix: [])[
  #bib-ref("Fuks1963"). _If $X$ is a Stein manifold, then every closed regular
  complex form $omega in Z^p (X)$ is cohomologous to a closed holomorphic
  $p$-form on $X$._
] <th:stein-holomorphic-cohomology>

Thus, on a Stein manifold, the representatives of de Rham cohomology classes in
Theorem @th:derham-duality[] and its corollaries may be chosen holomorphic. Such
forms vanish in degrees greater than the complex dimension, so we obtain:

#corollary[
  _If $X$ is a Stein manifold of complex dimension $n$, then
  $H^p (X)=H_p (X;CC)=0$ for $p>n$._
] <cor:stein-cohomology-vanishing>

#example[
  In the domain $D=CC^n without \{z:z_1 dots z_n=0\}$, the form
  $
    omega_1=frac(1, (2 pi i)^n) frac(dif z, z),
    quad frac(dif z, z)=frac(dif z_1, z_1) ∧ dots ∧ frac(dif z_n, z_n),
  $
  and the cycle $gamma_1=\{abs(z_1)=dots=abs(z_n)=1\}$, oriented by
  $(arg z_1,dots,arg z_n)$, give dual bases in degree $n$.

  #source(255, "243")
  Indeed, $D$ is a domain of holomorphy. By Theorem
  @th:stein-holomorphic-cohomology[], every closed regular $n$-form is
  cohomologous to a holomorphic form $f(z) dif z$. The function $f$ has a
  Laurent expansion, normally convergent on compact polyannuli in $D$:
  $
    f(z)=sum_(alpha in ZZ^n) c_alpha z^alpha,
    quad z^alpha=z_1^(alpha_1) dots z_n^(alpha_n).
  $
  If $alpha!=-I=(-1,dots,-1)$, choose $j$ with $alpha_j!=-1$. With the signed
  omitted differential
  $
    eta_j=(-1)^(j-1) dif z_1 ∧ dots ∧ dif z_(j-1)
    ∧ dif z_(j+1) ∧ dots ∧ dif z_n,
  $
  we have
  $
    c_alpha z^alpha dif z
    =dif lr((frac(c_alpha, alpha_j+1) z^(alpha+e_j) eta_j)),
  $
  where $e_j$ is the $j$th unit multi-index. Choose the first such $j$ for each
  $alpha$. The resulting series of primitives converges normally on compact
  polyannuli: multiplication by $z_j$ is bounded there, and $abs(alpha_j+1)>=1$.
  Termwise differentiation on smaller polyannuli therefore gives
  $
    omega approx f(z) dif z approx c_(-I) frac(dif z, z).
  $
  Since $integral_(gamma_1) omega_1=1$, Corollary @cor:dual-homology-bases[]
  proves the assertion. In this example $gamma_1$ also generates the integral
  homology in degree $n$: radial retraction identifies $D$ up to homotopy with
  the product of $n$ circles. Further applications of de Rham duality appear in
  #bib-ref("Yuzhakov1975a"), §13.
] <ex:coordinate-torus-cohomology>
