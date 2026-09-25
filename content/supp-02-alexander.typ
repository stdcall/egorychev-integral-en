#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": example, proposition, theorem
#import "supp-defs.typ": seq

#source(249, "237")
#heading(level: 2)[Elements of the general theory of multidimensional
  residues] <supp:residue-theory>
#heading(level: 3)[The subject of the theory] <supp:subject-of-residue-theory>
#index-mark([@supp:subject-of-residue-theory])[Singular set (surface)]
In a narrow sense, the main problem of multidimensional residue theory is the
study and computation of integrals of holomorphic functions of $n$ complex
variables#footnote[More precisely, of holomorphic forms of degree $n$.] over
$n$-dimensional cycles in their domain of regularity. In a broader sense, it is
the computation of integrals of closed differential forms over cycles on a
complex analytic manifold. One commonly considers forms with singularities on an
analytic set of complex codimension one, locally given by $g(z)=0$ with $g$
holomorphic.

The corollaries of Stokes' theorem permit replacement of a closed form by a
simpler cohomologous form and of its integration cycle by a simpler homologous
cycle.
#source(250, "238")
Corollaries @cor:null-homologous-periods[] and
@cor:homology-cohomology-pairing[] of §@supp:forms-and-stokes give the following
proposition.

#proposition[
  _Let $\{gamma_j\}$ be a homology basis in degree $p$, in the sense of
  §@supp:chains-and-homology, and let $omega$ be a closed $p$-form on $X$. For
  every cycle $gamma in Z_p (X)$,_
  #seq(
    $ integral_gamma omega=sum_j k_j integral_(gamma_j) omega, $,
  ) <eq:homology-periods>
  _where $gamma approx sum_j k_j gamma_j$ is its expansion in the basis._
] <prop:homology-periods>

Computing an integral of a closed form over a cycle thus reduces to three
problems: determining the homology group and constructing a basis, computing the
integrals over basis cycles, and finding the expansion coefficients of the
integration cycle. In several dimensions these problems can be much more
difficult than in one dimension. The following methods solve them, in many
cases, completely or in part.

#heading(level: 3)[Application of Alexander–Pontryagin
  duality] <supp:alexander-duality>
#index-mark([@supp:alexander-duality], group: [General position])[Simplexes and
  chains]
We recall some facts from algebraic topology (see #bib-ref("Martinelli1953") and
#bib-ref("Aleksandrov1947")).#footnote[
  The idea of applying Alexander–Pontryagin duality is due to Martinelli, who
  used it to generalize the Cauchy integral formula to holomorphic functions of
  $n$ complex variables and to $(n+l)$-fold integrals, $0<=l<=n-1$ #bib-ref(
    "Martinelli1953",
  ). On the initiative of V. K. Ivanov, the author developed this idea for
  multiple residues in #bib-ref("Yuzhakov1962"), #bib-ref("Yuzhakov1964") and
  elsewhere.
] Let $X$ be an oriented real $N$-manifold. Suppose that the simplexes
$v_r=(Delta_r,phi)$ and $u_q=(Delta_q,psi)$, with $r+q=N$, meet transversely at
interior parameter points $t^(0)$ and $tau^(0)$ whose common image is $x^(0)$.
In positively oriented local coordinates, the _local intersection index_ is
#seq(
  $
    chi_(x^(0))(v_r,u_q)
    =op("sgn") det lr([D_t phi, D_tau psi]).
  $,
) <eq:intersection-sign>
#index-mark([@eq:intersection-sign], major: true)[Index, intersection of
  simplexes or chains]
Here $D_t phi$ and $D_tau psi$ are the matrices whose columns are respectively
$frac(partial phi, partial t_j)$ and $frac(partial psi, partial tau_j)$.

The columns are evaluated at the two parameter points. Transversality means that
this determinant is nonzero. Sum these signs over all transverse pairs of
preimages to obtain $chi(v_r, u_q)$; disjoint simplexes have index zero. After
putting chains in general position, extend the index bilinearly:
$
  chi(c_r, l_q)=sum_(i,j) n_i m_j chi(v_r^((i)), u_q^((j))),
$
where $c_r=sum_i n_i v_r^((i))$ and $l_q=sum_j m_j u_q^((j))$.

