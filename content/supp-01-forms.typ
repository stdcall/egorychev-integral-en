#import "index-style.typ": index-mark
#import "book-style.typ": keep-next, keep-together
#import "main-defs.typ": bib-ref, source
#import "supp-defs.typ": seq

#source(241, "229")
#heading(level: 1, numbering: none)[
  Supplement. Facts from the Theory of Multidimensional Residues
] <supp:supplement>
#metadata((kind: "supplement-anchor")) <supplement>
#align(center)[A. P. Yuzhakov]

#heading(level: 2, numbering: none)[Introduction] <supp:introduction>
#index-mark([@supp:introduction])[Singular set (surface)]
The many applications of residues of analytic functions of one complex variable
are well known. The theory rests on Cauchy's integral theorem, which permits
deformation of integration contours within the appropriate homology class, and
the residue formula, which expresses an integral around an isolated singularity
through a Laurent coefficient or, for a pole, through derivatives.

The theory of multidimensional residues, going back to Poincaré #bib-ref(
  "Poincare1887",
), is based on the general Stokes formula and its corollary, the Cauchy–Poincaré
integral theorem. In several complex variables, singularities occur on analytic
sets in $CC^n$ whose structure can be complicated. The resulting topological
difficulties require the methods of algebraic topology. Even integrals over
“elementary” cycles cannot always be evaluated completely in the presence of
poles. For example, Leray's residue formula #bib-ref("Leray1959") (see
§@supp:leray-residues below) generally only reduces the dimension of
integration. Leray developed a general theory of residues on a complex analytic
manifold; the work of Dolbeault, Martinelli and others also greatly extended the
subject, which remains far from complete. Multidimensional residues have found
important applications to Feynman integrals #bib-ref("Erdelyi1953") and to
combinatorial analysis, as illustrated in this book.

#source(242, "230")
Section @supp:forms-and-stokes presents auxiliary concepts and facts used in the
theory. Sections @supp:residue-theory and @supp:local-residues survey its main
concepts and results and give practical methods for computing residues in
special cases. Section @supp:logarithmic-residue develops the logarithmic
residue, and §@supp:implicit-and-inverse-maps applies it to generalizing
Lagrange expansions for implicit functions. A fuller account and bibliography
can be found in #bib-ref("Yuzhakov1975a").

#heading(level: 2)[Integration of differential forms. The Stokes
  formula] <supp:forms-and-stokes>
#heading(level: 3)[Differentiable and complex analytic
  manifolds] <supp:manifolds>
An _$n$-dimensional manifold_ is a connected Hausdorff topological space $X$
with a countable base, each point of which has a neighbourhood homeomorphic to
an open ball in $RR^n$. A pair $(U_a,phi)$, where $U_a$ is a neighbourhood of
$a in X$ and $phi:U_a->\{t in RR^n:abs(t)<1\}$ is a homeomorphism, is a _local
coordinate system_. The values $t=(t_1,dots,t_n)=phi(x)$ are the _local
coordinates_ of $x in U_a$.

Suppose that $X$ has a family $cal(F)=\{(U_alpha,phi_alpha)\}_(alpha in A)$ of
local coordinate systems such that:

1) $union_(alpha in A) U_alpha=X$;

2) whenever $U_alpha ∩ U_beta != emptyset$, the transition map
$phi_beta compose phi_alpha^(-1)$ on $phi_alpha (U_alpha ∩ U_beta)$ is $r$ times
continuously differentiable;

3) every local coordinate system compatible with all members of $cal(F)$ in the
sense of 2) also belongs to $cal(F)$.

#metadata((kind: "index-anchor")) <idx:manifold-differentiable>
#index-mark([@idx:manifold-differentiable], group: [Manifolds])[Differentiable]
#index-mark([@idx:manifold-differentiable], group: [Orientation])[Of a manifold]
The pair $(X,cal(F))$ is a _differentiable manifold of class $C^r$_,
$0<=r<=infinity$. Below we take $r=infinity$. Such a manifold is _orientable_ if
it admits an atlas whose transition maps have positive Jacobian determinants. An
orientation is a choice of such an atlas, up to compatibility by
positive-Jacobian transitions. For connected $X$ of positive dimension, an
orientable manifold has two opposite orientations.

