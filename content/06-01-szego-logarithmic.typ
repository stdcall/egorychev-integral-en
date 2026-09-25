#import "main-defs.typ": eq, res, source
#import "statements.typ": lemma, proof, remark
#import "book-style.typ": keep-next

#source(210, "198")
#lemma[
  _Let $q_j=p_j (k_j+1)$ for $j<=ν_s$, and let $T_i=sum_(j in B_i) q_j$ for
  $i<=s$. Put $Q_1=sum_(i=1)^s γ_i T_i$. For a nonnegative integer $Q_2$,
  define_
  #eq(
    $
      J_3=integral_0^1 dots integral_0^1 f_(1+ν_s)^(Q_2/γ_(s+1))
      lr((product_(j=1)^(ν_s) f_j^(q_j)(1-u_j)^(q_j-1)))
      d u_1 dots d u_(ν_s),
    $,
  ) <eq:logarithmic-block-integral>
  _where the $f_j$ satisfy @eq:szego-radial-recursion and its accompanying
  recurrences._
  #keep-next[_Then_]
  #eq(
    $
      J_3=(α_1 Q_1)^(-α_2 Q_2) frac((α_2 Q_2)!, Q_1!)
      lr((product_(i=1)^s frac((γ_i T_i)!, T_i!)))
      product_(j=1)^(ν_s) (q_j-1)!.
    $,
  ) <eq:logarithmic-block-value>
] <lem:logarithmic-block-integral>

