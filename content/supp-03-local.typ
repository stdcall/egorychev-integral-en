#import "main-defs.typ": bib-ref, source
#import "book-style.typ": keep-next
#import "supp-defs.typ": seq

#source(257, "245")
#heading(level: 2)[Local residues of certain meromorphic
  functions] <supp:local-residues>

We apply the preceding results to compute residues of meromorphic functions with
respect to cycles in a sufficiently small neighbourhood of the singular set.

#heading(level: 3)[The case $n=2$: application of Alexander–Pontryagin
  duality] <supp:plane-local-residues>

Following #bib-ref("Yuzhakov1972"), consider the integral #seq(
  $ integral_Gamma frac(f(w,z), g(w,z)) dif w ∧ dif z, $,
) <eq:plane-meromorphic-integral>
where $f$ and $g$ are holomorphic in a domain $D subset CC^2$, $g$ is not
identically zero, $T=\{(w,z) in D:g(w,z)=0\}$ and $Gamma in Z_2 (U without T)$.
Here $U$ is a sufficiently small neighbourhood of a point $(a,b) in T$.
Translate this point to $(0,0)$ and, if necessary, make a nonsingular linear
change of coordinates so that $g(w,0)$ is not identically zero. The Jacobian of
this change is absorbed in the numerator of @eq:plane-meromorphic-integral.

By the Weierstrass preparation theorem #bib-ref("Shabat1969"), in a small
neighbourhood we have $g=cal(P) Omega$, where
$
  cal(P)(w,z)=w^m+a_1 (z)w^(m-1)+dots+a_m (z)
$
is a Weierstrass polynomial, $a_j$ and $Omega$ are holomorphic,
#source(258, "246")
$a_j (0)=0$ and $Omega$ is nowhere zero after shrinking the neighbourhood.
Factor it into distinct irreducible Weierstrass polynomials:
$
  cal(P)=cal(P)_1^(r_1) dots cal(P)_k^(r_k).
$
For each factor there is a convergent parametrization $(w,z)=(W_j (t),t^(m_j))$,
where $m_j=deg_w cal(P)_j$ and $W_j (0)=0$. Thus #seq(
  $
    cal(P)_j (w,t^(m_j)) & =product_(nu=1)^(m_j) (w-W_j (epsilon_(m_j,nu)t)), \
        epsilon_(m_j,nu) & =e^(2 pi nu i/m_j),
                           quad W_j (t)=sum_(n>=1) b_(j n)t^n.
  $,
) <eq:puiseux-factorization>
In the original variable this gives a Puiseux branch
$w_j (z)=W_j (z^(1/m_j))=sum_(n>=1) b_(j n) z^(n/m_j)$. Its conjugates are
obtained by multiplying $z^(1/m_j)$ by the $m_j$th roots of unity. The series
can be found by a Newton diagram; see #bib-ref("Chebotarev1948"). For any
particular residue only a sufficiently long finite initial segment is needed.

Choose an adapted small polydisc $U$ so that each
$T_j=\{(w,z) in U:cal(P)_j (w,z)=0\}$ is a disc parametrized as above, and
distinct branches meet only at the origin. The union $T ∩ U$ consists of $k$
discs with their centres identified. Collapsing $partial U$ to a point $Q$
compactifies $U$ to $S^4$. The closure $overline(T)$ then consists of $k$
two-spheres with two common points, $0$ and $Q$.

Theorem @th:alexander-pontryagin-duality[] of §@supp:residue-theory gives dual
homology groups for $overline(T)$ and $U without T$. The first homology of
$overline(T)$ is free of rank $k-1$, so
$
  H_2 (U without T) ≅ H_1 (overline(T)) ≅ ZZ^(k-1).
$
This rank can also be computed by the Euler–Poincaré formula; see #bib-ref(
  "Fuks1969",
) and #bib-ref("Spanier1966"). In particular, the groups vanish when $k=1$.

To construct dual bases, let $t_j$ be an arc on $T_j$ directed from $0$ to $Q$.
For example, use the image of a radial parameter interval under
$t mapsto (W_j (t),t^(m_j))$, with its endpoint on $partial U$ identified with
$Q$. Put
$
  sigma_j=t_j-t_k in Z_1 (overline(T)), quad j=1,dots,k-1.
$
A corresponding tube is parametrized by
$
  gamma_j:
  quad t=epsilon^(1/m_j)e^(i phi/m_j),
  quad z=t^(m_j),
  quad w=W_j (t)+delta e^(i theta),
$
where $0<=phi<=2 pi m_j$ and $0<=theta<=2 pi$. Orient it by $(theta,phi)$. First
choose $epsilon>0$ small, and then choose $delta>0$ smaller than the separation
of the distinct roots above $abs(z)=epsilon$ and small enough to keep the tube
in $U$. It follows that $gamma_j in Z_2 (U without T)$ and
$
  frak(B)(sigma_j,gamma_s)=delta_(j s), quad j,s=1,dots,k-1.
$
Thus these cycles form dual bases under the linking pairing of
§@supp:alexander-duality.

