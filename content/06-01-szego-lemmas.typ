#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": lemma, proof
#import "book-style.typ": keep-next, keep-together

#source(206, "194")
#proof(title: [Proof of @th:szego-general-series])[
  By @th:szego-reproducing-representation, the coefficients in #eq(
    $h(x)=sum_(k in NN^n) a_k x^k$,
  ) <eq:szego-coefficient-series>
  are the reciprocals of the moments
  $
    a_k^(-1)=integral_(abs(∂ D)) abs(ζ)^(2k) d abs(ζ)^2[n].
  $
  We first compute these moments. Write $y_j=abs(ζ_j)^(2/p_j)$ and
  $M_i=sum_(j in B_i) y_j$. Solving the boundary equation successively for the
  radial upper limits gives #eq(
    $
      a_k^(-1)=integral_0^(d_1) dots integral_0^(d_(n-1))
      lr((product_(j=1)^(n-1) abs(ζ_j)^(2k_j))) f_n^(p_n k_n)
      d abs(ζ_1)^2 dots d abs(ζ_(n-1))^2,
    $,
  ) <eq:szego-moment-integral>
  where $d_j=f_j^(p_j)$ and each $f_j$ depends only on the preceding radial
  variables. Explicitly, #source(207, "195")put
  $
    L=lr((-frac(1, α_1) ln lr((sum_(r=1)^s M_r^(1/γ_r)))))^(α_2).
  $
  For $j in B_i$, the full list of upper limits is
  $
    f_j=cases(
      lr((1-sum_(r=1)^(i-1) M_r^(1/γ_r)))^(γ_i)
      -sum_(r=ν_(i-1)+1)^(j-1) y_r & quad 1<=i<=s,
      lr((L-sum_(r=s+1)^(i-1) M_r^(1/γ_r)))^(γ_i)
      -sum_(r=ν_(i-1)+1)^(j-1) y_r & quad s+1<=i<=m.
    )
  $
  Empty sums are zero, so $f_1=1$. Logarithmic endpoint singularities are
  understood as limits from the interior. In @eq:szego-moment-integral make the
  triangular substitution
  $
    abs(ζ_j)^2=f_j^(p_j)(1-u_j)^(p_j), quad j=1,dots,n-1.
  $
  The absolute Jacobian is the product of the diagonal derivatives; reversing
  each integration interval absorbs their signs. Thus #eq(
    $
      a_k^(-1)=lr((product_(j=1)^(n-1) p_j))
      integral_0^1 dots integral_0^1 f_n^(p_n k_n) \
      times lr(
        (product_(j=1)^(n-1)
          f_j^(p_j (k_j+1))(1-u_j)^(p_j (k_j+1)-1))
      )
      d u_1 dots d u_(n-1).
    $,
  ) <eq:szego-unit-cube-integral>

  #source(208, "196")
  #keep-next[
    For brevity let $A_i=f_(1+ν_(i-1))$. The transformed upper limits satisfy
  ]
  #eq(
    $
      f_j=f_(j-1)u_(j-1), quad j=ν_(i-1)+2,dots,ν_i,
      quad i=1,dots,m,
    $,
  ) <eq:szego-radial-recursion>
  #keep-next[together with $A_1=1$ and]
  $
    A_i=A_(i-1)^(γ_i/γ_(i-1))
    lr((1-lr((1-frac(f_(ν_(i-1))u_(ν_(i-1)), A_(i-1))))^(1/γ_(i-1))))^(γ_i),
    \
    i=2,dots,s,s+2,dots,m,
  $
  and
  $
    A_(s+1)=lr(
      (
        -frac(1, α_1) ln lr(
          (
            1-A_s^(1/γ_s)
            lr((1-lr((1-frac(f_(ν_s)u_(ν_s), A_s)))^(1/γ_s)))
          )
        )
      )
    )^(α_2 γ_(s+1)).
  $
  These relations are used on the interior of the integration cube and extended
  to its boundary by limits. We compute @eq:szego-unit-cube-integral using three
  lemmas.
]

