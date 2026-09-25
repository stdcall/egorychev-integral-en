#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "supp-statements.typ": corollary, proposition, remark, theorem
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(245, "233")
#heading(level: 3)[Singular chains. Homology] <supp:chains-and-homology>
#index-mark([@supp:chains-and-homology], group: [Orientation])[Of a simplex,
  chain or cycle]
#index-mark([@supp:chains-and-homology], major: true)[Parametrization of a
  simplex, chain or cycle]
#index-mark([@supp:chains-and-homology], major: true)[Simplex (singular)]
To integrate differential forms over multidimensional oriented surfaces, it is
convenient to use parametrizations, with orientation determined by the order of
the parameters. Algebraic topology describes such surfaces by chains of singular
simplexes or cubes. We use smooth singular simplexes on the standard simplex
$
  Delta_p=\{t in RR^p:t_j>=0, sum_(j=1)^p t_j<=1\},
$
with ordered vertices $(0,e_1,dots,e_p)$. A _smooth singular $p$-simplex_ in $X$
is a pair $sigma_p=(Delta_p,g)$, where $g:Delta_p->X$ extends smoothly to a
neighbourhood of $Delta_p$. The order $(t_1,dots,t_p)$ gives its orientation. A
change of parameters preserves this orientation when its Jacobian is positive,
and reverses it when the Jacobian is negative. Orientation-preserving
reparametrizations give the same integrals; the parametrized maps themselves are
the generators used in the chain group.

#metadata((kind: "index-anchor")) <idx:chain>
#index-mark([@idx:chain], major: true)[Chain (singular)]
A _singular chain_, or simply a _chain_, is a finite formal linear combination
#seq($ c_p=sum_i m_i sigma_p^((i)), quad m_i in ZZ. $) <eq:singular-chain>
Chains are added and multiplied by integers termwise, forming the free abelian
group $C_p (X)$. The symbol $-sigma_p$ denotes the negative generator, with the
opposite integration orientation. The _support_ of $sigma_p$ is
$abs(sigma_p)=g(Delta_p)$. The support of a chain is the union of the supports
of the simplexes with nonzero coefficients, after equal generators have been
collected.

#metadata((kind: "index-anchor")) <idx:boundary>
#index-mark([@idx:boundary], major: true)[Boundary of a simplex or chain]
For $p>=1$, let $delta_i:Delta_(p-1)->Delta_p$, $0<=i<=p$, be the affine
inclusion of the face obtained by deleting vertex $i$, with the remaining
vertices in their original order. The boundary is
$
  partial sigma_p=sum_(i=0)^p (-1)^i (Delta_(p-1),g compose delta_i),
  quad partial c_p=sum_i m_i partial sigma_p^((i)).
$
Equivalently, it is the sum of all $p+1$ faces with their coherent boundary
orientations. Locally, if oriented coordinates are chosen so that a face is
$t_1=0$ and the simplex lies in $t_1<=0$, then $(t_2,dots,t_p)$ determines that
face orientation. Thus the outward normal comes first. We set
$partial:C_0 (X)->0$ equal to zero.

#metadata((kind: "index-anchor")) <idx:cycle>
#index-mark([@idx:cycle], major: true)[Cycle]
#source(246, "234")
Every face of codimension two occurs twice in the iterated boundary, with
opposite signs. Consequently, #seq(
  $ partial partial c_p=0. $,
) <eq:boundary-squared>
A chain $gamma in C_p (X)$ is a _cycle_ if $partial gamma=0$.

#metadata((kind: "index-anchor")) <idx:homology>
#index-mark([@idx:homology], major: true)[Cycle, homologous to zero]
#index-mark([@idx:homology], group: [Groups])[Homology]
#keep-next[Set]
$
  Z_p (X)=\{gamma in C_p (X):partial gamma=0\},
  quad B_p (X)=\{partial c:c in C_(p+1)(X)\}.
$
By @eq:boundary-squared, $B_p (X) subset.eq Z_p (X)$, and the quotient
$
  H_p (X)=Z_p (X) \/ B_p (X)
$
is the _$p$-dimensional homology group_ of $X$. Cycles representing the same
class are _homologous_, written $gamma_1 tilde.op gamma_2$. In particular,
$gamma tilde.op 0$ means that $gamma$ is a boundary.

#metadata((kind: "index-anchor")) <idx:homology-basis>
#index-mark([@idx:homology-basis], major: true)[Basis, homology]
#index-mark([@idx:homology-basis], group: [Numbers])[Betti]
A cycle is _weakly homologous to zero_, written $gamma approx 0$, if
$k gamma tilde.op 0$ for some nonzero integer $k$. The quotient of $Z_p (X)$ by
these cycles is the _weak homology group_, namely
$H_p (X) \/ op("Tor") H_p (X)$, where $op("Tor")H_p (X)$ is the torsion
subgroup. When $H_p (X)$ has no torsion, weak and ordinary homology coincide. If
$H_p (X)$ is finitely generated, its rank is the _$p$-dimensional Betti number_.
Whenever the weak homology group is free abelian, cycles $\{gamma_j\}$
representing a basis form a _homology basis_: every cycle has a unique
representation
$
  gamma approx sum_j m_j gamma_j, quad m_j in ZZ,