#metadata((kind: "index-anchor")) <idx:manifold-complex>
#index-mark(
  [@idx:manifold-complex],
  group: [Manifolds],
  after: [Differentiable],
)[Complex analytic]
For a complex analytic manifold, use instead an atlas of complex coordinate
charts
$
  phi_alpha:U_alpha->\{zeta in CC^n:abs(zeta)<1\},
  quad abs(zeta)=lr((sum_(j=1)^n abs(zeta_j)^2))^(1/2),
$
with holomorphic transition maps, maximal among such complex charts. The
resulting space is an _$n$-dimensional complex analytic manifold_. It has an
underlying orientable real smooth manifold of dimension $2n$. In fact, the real
determinant of a holomorphic coordinate change is the squared absolute value of
its complex determinant and is positive.

Examples include domains in $CC^n$, connected nonsingular analytic submanifolds,
and Riemann domains associated with multivalued analytic functions of several
complex variables (see #bib-ref("Shabat1969"), #bib-ref("Aizenberg1975") and
#bib-ref("Yuzhakov1975a")). In particular, if $F_1,dots,F_k$ are holomorphic on
an open set in $CC^n$ and $op("rank")(frac(partial F_j, partial z_nu))_(j,nu)=k$
along their common zero set, then each connected component of this set is a
complex submanifold of dimension $n-k$.

#heading(level: 3)[Differential forms] <supp:differential-forms>
#index-mark([@supp:differential-forms], major: true)[Differential form]
#keep-next[
  Differential forms are objects integrated over multidimensional surfaces on a
  manifold; their definition is independent of local coordinates.
  #source(243, "231")
  A _differential form of degree $p$_, $p=0,1,dots$, is an alternating covariant
  tensor field of degree $p$ (see #bib-ref("Rashevskii1967")). In local
  coordinates $(x_1,dots,x_n)$ it has the unique expression
]
#seq(
  $
    omega(x)=sum_(1<=i_1<dots<i_p<=n) a_(i_1 dots i_p) (x)
    dif x_(i_1) ∧ dots ∧ dif x_(i_p).
  $,
) <eq:differential-form>
The coefficients are functions with the required differentiability, and the
$dif x_j$ are coordinate differentials. The exterior product satisfies #seq(
  $
    dif x_i ∧ dif x_j=-dif x_j ∧ dif x_i,
    quad dif x_i ∧ dif x_i=0.
  $,
) <eq:exterior-antisymmetry>

Write $I=(i_1<dots<i_p)$ and $dif x_I=dif x_(i_1) ∧ dots ∧ dif x_(i_p)$; define
$J$ and $dif y_J$ in the same way. Sums over $I$ or $J$ run through increasing
multi-indices as in @eq:differential-form. Under a coordinate change $x=x(y)$,
this expression becomes #seq(
  $
    omega & =sum_(j_1,dots,j_p=1)^n
            lr(
              (sum_I a_I (x(y)) product_(nu=1)^p
                (partial x_(i_nu))/(partial y_(j_nu)))
            )
            dif y_(j_1) ∧ dots ∧ dif y_(j_p) \
          & =sum_J lr(
              (sum_I a_I (x(y))
                (partial(x_(i_1), dots, x_(i_p)))/
                (partial(y_(j_1), dots, y_(j_p))))
            ) dif y_J.
  $,
) <eq:form-coordinate-change>
A form of degree zero is a real- or complex-valued function on $X$. A form is
_regular_ if its local coefficients are $C^infinity$ functions. Regular
$p$-forms form a vector space $Omega^p (X)$ under addition and scalar
multiplication; $Omega^p (X)=0$ for $p<0$ or $p>dim X$.

#metadata((kind: "index-anchor")) <idx:exterior-product>
#index-mark([@idx:exterior-product], major: true)[Exterior multiplication]
The _exterior product_
$
  ∧:Omega^p (X) times Omega^q (X)->Omega^(p+q)(X)