#proof[
  We follow the coefficient method of @lem:nested-beta-integral. Put
  $N=α_2 Q_2$, $g=γ_s$, $A=f_(1+ν_(s-1))$ and $U=f_(ν_s)u_(ν_s)/A$. Define
  $
    c_r=res_z (-ln(1-z))^N z^(-r-1), quad
    G(t)=1-(1-t)^(1/g),
  $
  and write the coefficients of $G(t)^r$ as
  $
    d_(r,ℓ)=sum_(h=0)^r res_(z_2,z_3)
    (1-z_2)^r (1-z_3)^(h/g) z_2^(-h-1) z_3^(-ℓ-1).
  $
  The sum over $h$ is finite. Since $g>=1$, the coefficients of $G$ are
  nonnegative; hence $c_r>=0$ and $d_(r,ℓ)>=0$. The logarithmic recurrence gives
  $
    f_(1+ν_s)^(Q_2/γ_(s+1))
    =α_1^(-N) sum_(r=0)^infinity sum_(ℓ=0)^infinity
    c_r d_(r,ℓ) A^(r/g) U^ℓ.
  $
  Group the finite sum defining $d_(r,ℓ)$ before interchanging the two infinite
  sums and the integral. All resulting terms are nonnegative, so Tonelli's
  theorem applies, including at improper endpoints.

  Integration over the last block by @lem:beta-block-integral, with its two
  exponents equal to $ℓ$, gives the factor
  $
    frac(ℓ!, (ℓ+T_s)!) A^(r/g+T_s)
    product_(j in B_s) (q_j-1)!.
  $
  Apply @lem:nested-beta-integral successively to the preceding $s-1$ blocks.
  Its exponent may be rational, but its product with the next block's $γ$ is an
  integer, as required. The factorials telescope.
  #source(211, "199")
  #eq(
    $
      J_3 & =α_1^(-N)
            lr((product_(i=1)^(s-1) frac((γ_i T_i)!, T_i!)))
            lr((product_(j=1)^(ν_s) (q_j-1)!)) Σ_1, \
      Σ_1 & =sum_(r=0)^infinity c_r frac((r+g T_s)!, (r+Q_1)!)
            sum_(ℓ=0)^infinity d_(r,ℓ) frac(ℓ!, (ℓ+T_s)!).
    $,
  ) <eq:logarithmic-series-reduction>
  This also covers $s=1$, with an empty product and $Q_1=g T_s$.

  Insert the beta integral
  $
    frac(ℓ!, (ℓ+T_s)!)=frac(1, (T_s-1)!)
    integral_0^1 x^ℓ (1-x)^(T_s-1) d x
  $
  and sum over $ℓ$. The inner sum in @eq:logarithmic-series-reduction becomes
  $
    frac(1, (T_s-1)!) integral_0^1
    lr((1-(1-x)^(1/g)))^r (1-x)^(T_s-1) d x.
  $
  #keep-next[The substitution $y=(1-x)^(1/g)$ gives]
  #eq(
    $
      Σ_1=frac(g, (T_s-1)!) sum_(r=0)^infinity
      c_r frac((r+g T_s)!, (r+Q_1)!)
      integral_0^1 y^(g T_s-1)(1-y)^r d y.
    $,
  ) <eq:logarithmic-beta-transform>
  #keep-next[Two uses of @eq:beta-integral yield]
  $
    frac((r+g T_s)!, (r+Q_1)!)
    integral_0^1 y^(g T_s-1)(1-y)^r d y \
    =frac((g T_s-1)!, (Q_1-1)!)
    integral_0^1 x^r (1-x)^(Q_1-1) d x.
  $
  #source(212, "200")
  #keep-next[
    Summing the nonnegative series $sum_r c_r x^r=(-ln(1-x))^N$ therefore gives
  ]
  $
    Σ_1=frac((g T_s)!, T_s!(Q_1-1)!)
    integral_0^1 (1-x)^(Q_1-1)(-ln(1-x))^N d x.
  $
  Set $τ=-Q_1 ln(1-x)$ and use $integral_0^infinity τ^N e^(-τ) d τ=N!$. Thus
  #eq(
    $
      Σ_1=frac((γ_s T_s)!, T_s!) frac((α_2 Q_2)!, Q_1!) Q_1^(-α_2 Q_2).
    $,
  ) <eq:logarithmic-series-value>
  This finite value also verifies convergence of the preceding integrals and
  sums. Substitution in @eq:logarithmic-series-reduction proves
  @eq:logarithmic-block-value.

  We now evaluate @eq:szego-unit-cube-integral. Set $q_n=p_n k_n$, retaining
  $q_j=p_j (k_j+1)$ for $j<n$, and use the block sums in
  @eq:szego-series-parameters. First apply @lem:beta-block-integral to the
  variables $u_(1+ν_(m-1)),dots,u_(n-1)$, with both exponents equal to $q_n$.
  This contributes
  $
    frac(q_n!, T_m!) A_m^(T_m)
    product_(j=1+ν_(m-1))^(n-1) (q_j-1)!.
  $
  If this block is empty, $T_m=q_n$ and the displayed expression is simply
  $A_m^(q_n)$. Apply @lem:nested-beta-integral to the remaining $m-s-1$ blocks
  in the second group, and finally apply @lem:logarithmic-block-integral.
  Together with the factor $product_(j=1)^(n-1) p_j$ from
  @eq:szego-unit-cube-integral, the result is
  $
    a_k^(-1) & =lr((product_(j=1)^(n-1) p_j (q_j-1)!)) q_n!
               lr((product_(i=1)^m frac((γ_i T_i)!, T_i!))) \
             & quad times frac((α_2 Q_2)!, (α_1 Q_1)^(α_2 Q_2) Q_1! Q_2!).
  $
  Taking reciprocals gives @eq:szego-general-series. Zero values of $q_n$, $T_m$
  or $Q_2$ cause no difficulty: all factorials have nonnegative arguments, and
  $Q_1>0$.
]

#remark[
  In the proofs of Lemmas @lem:nested-beta-integral[] and
  @lem:logarithmic-block-integral[], integral representations of sums were used
  to compute integrals. The representations needed here were obtained by
  expressing the coefficients in the expansions of the radial upper limits as
  residues.
]