$
with only finitely many nonzero coefficients. In the finitely generated case,
the number of basis elements is the Betti number.

A smooth map @eq:manifold-map induces a homomorphism $tilde(f):C_p (X)->C_p (Y)$
by
$
  tilde(f)(Delta_p,g)=(Delta_p,f compose g).
$
Since $partial compose tilde(f)=tilde(f) compose partial$, it also induces
$f_*:H_p (X)->H_p (Y)$. Other equivalent definitions of homology for manifolds,
and methods for computing these groups, can be found in #bib-ref("Spanier1966"),
#bib-ref("Teleman1964") and #bib-ref("Fuks1969").

#heading(level: 3)[Integration of differential forms over
  chains] <supp:integration-over-chains>
#index-mark([@supp:integration-over-chains])[Integral of a form over a chain]
#index-mark([@supp:integration-over-chains], major: true)[Parametrization of a
  simplex, chain or cycle]
The _integral_ of $omega in Omega^p (X)$ over an oriented singular simplex
$sigma_p=(Delta_p,g)$ is #seq(
  $
    integral_(sigma_p) omega=integral_(Delta_p) tilde(g)(omega)
    =integral_(abs(Delta_p)) A(t) dif t_1 dots dif t_p,
  $,
) <eq:simplex-integral>
where $tilde(g)(omega)=A(t) dif t_1 ∧ dots ∧ dif t_p$. If the image lies in one
coordinate chart and $omega$ is given by @eq:differential-form, then
$
  A(t)=sum_(1<=i_1<dots<i_p<=n) a_(i_1 dots i_p) (x(t))
  frac(partial(x_(i_1), dots, x_(i_p)), partial(t_1, dots, t_p)).
$
Otherwise, the pullback is computed locally on $Delta_p$ and the expressions
agree on overlaps.
#source(247, "235")
The last integral in @eq:simplex-integral is an ordinary $p$-fold integral in
$RR^p$. For $p=0$ it means evaluation at the point. Extend integration to chains
by #seq(
  $ integral_(c_p) omega=sum_i m_i integral_(sigma_p^((i))) omega. $,
) <eq:chain-integral>

#remark[
  A surface of integration is often parametrized globally, without explicitly
  partitioning it into simplexes. Its integral is then computed by a formula
  like @eq:simplex-integral, and @eq:chain-integral follows from additivity of
  the ordinary multiple integral.
] <remark:global-parametrization>

#theorem(name: [change of variables])[
  _If $f:X->Y$ is smooth, $gamma in C_p (X)$ and $omega in Omega^p (Y)$, then_
  #seq(
    $ integral_gamma tilde(f)(omega)=integral_(tilde(f)(gamma)) omega. $,
  ) <eq:pullback-integral>
] <th:pullback-integral>
#index-mark([@th:pullback-integral], group: [Formulas])[Change of variables]

By @eq:chain-integral, it suffices to consider $gamma=sigma_p=(Delta_p,g)$. The
composition rule for pullbacks gives
$
  integral_(sigma_p) tilde(f)(omega)
  & =integral_(Delta_p) tilde(g)(tilde(f)(omega)) \
  & =integral_(Delta_p) tilde(f compose g)(omega)
  =integral_(tilde(f)(sigma_p)) omega.
$

#corollary[
  _If $f:X->Y$ is a diffeomorphism, $gamma in C_p (X)$ and
  $omega in Omega^p (X)$, then_
  $
    integral_gamma omega=integral_(tilde(f)(gamma)) tilde(f^(-1))(omega).
  $
] <cor:diffeomorphism-integral>

#remark[
  @th:pullback-integral permits a change of variables even when $f$ is not a
  diffeomorphism, provided the chain is given as $tilde(f)(gamma')$ or the form
  as $tilde(f)(omega')$.
] <remark:noninvertible-change-of-variables>

#heading(level: 3)[The general Stokes formula. Integration by
  parts] <supp:stokes-formula>
#theorem[
  _If $p>=1$, $omega in Omega^(p-1)(X)$ and $gamma in C_p (X)$, then the Stokes
  formula holds:_
  #seq(
    $ integral_(partial gamma) omega=integral_gamma dif omega. $,
  ) <eq:stokes-formula>
] <th:stokes-formula>
#index-mark([@th:stokes-formula], group: [Formulas])[Stokes]

#corollary[
  _The integral of an exact form over a cycle is zero: if $gamma in Z_p (X)$ and
  $omega in B^p (X)$, then $integral_gamma omega=0$._
] <cor:exact-form-periods>

#source(248, "236")
For $p>=1$, write $omega=dif phi$ for some $phi in Omega^(p-1)(X)$ and
$partial gamma=0$, so the Stokes formula gives
$
  integral_gamma omega=integral_gamma dif phi
  =integral_(partial gamma) phi=0.
