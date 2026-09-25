#import "statements.typ": remark
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(212, "200")
#remark[
  The kernels for unbounded domains were first obtained by a formal limit from
  the corresponding bounded-domain formulas; see #bib-ref(
    "Egorychev1974c",
  ), Chapter 5, §1. To specify the scaling, write
  $S_a (z)=sum_(i=1)^s M_i (z)^(1/γ_i)$ and
  $S_b (z)=sum_(i=s+1)^m M_i (z)^(1/γ_i)$. Start with the bounded domains
  $
    S_a (z)^(1/(α_1 q))+S_b (z)^(1/α_2)<1, quad q in ZZ_(>0).
  $
  Keep the first $ν_s$ coordinates fixed and replace $z_j$ by
  $q^(-p_j γ_i α_2/2) z_j$ for $j in B_i$, $i>s$. The inequality becomes
  $
    S_a (z)^(1/α_1)<lr((1-frac(S_b (z)^(1/α_2), q)))^q,
    quad S_b (z)^(1/α_2)<q,
  $
  and tends to @eq:szego-general-domain. If $H_q$ is the original bounded-domain
  kernel, its kernel after this coordinate change is
  $
    q^(-η) H_q (x_1,dots,x_(ν_s),
      (q^(-p_j γ_i α_2) x_j)_(j in B_i, i>s)), \
    η=α_2 sum_(i=s+1)^m γ_i sum_(j in B_i, j<n) p_j.
  $
  The factor $q^(-η)$ comes from the radial measure on the first $n-1$
  coordinates. Coefficientwise, the limit follows from
  $
    q^(-N) frac((α_1 q Q_1+N)!, (α_1 q Q_1)! N!)
    arrow.r frac((α_1 Q_1)^N, N!), quad N=α_2 Q_2.
  $
  This gives @eq:szego-general-series and its integral and closed forms.

  We now prove @eq:szego-general-integral. For a new summation index
  $ℓ in NN^n$, put $T_i=sum_(j in B_i) p_j ℓ_j$ and $Q_1=sum_(i=1)^s γ_i T_i$,
  $Q_2=sum_(i=s+1)^m γ_i T_i$. Formula @eq:szego-general-series may be written
  as #eq(
    $
      h(x) & =D_x sum_(ℓ in NN^n)
             frac((α_1 Q_1)^(α_2 Q_2), (α_2 Q_2)!)
             binom(Q_1, γ_1 T_1, dots, γ_s T_s) \
           & quad times binom(Q_2, γ_(s+1) T_(s+1), dots, γ_m T_m)
             lr((product_(i=1)^m frac(T_i!, product_(j in B_i) (p_j ℓ_j)!)))
             x^ℓ.
    $,
  ) <eq:szego-multinomial-series>
  Here $0^0=1$. Terms missing any of $x_1,dots,x_(n-1)$ are annihilated by
  $D_x$; in every remaining term $ℓ_j=k_j+1$ for $j<n$ and $ℓ_n=k_n$.

  #source(213, "201")
  Represent the exponential coefficient by formula $M_3 (w)$, the two outer
  multinomial coefficients by $M_1 (v_1,dots,v_s)$ and $M_1 (v_(s+1),dots,v_m)$,
  and each block coefficient by $M_1 ((z_j)_(j in B_i))$. For fixed small $ρ$,
  choose $x$ so small that all geometric series on $Γ(ρ)$ converge absolutely
  and uniformly. Summing them under the integral sign gives
  @eq:szego-general-integral.

  #keep-next[
    To prove @eq:szego-root-sum, evaluate that integral first in $z$, then in
    $v$, and finally in $w$, using §@sec:main-residue-theorem. For brevity put
  ]
  $
    a_i=cases(
      v_i^(γ_i) & quad i<=s,
      v_i^(γ_i) w^(α_2 γ_i) & quad i>s
    ), quad
    b_i=cases(
      V_1^(γ_i) e^(α_1 w γ_i) & quad i<=s,
      V_2^(γ_i) & quad i>s
    ).
  $
  #keep-next[The denominators to be used as local coordinates are]
  #eq(
    $
      u_j=a_i^(p_j) z_j^(p_j)-x_j b_i^(p_j) Z_i^(p_j),
      quad j in B_i, quad i=1,dots,m.
    $,
  ) <eq:szego-first-substitution>
  For $v,w$ on their circles and sufficiently small $x$, the first term
  dominates the second on each face $abs(z_j)=ρ$ of the closed $z$-polydisc.
  Work first with generic nonzero $x$, so that the zeros used below are simple.
  The result extends to the remaining small $x$ by holomorphy.

  Write $J_z=det(frac(∂ u, ∂ z))$ and let $sum_t$ denote all $1<=t_j<=p_j$. The
  residue formula @eq:root-sum-evaluation gives #eq(
    $
      h(x)=D_x sum_t frac(1, (2π i)^(m+1))
      integral_(Γ_(ρ)^(2) times Γ_(ρ)^(3)) \
      lr(
        [
          frac(product_(i=1)^m product_(j in B_i) a_i^(p_j) z_j^(p_j-1), J_z)
        ]
      )_(z=z^((t))) frac(d v, v) ∧ frac(d w, w).
    $,
  ) <eq:szego-first-residue>
  #source(214, "202")
  These zeros can be written explicitly. Set
  $c_j=(b_i/a_i) δ(t_j,p_j)x_j^(1/p_j)$ for $j in B_i$. Then
  $
    Z_i=frac(1, 1-sum_(j in B_i)c_j), quad z_j=c_j Z_i.
  $
  At a zero, the $i$th block of the Jacobian matrix has entries
  $
    p_j a_i^(p_j) z_j^(p_j-1)
    lr((δ_(j r)-frac(z_j, Z_i))), quad j,r in B_i,
  $
  where $δ_(j r)$ is the Kronecker delta. Factoring out the row factors and
  using @eq:carlitz-determinant gives
  $
    det lr((δ_(j r)-frac(z_j, Z_i)))_(j,r in B_i)
    =1-sum_(j in B_i)frac(z_j, Z_i)=frac(1, Z_i).
  $
  #keep-next[Consequently, at every such zero,]
  $
    J_z=lr((product_(i=1)^m Z_i^(-1)))
    product_(i=1)^m product_(j in B_i) p_j a_i^(p_j) z_j^(p_j-1).
  $
  #keep-next[Substitution in @eq:szego-first-residue yields]
  #eq(
    $
      h(x)=frac(1, product_(j=1)^n p_j) D_x sum_t
      frac(1, (2π i)^(m+1))
      integral_(Γ_(ρ)^(2) times Γ_(ρ)^(3)) φ(x,v,w) d v ∧ d w,
    $,
  ) <eq:szego-reduced-integral>
  where, with the $F_i$ defined after @eq:szego-root-sum,
  $
    φ(x,v,w)=frac(1, w product_(i=1)^m v_i)
    product_(i=1)^m frac(a_i, a_i-b_i F_i (x)).
  $
  This is because $sum_(j in B_i)c_j=(b_i/a_i)F_i (x)$.

  We now use the same calculation in the $v$ variables, taking the denominators
  #eq(
    $
      y_i=cases(
        v_i^(γ_i)-V_1^(γ_i) e^(α_1 w γ_i) F_i (x) & quad i<=s,
        v_i^(γ_i) w^(α_2 γ_i)-V_2^(γ_i) F_i (x) & quad i>s.
      )
    $,
  ) <eq:szego-second-substitution>
  For sufficiently small $x$ the zeros lie inside the $v$-polydisc. There are
  two blocks, with sums $V_1$ and $V_2$, and the determinant calculation gives
  the factors $V_1^(-1)$ and $V_2^(-1)$. Let $sum_r$ denote all $1<=r_i<=γ_i$,
  and use $A(x),B(x)$ from @eq:szego-root-sum. The resulting one-variable
  integral is
  $
    h(x)=frac(1, product_(j=1)^n p_j product_(i=1)^m γ_i)
    D_x sum_t sum_r frac(1, 2π i)
    integral_(abs(w)=ρ)
    frac(w^(α_2-1), (1-A(x)e^(α_1 w))(w^(α_2)-B(x))) d w.
  $
  Shrink the neighbourhood of $x=0$ so that $abs(B(x))<ρ^(α_2)$ and
  $abs(A(x))e^(α_1 ρ)<1$ for every root choice. The second factor has all its
  zeros inside the circle; the first has none there.
  #source(215, "203")
  The substitution $τ=w^(α_2)-B(x)$ at each simple zero $w=δ(l,α_2)B(x)^(1/α_2)$
  supplies a factor $1/α_2$. Summing the residues gives @eq:szego-root-sum. When
  the zeros coalesce, the same identity holds by holomorphic continuation of the
  complete root sum.
]