A basis period is computed by successive one-variable residues. For $t!=0$
small, put
$
  A_j (t)=frac(1, (r_j-1)!)
  lr(
    [frac(partial^(r_j-1), partial w^(r_j-1))
      lr((frac(f(w,t^(m_j))(w-W_j (t))^(r_j), g(w,t^(m_j)))))]
  )
  |_(w=W_j (t)).
$
The apparent singularity at $w=W_j (t)$ is removed before differentiating. Then
$
  R_j & =frac(1, (2 pi i)^2)
        integral_(gamma_j) frac(f dif w ∧ dif z, g) \
      & =frac(1, (2 pi i)^2) integral_(abs(t)=epsilon^(1/m_j))
        m_j t^(m_j-1)
        lr(
          [integral_(abs(w-W_j (t))=delta)
            frac(f(w,t^(m_j)), g(w,t^(m_j))) dif w]
        ) dif t \
      & =op("res")_(t=0) lr([m_j t^(m_j-1) A_j (t) dif t]).
$
Equivalently, this is $m_j$ times the coefficient of $z^(-1)$ in the Puiseux
series $A_j (z^(1/m_j))$. The expression in the parameter $t$ uses an ordinary,
single-valued meromorphic one-form.

#source(259, "247")
#heading(level: 3)[The case $n>=2$ under additional
  assumptions] <supp:higher-local-residues>

Consider the integral #seq(
  $
    integral_Gamma frac(f(z), g(z)) dif z
    =integral_Gamma frac(f(z_1,dots,z_n), g(z_1,dots,z_n))
    dif z_1 ∧ dots ∧ dif z_n,
  $,
) <eq:multivariate-meromorphic-integral>
where $f$ and $g$ are holomorphic in $D subset CC^n$, $T=\{z in D:g(z)=0\}$ and
$Gamma in Z_n (U without T)$. The neighbourhood $U$ of a point $a in T$ is
sufficiently small; translate $a$ to $0$. Suppose that
$
  g=g_1^(r_1) dots g_k^(r_k), quad k>=n,
  quad r_j in ZZ_(>=1), quad g_j (0)=0,
$
#keep-next[and that]
$
  frac(partial(g_(j_1), dots, g_(j_n)), partial(z_1, dots, z_n))|_0 !=0
$
for every $n$-element subset $\{j_1,dots,j_n\} subset.eq \{1,dots,k\}$.

For any $n$ of the functions $g_1,dots,g_(k-1)$ there are holomorphic functions
$phi_1,dots,phi_n$, nowhere zero in a sufficiently small common neighbourhood,
such that
$
  g_k=sum_(nu=1)^n g_(j_nu) phi_nu.
$
Indeed, use the local coordinates $zeta_nu=g_(j_nu)(z)$ and regroup the
convergent power series of $g_k$. The linear coefficient of each $zeta_nu$ is
nonzero by the Jacobian assumption. It follows that #seq(
  $
    frac(1, g_(j_1) dots g_(j_n))
    =sum_(nu=1)^n frac(
      phi_nu,
      g_(j_1) dots [nu] dots g_(j_n) g_k
    ),
  $,
) <eq:denominator-decomposition>
where $[nu]$ means omission of that factor. Repeatedly applying such identities
gives a finite decomposition
$
  frac(1, g_1^(r_1) dots g_k^(r_k))
  =sum_(alpha,beta) frac(
    psi_(alpha,beta),
    g_(alpha_1)^(beta_1) dots g_(alpha_n)^(beta_n)
  ),
$
with holomorphic numerators, $1<=alpha_1<dots<alpha_n=k$,
$beta=(beta_1,dots,beta_n)$, $beta_j>=1$ and
$sum_(j=1)^n beta_j=sum_(j=1)^k r_j$. If $k=n$, the original fraction already
has this form. Incorporating $f$ into the numerators,
$Psi_(alpha,beta)=f psi_(alpha,beta)$, reduces
@eq:multivariate-meromorphic-integral to integrals #seq(
  $
    I_(alpha,beta)=integral_Gamma
    frac(
      Psi_(alpha,beta)(z) dif z,
      g_(alpha_1)^(beta_1)(z) dots g_(alpha_n)^(beta_n)(z)
    ).
  $,
) <eq:reduced-meromorphic-integral>

Fix $alpha$, use the local coordinates $w_j=g_(alpha_j)(z)$ and write
$g_alpha=(g_(alpha_1),dots,g_(alpha_n))$. In a sufficiently small coordinate
neighbourhood, the cycle
$
  gamma_alpha=\{z:abs(g_(alpha_1)(z))=dots=abs(g_(alpha_n)(z))=epsilon\},
$
#source(260, "248")
oriented by $(arg g_(alpha_1),dots,arg g_(alpha_n))$, and the form
$
  omega_alpha=frac(1, (2 pi i)^n)
  frac(
    dif g_(alpha_1) ∧ dots ∧ dif g_(alpha_n),
    g_(alpha_1) dots g_(alpha_n)
  )