#metadata((kind: "index-anchor")) <idx:linking>
#index-mark([@idx:linking], major: true)[Coefficient, linking, of cycles]
#source(251, "239")
For disjoint cycles $sigma_(r-1) in B_(r-1)(X)$ and $gamma_q in B_q (X)$, where
$r+q=N$, define their _linking coefficient_ by
$
  frak(B)(sigma_(r-1),gamma_q)=chi(c_r, gamma_q)
  =(-1)^r chi(sigma_(r-1), l_(q+1)),
$
where $partial c_r=sigma_(r-1)$ and $partial l_(q+1)=gamma_q$. This integer is
independent of the bounding chains. It satisfies:

1) $frak(B)(sigma_(r-1),gamma_q)
=(-1)^(q(r-1)-1) frak(B)(gamma_q,sigma_(r-1))$;

2) $frak(B)(m_1 sigma_1+m_2 sigma_2,gamma)
=m_1 frak(B)(sigma_1,gamma)+m_2 frak(B)(sigma_2,gamma)$;

3) if $sigma approx 0$ in $X without abs(gamma)$, then $frak(B)(sigma,gamma)=0$.

For the duality statement we use _reduced homology_ $tilde(H)_k$: it agrees with
ordinary homology in positive degrees, while in degree zero its cycles have
total coefficient zero. As before, the weak group is obtained by factoring out
torsion.

#theorem(name: [Alexander–Pontryagin duality])[
  _Let $S^N$ be an oriented sphere of dimension $N>=1$ and $T$ a nonempty proper
  compact polyhedron in $S^N$.#footnote[
    Here $S^N$ admits a triangulation in which $T$ is a subcomplex consisting of
    finitely many simplexes.
  ] For $1<=r<=N$, $0<=q<=N-1$ and $r+q=N$, linking gives a perfect integer
  pairing between the reduced weak homology groups in degrees $r-1$ of $T$ and
  $q$ of $S^N without T$. These are finite free abelian groups of the same rank.
  For each basis $sigma_1,dots,sigma_p$ of the first group, there is a dual
  basis $gamma_1,dots,gamma_p$ of the second, satisfying_
  $
    frak(B)(sigma_j,gamma_i)=delta_(j i)
    =cases(1 & i=j, 0 & i!=j).
  $
] <th:alexander-pontryagin-duality>
#index-mark([@th:alexander-pontryagin-duality], major: true)[Dual homology
  bases, Alexander–Pontryagin]
#index-mark([@th:alexander-pontryagin-duality])[Singular set (surface)]

Apply this theorem to @eq:homology-periods with $X=D=CC^n without T$, where $T$
is the closed singular set of $omega$. The one-point compactification is
$S^(2n)=CC^n union \{infinity\}$; exteriors of balls give neighbourhoods of
infinity. Put $overline(T)=T union \{infinity\}$. If $overline(T)$ is a
polyhedron, apply the theorem to it and its complement
$S^(2n) without overline(T)=CC^n without T$. One may similarly replace $CC^n$ by
a domain homeomorphic to an open ball and use its one-point compactification.

For $q>0$, the Betti number in degree $q$ of $D$ is the rank of
$tilde(H)_(r-1)(overline(T))$, where $r+q=2n$. Instead of constructing a basis
$\{gamma_j\}$ of the weak homology of $D$ directly, construct a basis
$\{sigma_j\}$ of the reduced weak homology of $overline(T)$. In degree zero on
the complement side, the rank is the number of components minus one. For dual
bases the expansion coefficients are linking coefficients (in degree zero, the
cycle must have total coefficient zero):
$
  frak(B)(sigma_j,gamma)
  =sum_(i=1)^p k_i frak(B)(sigma_j,gamma_i)
  =sum_(i=1)^p k_i delta_(j i)=k_j.
$

#source(252, "240")
The basis integrals can also be found without explicitly constructing the dual
cycles. Choose $p$ homologically independent $q$-cycles $Gamma_1,dots,Gamma_p$
over which integration is simple. Then solve
$
  integral_(Gamma_j) omega=sum_(i=1)^p k_(j i) integral_(gamma_i) omega,
  quad j=1,dots,p,
$
where $k_(j i)=frak(B)(sigma_i,Gamma_j)$ and $det(k_(j i))!=0$. This condition
is independence over the rationals; the chosen cycles need not form an integral
basis to determine the periods from this system.

