#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, source
#import "statements.typ": corollary, proof, theorem
#import "book-style.typ": keep-next

#source(187, "175")
The following construction is directly connected with the splitting lemma. It
frequently arises when multidimensional combinatorial sums are computed by
integral representations, and gives a further generalization of MacMahon's
master theorem (see @sec:main-residue-theorem).

#theorem[
  Suppose that $r=n$, the functions $psi,phi,f,phi_j,f_j$, $j=1,dots,n$, are
  holomorphic in a domain $D subset CC^n$ and satisfy
  @eq:splitting-power-factorization, with positive integers $m_j$. The common
  zeros of $phi_1,dots,phi_n$ in $D$ form a finite set $cal(E)$, and each is
  simple (#bib-ref("Milnor1968"), Appendix B). Thus the Jacobian
  $
    J_(phi)(z)=det lr((frac(partial phi_j, partial z_ell)))_(j,ell=1)^n
  $
  is nonzero at those points; it is the Jacobian of the vector
  $(phi_1,dots,phi_n)$, not of their product. Let $G$ be one or several
  connected components of
  $
    {z in D: abs(phi_(j)(z))<epsilon_j, quad j=1,dots,n},
  $
  with $overline(G)$ compact in $D$. Choose regular boundary levels, and orient
  the skeleton
  $
    Gamma_n={z in overline(G): abs(phi_(j)(z))=epsilon_j, quad j=1,dots,n}
  $
  by $dif arg phi_1 and dots and dif arg phi_n>0$.
  #keep-next[For $k=0,1,2,dots$,]
  #eq(
    $
      S(k) & =1/(2 pi i)^n integral_(Gamma_n)
             psi(z)f^(k)(z)phi^(-k-1)(z)dif z \
           & =1/(2 pi i)^(2n) integral_(Gamma_n times gamma_2)psi(z)
             lr(
               (product_(j=1)^n
                 frac(t_j^(-k-1), phi_(j)^(m_j)(z)-t_j f_(j)^(m_j)(z)))
             )
             dif z and dif t,
    $,
  ) <eq:splitting-sum-integral>
  #eq(
    $
      S(k) & =1/(2 pi i)^(2n) integral_(Gamma_n times gamma_2)psi(z) \
           & times lr(
               (product_(j=1)^n
                 frac(
                   phi_(j)^(k-m_j)(z)t_j^(-m_j-1),
                   phi_(j)^(k)(z)-t_j f_(j)^(k)(z)
                 ))
             )dif z and dif t.
    $,
  ) <eq:splitting-exchanged-integral>
  Here $gamma_2={t: abs(t_j)=eta_j, quad j=1,dots,n}$ has positive product
  orientation. Choose $0<eta_j<1$ sufficiently small to satisfy
  @eq:splitting-contour-bounds. For each of the residue formulas below, decrease
  these radii further so that all the indicated common zeros in $G$ are simple
  and the contour deformations in the proof are admissible. The choices may
  depend on $k$ and the $m_j$.


  Write
  $
    J_(w)(z,t)=det lr((frac(partial w_j, partial z_ell)))_(j,ell=1)^n.
  $
  In particular:

  #keep-next[
    a) If $m_1=dots=m_n=1$, then (#bib-ref("Good1961a"), #bib-ref(
      "Egorychev1972b",
    ))
  ]
  #eq(
    $
      S(k)=1/(2 pi i)^n integral_(gamma_2)
      lr((sum_(z in A(t)) frac(psi(z), J_(w)(z,t))))
      lr((product_(j=1)^n t_j^(-k-1)))dif t,
    $,
  ) <eq:splitting-simple-root-sum>
  where $A(t)$ is the set of common zeros in $G$ of #eq(
    $w_j=phi_(j)(z)-t_j f_(j)(z), quad j=1,dots,n.$,
  ) <eq:splitting-simple-root-system>
  No condition $f_(j)(z_0)!=0$ at the original common zeros is needed in this
  case.

  #keep-next[
    b) If $f_(j)(z_0)!=0$ for all $j$ and every $z_0 in cal(E) ∩ G$, then
    (#bib-ref("Egorychev1974d"))
  ]
  #eq(
    $
      S(k)=1/(2 pi i)^n integral_(gamma_2)
      lr((sum_(z in B(t)) frac(psi(z), J_(w)(z,t))))
      lr((product_(j=1)^n t_j^(-k-1)))dif t,
    $,
  ) <eq:splitting-powered-root-sum>
  #source(188, "176")
  where $B(t)$ is the set of common zeros in $G$ of #eq(
    $w_j=phi_(j)^(m_j)(z)-t_j f_(j)^(m_j)(z), quad j=1,dots,n.$,
  ) <eq:splitting-powered-root-system>

  c) Suppose that $g(z)=psi(z)product_(j=1)^n phi_(j)^(k-m_j)(z)$ extends
  holomorphically to $D$. For $k>=2$, also assume $f_(j)(z_0)!=0$ for every $j$
  and $z_0 in cal(E) ∩ G$; this condition is unnecessary when $k=1$. Then #eq(
    $
      S(k)=1/(2 pi i)^n integral_(gamma_2)
      lr((sum_(z in C(t)) frac(g(z), J_(w)(z,t))))
      lr((product_(j=1)^n t_j^(-m_j-1)))dif t,
    $,
  ) <eq:splitting-exchanged-root-sum>
  where $C(t)$ is the set of common zeros in $G$ of #eq(
    $w_j=phi_(j)^(k)(z)-t_j f_(j)^(k)(z), quad j=1,dots,n.$,
  ) <eq:splitting-exchanged-root-system>
  For $k=0$, $g=psi/phi$ is holomorphic, $C(t)$ is empty, and both sides of
  @eq:splitting-exchanged-root-sum are zero.
] <th:splitting-sum-integral>
#index-mark([@th:splitting-sum-integral], group: [Theorems])[Main theorem,
  generalization]