$
give dual one-element bases for the local complement of these $n$ hypersurfaces,
as in Example @ex:coordinate-torus-cohomology[] of §@supp:residue-theory. Here
the complement is
$U_alpha=U without (T_(alpha_1) union dots union T_(alpha_n))$, where
$T_j=\{z in U:g_j (z)=0\}$. In this local homology group,
$Gamma tilde k_alpha gamma_alpha$, with $k_alpha=integral_Gamma omega_alpha$.
The comparison is made in $U_alpha$; the cycle $gamma_alpha$ need not avoid the
other $T_j$.

Put $J_alpha (z)=frac(partial(g_alpha), partial(z))$ and let $z=h_alpha (w)$ be
the local inverse of $w=g_alpha (z)$. Set
$
  B_(alpha,beta)(w)=frac(Psi_(alpha,beta)(h_alpha (w)), J_alpha (h_alpha (w))).
$
Then
$
  I_(alpha,beta) & =integral_Gamma
                   frac(
                     Psi_(alpha,beta) dif g_(alpha_1) ∧ dots ∧ dif g_(alpha_n),
                     J_alpha g_(alpha_1)^(beta_1) dots g_(alpha_n)^(beta_n)
                   ) \
                 & =frac((2 pi i)^n k_alpha, (beta_1-1)! dots (beta_n-1)!)
                   lr(
                     [frac(
                         partial^(beta_1+dots+beta_n-n) B_(alpha,beta),
                         partial w_1^(beta_1-1) dots partial w_n^(beta_n-1)
                       )]
                   )|_(w=0).
$

#heading(level: 3)[Linear singularities in general
  position] <supp:linear-singularities>

Consider @eq:multivariate-meromorphic-integral with $f$ entire, positive
integers $r_j$, $g=g_1^(r_1) dots g_k^(r_k)$ and
$
  g_j (z)=sum_(nu=1)^n a_(j nu)z_nu+b_j.
$
The affine hyperplanes $S_j=\{z in CC^n:g_j (z)=0\}$ are in general position,
including their projective closures together with the hyperplane at
infinity.#footnote[See #bib-ref("Yuzhakov1964") for the arbitrary case.] Let
$Gamma in Z_n (CC^n without (S_1 union dots union S_k))$. Theorem
@th:froissart-decomposition[] of §@supp:residue-theory applies. Since
$H_n (CC^n)=0$ and $H_(n-p)(S_(j_1) ∩ dots ∩ S_(j_p))=0$ for $p<n$, it gives
$
  H_n (CC^n without (S_1 union dots union S_k))
  ≅ ⨁_(alpha in cal(A)) delta^n H_0 (S_(alpha_1) ∩ dots ∩ S_(alpha_n)).
$
Here $cal(A)$ consists of the increasing tuples $1<=alpha_1<dots<alpha_n<=k$ for
which the indicated intersection is nonempty. Each such intersection is a single
point $a_alpha$. The small tori
$
  gamma_alpha=delta^n a_alpha
  =\{z:abs(g_(alpha_1)(z))=dots=abs(g_(alpha_n)(z))=epsilon\},
  quad alpha in cal(A),
$
with orientation $(arg g_(alpha_1),dots,arg g_(alpha_n))$, form a basis for the
$n$-dimensional homology of the complement. Choose $epsilon$ small enough to
avoid all the other hyperplanes. The forms
$
  omega_alpha=frac(1, (2 pi i)^n)
  frac(
    dif g_(alpha_1) ∧ dots ∧ dif g_(alpha_n),
    g_(alpha_1) dots g_(alpha_n)
  ),
  quad alpha in cal(A),
$
#source(261, "249")
form the dual cohomology basis. Indeed, the period on $gamma_alpha$ is one; on
any other basis torus, the integrand extends holomorphically across one of the
coordinate discs, so Cauchy’s theorem gives zero.

The residue of $omega=(f/g) dif z$ on $gamma_alpha$ is
$
  R_alpha & =frac(1, (2 pi i)^n) integral_(gamma_alpha) omega \
          & =frac(1, Delta_alpha product_(j=1)^n (r_(alpha_j)-1)!)
            lr(
              [frac(
                  partial^(sum_(j=1)^n r_(alpha_j)-n),
                  partial w_1^(r_(alpha_1)-1) dots partial w_n^(r_(alpha_n)-1)
                )
                F_alpha (h_alpha (w))]
            )|_(w=0),
$
where
$
  Delta_alpha=frac(
    partial(g_(alpha_1), dots, g_(alpha_n)),
    partial(z_1, dots, z_n)
  )
  =det(lr([a_(alpha_j,nu)]_(j,nu=1)^n)),
$
$h_alpha$ is the affine inverse of $w=g_alpha (z)$, with $h_alpha (0)=a_alpha$,
and
$
  F_alpha (z)=frac(f(z), product_(j ∉ \{alpha_1,dots,alpha_n\}) g_j (z)^(r_j))
$
is holomorphic near $a_alpha$.