For $q=r=n$, take the holomorphic form $omega=f(z) dif z$, where
$dif z=dif z_1 ∧ dots ∧ dif z_n$. Proposition @prop:homology-periods[] and
Theorem @th:alexander-pontryagin-duality[] then give the following result.

#theorem(name: [on residues])[
  _Let $f$ be holomorphic on $D=CC^n without T$ and suppose that
  $overline(T)=T union \{infinity\}$ is a polyhedron in $S^(2n)$. Let
  $\{sigma_j\}_(j=1)^p$ be a basis of the reduced weak homology of $overline(T)$
  in degree $n-1$, and $\{gamma_j\}_(j=1)^p$ its dual basis in degree $n$ of
  $D$. Then every $gamma in Z_n (D)$ satisfies_
  $
    integral_gamma f(z) dif z=(2 pi i)^n sum_(j=1)^p k_j R_j,
  $
  _where_
  $
    k_j=frak(B)(sigma_j,gamma), quad
    R_j=frac(1, (2 pi i)^n) integral_(gamma_j) f(z) dif z.
  $
] <th:complementary-domain-periods>
#index-mark(
  [@th:complementary-domain-periods],
  group: [Residues],
)[Multidimensional (multiple)]
#index-mark([@th:complementary-domain-periods], group: [Theorems])[On residues]

By analogy with one variable, $R_j$ is called the _residue_ with respect to the
basis cycle $gamma_j$. This approach is especially effective for $n=2$, where
two-dimensional homology in $RR^4$ is related to one-dimensional homology of a
surface.

#example[
  Let $f(w,z)$ be entire on $CC^2$, let $m,n$ be relatively prime positive
  integers, and let $a,b$ be nonzero constants. If $T=\{(w,z):a w^m-b z^n=0\}$,
  then every $gamma in Z_2 (CC^2 without T)$ satisfies
  $
    integral_gamma frac(f(w,z), a w^m-b z^n) dif w ∧ dif z=0.
  $
  #source(253, "241")
  Indeed, a suitable parametrization $(w,z)=(alpha t^n,beta t^m)$ is a proper
  homeomorphism from $CC$ onto $T$. Hence $overline(T)$ is homeomorphic to
  $S^2$, whose first homology is zero. The weak homology group of
  $CC^2 without T$ in degree two is therefore zero, and Corollary
  @cor:null-homologous-periods[] of §@supp:forms-and-stokes applies. If exactly
  one of $a,b$ is zero, $T$ is a complex line and the same conclusion holds.
] <ex:plane-binomial-curve>

#example[
  Let $T=\{(w,z) in CC^2:w z=1\}$. Its one-point compactification is a sphere
  with the points $z=0$ and $z=infinity$ identified. Thus $H_1 (overline(T))$
  and $H_2 (CC^2 without T)$ both have rank one. A generator of the former is
  the loop
  $
    sigma=\{(w,z):w,z in RR, z>0,w z=1\} union \{infinity\},
  $
  oriented by increasing $z$ along its finite part. A dual generator is
  $
    gamma=\{(w,z):abs(w)=abs(z)=2\},
  $
  oriented by $(arg w,arg z)$. The three-chain $c=\{abs(w)<=2,abs(z)=2\}$, with
  its product orientation, has $partial c=gamma$. The loop $sigma$ meets $c$
  once, at $(1/2,2)$, with positive intersection index. Therefore
  $frak(B)(sigma,gamma)=chi(sigma, c)=1$.

  For an entire function $f$, the corresponding residue is
  $
    R & =frac(1, (2 pi i)^2) integral_gamma
        frac(f(w,z), w z-1) dif w ∧ dif z \
      & =sum_(k=0)^infinity frac(1, (2 pi i)^2)
        integral_gamma frac(f(w,z), (w z)^(k+1)) dif w ∧ dif z \
      & =sum_(k=0)^infinity frac(1, (k!)^2)
        frac(partial^(2k) f(0,0), partial w^k partial z^k).
  $
  The geometric expansion is uniformly convergent on $gamma$, since $abs(w z)=4$
  there; the last equality is the iterated Cauchy formula. Further examples
  appear in §@supp:local-residues. Residues of arbitrary rational functions of
  two variables are studied by this method in #bib-ref("Yuzhakov1962") and
  #bib-ref(
    "Yuzhakov1972",
  ).
] <ex:hyperbola-complement>