#corollary(name: [MacMahon's master theorem])[
  Take $k=1$, $phi_(j)(z)=z_j$, and, for positive integers $m_j$, put
  $
    psi(z)=product_(j=1)^n z_j^(m_j-1), quad
    f_(j)(z)=sum_(i=1)^n a_(i j)z_i.
  $
  Then $g=1$. Let $A=(a_(i j))$ and $T=op("diag")(t_1, dots, t_n)$. The system
  @eq:splitting-exchanged-root-system is $w=(I-T A^T)z$ and has just the simple
  zero $z=0$ for sufficiently small $t$, since its determinant is $1$ at $t=0$.
  Consequently, @eq:splitting-exchanged-root-sum gives
  $
    [z_1^(m_1) dots z_n^(m_n)]product_(j=1)^n
    lr((sum_(i=1)^n a_(i j)z_i))^(m_j)
    =[t_1^(m_1) dots t_n^(m_n)]frac(1, det(I-A T)).
  $
  Here brackets denote coefficient extraction, and $det(I-T A^T)=det(I-A T)$.
  Coefficients with some $m_j=0$ follow by omitting those indices, or
  equivalently by setting the corresponding $t_j$ equal to zero. This is
  MacMahon's master theorem of @sec:main-residue-theorem, with the linear forms
  written using the columns of $A$.
]

#proof[
  Formulas @eq:splitting-sum-integral and @eq:splitting-exchanged-integral
  follow from the splitting lemma. We first justify the choice of smaller
  auxiliary radii needed for the residue evaluations.

  Choose disjoint neighborhoods of the common zeros in $G$. Compactness of
  $overline(G)$ shows that, for sufficiently small $t$, all zeros of the
  perturbed systems remain in these neighborhoods: otherwise a sequence of zeros
  with $t arrow.r 0$ would converge to a common zero of the $phi_j$ outside
  them. In case a), the holomorphic implicit function theorem gives one simple
  zero near each original zero.

  In case b), use the local coordinates $u_j=phi_j/f_j$ near each original zero.
  Their Jacobian is nonzero there. The equations become $u_j^(m_j)=t_j$, and,
  since every $t_j!=0$ on $gamma_2$, they have $product_(j=1)^n m_j$ distinct
  simple solutions in each such neighborhood.
  #keep-next[More explicitly, at a solution,]
  $
    J_w=lr((product_(j=1)^n m_j f_j^(m_j)u_j^(m_j-1)))
    det lr((frac(partial u_j, partial z_ell)))_(j,ell=1)^n != 0.
  $
  The same argument applies to c) for $k>=2$, replacing each $m_j$ by $k$; when
  $k=1$, use the argument for a).

  To justify the contour reduction, first choose small positive levels
  $delta_j<epsilon_j$ for which the polyhedron
  $G_delta={z in G: abs(phi_(j)(z))<delta_j, quad j=1,dots,n}$ is contained in
  the chosen neighborhoods. Decrease the $eta_j$ so that, on $overline(G)$,
  $
    abs(t_j f_(j)^(p_j)(z))<delta_j^(p_j)
  $
  for the powers in use: $p_j=1$ in a), $p_j=m_j$ in b), and $p_j=k$ in c). Then
  the corresponding $w_j$ does not vanish on any intervening face
  $delta_j<=abs(phi_j)<=epsilon_j$. The Cauchy–Poincaré theorem permits
  shrinking the levels one at a time; the multidimensional residue theorem on
  the resulting local polyhedra gives the sum over their common zeros (see also
  the Supplement,
]

§@supp:logarithmic-residue, @th:torus-perturbed-map). In case c), this reads
#eq(
  $
    1/(2 pi i)^n integral_(Gamma_n)
    frac(
      g(z), product_(j=1)^n
      (phi_(j)^(k)(z)-t_j f_(j)^(k)(z))
    )dif z
    =sum_(z in C(t)) frac(g(z), J_(w)(z,t)).
  $,
) <eq:splitting-global-residue>
Indeed, near each simple zero the $w_j$ are valid local coordinates, and the
form becomes
$
  frac(g(z), product_(j=1)^n w_(j)(z,t))dif z
  =frac(g(z(w)), J_(w)(z(w),t))
  frac(dif w_1 and dots and dif w_n, w_1 dots w_n).
$
Its normalized local integral is $frac(g(z), J_(w)(z,t))$ at the zero. This
coordinate expression is needed only in those neighborhoods. The original form
is holomorphic away from the union of the hypersurfaces $w_j=0$; zeros of $J_w$
elsewhere introduce no additional singularities of that form. Integrating
@eq:splitting-global-residue in $t$ with the weights of
@eq:splitting-exchanged-integral proves @eq:splitting-exchanged-root-sum. The
same argument, with numerator $psi$, proves @eq:splitting-simple-root-sum and
@eq:splitting-powered-root-sum. For $k=0$ in c), shrinking to small local cycles
gives zero because $g$ is holomorphic, agreeing with the empty residue sum.