$
is obtained by multiplying the local expressions and using
@eq:exterior-antisymmetry. It satisfies
$
  omega ∧ (phi+psi)=omega ∧ phi+omega ∧ psi,
$
and
$
  omega ∧ phi=(-1)^(p q) phi ∧ omega,
$
where $p$ and $q$ are the degrees of $omega$ and $phi$.

#metadata((kind: "index-anchor")) <idx:exterior-derivative>
#index-mark([@idx:exterior-derivative], major: true)[Exterior derivative of a
  form]
The _exterior derivative_ $dif:Omega^p (X)->Omega^(p+1)(X)$
#source(244, "232")
is defined locally by #seq(
  $
    dif omega=sum_I dif a_I (x) ∧ dif x_(i_1) ∧ dots ∧ dif x_(i_p),
  $,
) <eq:exterior-derivative>
#keep-next[where]
$
  dif a_I=sum_(j=1)^n (partial a_I)/(partial x_j) dif x_j.
$
#keep-together[
  It has the properties

  1) $dif(omega_1+omega_2)=dif omega_1+dif omega_2$;

  2) $dif(omega ∧ phi)=dif omega ∧ phi+(-1)^p omega ∧ dif phi$, where $p$ is the
  degree of $omega$;

  3) $dif dif omega=0$.
]

#metadata((kind: "index-anchor")) <idx:form-closed>
#index-mark([@idx:form-closed], major: true)[Differential form, closed or exact]
#index-mark([@idx:form-closed], group: [Groups], after: [Homology])[Cohomology]
A form $omega$ is _closed_ if $dif omega=0$ and _exact_ if $omega=dif phi$ for
some form $phi$. Write $Z^p (X)$ for the closed $p$-forms and $B^p (X)$ for the
exact $p$-forms. By 1) and 3), $B^p (X) subset.eq Z^p (X) subset.eq Omega^p (X)$
are vector subspaces. The quotient $H^p (X)=Z^p (X) \/ B^p (X)$ is the _$p$th de
Rham cohomology group_ of $X$, and its elements are _cohomology classes_. Closed
forms $omega_1$ and $omega_2$ in the same class are _cohomologous_, written
$omega_1 approx omega_2$; then $omega_1-omega_2=dif phi$ for some
$phi in Omega^(p-1)(X)$.

#metadata((kind: "index-anchor")) <idx:mapping>
#index-mark([@idx:mapping], group: [Manifolds])[Mapping of manifolds]
A smooth mapping #seq($ f:X->Y $) <eq:manifold-map>
induces homomorphisms
$
  tilde(f):Omega^p (Y)->Omega^p (X), quad f^*:H^p (Y)->H^p (X).
$
To define them, choose local coordinates $x$ near $a in X$ and $y$ near
$b=f(a) in Y$, so that $y=y(x)$ is the coordinate expression of $f$. If
$
  omega=sum_I a_I (y) dif y_(i_1) ∧ dots ∧ dif y_(i_p),
$
then
$
  tilde(f)(omega)=sum_I a_I (y(x))
  dif y_(i_1)(x) ∧ dots ∧ dif y_(i_p)(x).
$
The coefficients and coordinate functions are smooth. The identity
$dif compose tilde(f)=tilde(f) compose dif$ implies that $tilde(f)$ sends closed
forms to closed forms and exact forms to exact forms, inducing $f^*$ on the
quotient.

#metadata((kind: "index-anchor")) <idx:form-holomorphic>
#index-mark([@idx:form-holomorphic], major: true)[Differential form,
  holomorphic]
On a complex analytic manifold we usually take complex coefficients and replace
the real coordinate differentials $dif x_j,dif y_j$ by
#source(245, "233")
$
  dif z_j=dif x_j+i dif y_j, quad dif overline(z)_j=dif x_j-i dif y_j,
  quad z_j=x_j+i y_j.
$
A form is _holomorphic_ if its expression contains only the $dif z_j$ and has
holomorphic coefficients in the complex coordinates.