#lemma[
  _Consider one block of indices $a,dots,b$. Let $q_j$ be positive integers, let
  $f_a>0$ be fixed, and set $f_j=f_a product_(r=a)^(j-1) u_r$. For nonnegative
  integers $α,β$, put_
  #eq(
    $
      J_1=integral_0^1 dots integral_0^1 f_b^α u_b^β
      lr((product_(j=a)^b f_j^(q_j)(1-u_j)^(q_j-1)))
      d u_a dots d u_b.
    $,
  ) <eq:beta-block-integral>
  #keep-next[_Then, with $T=sum_(j=a)^b q_j$,_]
  #eq(
    $
      J_1=frac(β!(α+q_b)!, (β+q_b)!(α+T)!)
      lr((product_(j=a)^b (q_j-1)!)) f_a^(α+T).
    $,
  ) <eq:beta-block-value>
  _For a full block in the application, $a=ν_(i-1)+1$, $b=ν_i$ and
  $q_j=p_j (k_j+1)$; the lemma also applies to a shorter block. The $T$ here is
  the sum over this chosen block._
] <lem:beta-block-integral>

#proof[
  Successive integrations give beta integrals. The exponent of $u_j$ for $j<b$
  is $α+sum_(r=j+1)^b q_r$, and the exponent of $u_b$ is $β$. Use #eq(
    $
      integral_0^1 u^α (1-u)^β d u=frac(α!β!, (α+β+1)!),
      quad α,β in NN.
    $,
  ) <eq:beta-integral>
  The intermediate factorials telescope, leaving @eq:beta-block-value. See also
  #bib-ref("Egorychev1974c"), pp. 161–162.
]

#lemma(suffix: [])[
  (#bib-ref("Egorychev1974c"), pp. 163–164).
  _Let $i=2,dots,s,s+2,dots,m$, and consider the preceding block $a=ν_(i-2)+1$,
  $b=ν_(i-1)$. Put $q_j=p_j (k_j+1)$ and $T=sum_(j=a)^b q_j$. Suppose $α>=0$ and
  $N=α γ_i$ is an integer._
  #keep-next[_Define_]
  #eq(
    $
      J_2=integral_0^1 dots integral_0^1 f_(1+ν_(i-1))^α
      lr((product_(j=a)^b f_j^(q_j)(1-u_j)^(q_j-1)))
      d u_a dots d u_b.
    $,
  ) <eq:nested-beta-integral>
  #keep-next[_Then_]
  #eq(
    $
      J_2=f_a^(α γ_i/γ_(i-1)+T)
      frac((α γ_i)!(γ_(i-1)T)!, (α γ_i+γ_(i-1)T)! T!)
      product_(j=a)^b (q_j-1)!.
    $,
  ) <eq:nested-beta-value>
  _In particular, the lemma applies to nonnegative integer $α$._
] <lem:nested-beta-integral>

#source(209, "197")
#proof[
  Put $g=γ_(i-1)$. By @eq:szego-radial-recursion,
  $
    f_(1+ν_(i-1))^α
    =f_a^(N/g) lr((1-lr((1-frac(f_b u_b, f_a)))^(1/g)))^N.
  $
  To express the coefficients as residues, write
  $
    c_(r,ℓ)=res_(z_1,z_2)
    (1-z_1)^N (1-z_2)^(r/g) z_1^(-r-1)z_2^(-ℓ-1).
  $
  The sum over $r$ is finite, $0<=r<=N$. For each such $r$, the binomial series
  for $(1-x)^(r/g)$ converges absolutely and uniformly on $[0,1]$; when $r=0$ it
  is the constant $1$. Therefore the expansion may be integrated term by term:
  #eq(
    $
      J_2 & =f_a^(N/g) sum_(r=0)^N sum_(ℓ=0)^infinity
            frac(c_(r,ℓ), f_a^ℓ) \
          & quad times integral_0^1 dots integral_0^1 f_b^ℓ u_b^ℓ
            lr((product_(j=a)^b f_j^(q_j)(1-u_j)^(q_j-1)))
            d u_a dots d u_b.
    $,
  ) <eq:nested-beta-expansion>
  @lem:beta-block-integral evaluates the integral as
  $
    frac(ℓ!, (ℓ+T)!) lr((product_(j=a)^b (q_j-1)!)) f_a^(ℓ+T).
  $
  Now use
  $
    frac(ℓ!, (ℓ+T)!)=frac(1, (T-1)!)
    integral_0^1 x^ℓ (1-x)^(T-1) d x
  $
  #keep-next[and sum the two coefficient series. This gives]
  $
    J_2=frac(f_a^(N/g+T), (T-1)!)
    lr((product_(j=a)^b (q_j-1)!)) \
    times integral_0^1 lr((1-(1-x)^(1/g)))^N (1-x)^(T-1) d x.
  $
  #source(210, "198")
  The substitution $y=1-(1-x)^(1/g)$ turns the last integral into
  $
    g integral_0^1 y^N (1-y)^(g T-1) d y
    =frac(g N!(g T-1)!, (N+g T)!).
  $
  Formula @eq:nested-beta-value follows.
]