$
For $p=0$, the assertion follows directly from $B^0 (X)=0$.

#corollary[
  _The integral of a closed form over a cycle weakly homologous to zero is
  zero._
] <cor:null-homologous-periods>

Indeed, if $dif omega=0$ and $k gamma=partial c$ with $k!=0$, then
$
  integral_gamma omega=frac(1, k) integral_(k gamma) omega
  =frac(1, k) integral_(partial c) omega
  =frac(1, k) integral_c dif omega=0.
$

#corollary[
  _If $gamma approx gamma_1$ are cycles and $omega$, $omega_1$ are closed forms
  with $omega=omega_1+dif phi$, then_
  $ integral_gamma omega=integral_(gamma_1) omega_1. $
] <cor:homology-cohomology-pairing>

Thus integration of a closed form over a cycle depends only on its cohomology
class $\{omega\} in H^p (X)$ and on the homology class $\{gamma\} in H_p (X)$,
or its image in the weak homology group. We may therefore write
$ integral_(\{gamma\}) \{omega\}=integral_gamma omega. $

The Stokes formula also gives the following consequence.

#corollary[
  _If $omega$ is a holomorphic $n$-form on a complex analytic manifold $X$ of
  complex dimension $n$, and $sigma$ is an $(n+1)$-chain in $X$, then
  $integral_(partial sigma) omega=0$._
] <cor:holomorphic-boundary-integral>

It suffices to show that $omega$ is closed. In local complex coordinates,
$
  omega=f(z) dif z=f(z_1,dots,z_n) dif z_1 ∧ dots ∧ dif z_n,
$
where $f$ is holomorphic, so $frac(partial f, partial overline(z)_j)=0$ for
every $j$ (see #bib-ref("Shabat1969") and #bib-ref("Aizenberg1975")). Hence
$
  dif omega=dif f ∧ dif z_1 ∧ dots ∧ dif z_n
  =sum_(j=1)^n frac(partial f, partial z_j)
  dif z_j ∧ dif z_1 ∧ dots ∧ dif z_n=0,
$
because each summand contains $dif z_j$ twice. For $X=D subset CC^n$ this
becomes the following theorem.

#theorem(name: [Cauchy–Poincaré])[
  _If $f(z_1,dots,z_n)$ is holomorphic in a domain $D subset CC^n$, then every
  $(n+1)$-chain $sigma$ in $D$ satisfies_
  $
    integral_(partial sigma) f(z) dif z
    =integral_(partial sigma) f(z_1,dots,z_n) dif z_1 ∧ dots ∧ dif z_n=0.
  $
] <th:cauchy-poincare>
#index-mark([@th:cauchy-poincare], group: [Theorems])[Cauchy–Poincaré]

#source(249, "237")
The following integration-by-parts formulas follow from the Stokes formula and
the product rule for the exterior derivative.

#proposition[
  _If $phi in Omega^p (X)$, $psi in Omega^q (X)$ and $gamma in C_(p+q+1)(X)$,
  then_
  $
    integral_gamma dif phi ∧ psi=integral_(partial gamma) phi ∧ psi
    -(-1)^p integral_gamma phi ∧ dif psi.
  $
  _If $gamma$ is a cycle, then_
  $
    integral_gamma dif phi ∧ psi=(-1)^(p+1) integral_gamma phi ∧ dif psi.
  $
] <prop:form-integration-by-parts>
#index-mark([@prop:form-integration-by-parts], group: [Formulas])[Integration by
  parts]

#proposition[
  _If $f$ and $phi$ are holomorphic in a domain $D subset CC^n$ and
  $gamma in Z_n (D)$, then, for $1<=j<=n$,_
  #seq(
    $
      integral_gamma frac(partial f, partial z_j) phi dif z
      =-integral_gamma f frac(partial phi, partial z_j) dif z.
    $,
  ) <eq:integration-by-parts>
  _More generally, let $m=(m_1,dots,m_n)$ be a nonnegative integer multi-index
  and put $abs(m)=m_1+dots+m_n$. Then_
  #seq(
    $
      integral_gamma frac(
        partial^(abs(m)) f,
        partial z_1^(m_1) dots partial z_n^(m_n)
      ) phi dif z
      =(-1)^(abs(m)) integral_gamma f frac(
        partial^(abs(m)) phi,
        partial z_1^(m_1) dots partial z_n^(m_n)
      ) dif z.
    $,
  ) <eq:repeated-integration-by-parts>
] <prop:integration-by-parts>

To obtain @eq:integration-by-parts, put
$
  eta_j=(-1)^(j-1) dif z_1 ∧ dots ∧ dif z_(j-1)
  ∧ dif z_(j+1) ∧ dots ∧ dif z_n,
$
where $dif z_j$ is omitted. Then
$
  dif(f phi eta_j)=lr(
    (frac(partial f, partial z_j) phi
      +f frac(partial phi, partial z_j))
  ) dif z.
$
Its integral over the cycle $gamma$ is zero by the Stokes formula. Repeated
application of @eq:integration-by-parts gives @eq:repeated-integration-by-parts.
