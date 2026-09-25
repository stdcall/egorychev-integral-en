#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(215, "203")
We conclude with some special cases of @eq:szego-root-sum. Write $ν=ν_s$.

#keep-next[
  a) Let $α_1=α_2=γ_1=dots=γ_m=p_1=dots=p_n=1$. Then
]
#eq(
  $
    D=lr(
      {z in CC^n: sum_(j=1)^ν abs(z_j)^2
        <exp lr((-sum_(j=ν+1)^n abs(z_j)^2))}
    ),
  $,
) <eq:exponential-ball-domain>
#eq(
  $
    h(x)=D_x lr(
      (1-lr((sum_(j=1)^ν x_j))
        exp lr((sum_(j=ν+1)^n x_j)))
    )^(-1).
  $,
) <eq:exponential-ball-kernel>

#keep-next[
  b) Let $α_2=γ_(s+1)=dots=γ_m=p_(ν+1)=dots=p_n=1$. Then
]
#eq(
  $
    D=lr(
      {z in CC^n: lr((sum_(i=1)^s M_i (z)^(1/γ_i)))^(1/α_1)
        <exp lr((-sum_(j=ν+1)^n abs(z_j)^2))}
    ),
  $,
) <eq:mixed-exponential-domain>
#eq(
  $
    h(x) & =frac(1, product_(j=1)^ν p_j product_(i=1)^s γ_i) D_x
           sum_(t,r) \
         & quad times lr(
             (1-lr((sum_(i=1)^s δ(r_i,γ_i)F_i (x)^(1/γ_i)))
               exp lr((α_1 sum_(j=ν+1)^n x_j)))
           )^(-1).
  $,
) <eq:mixed-exponential-kernel>
Here the sum runs over $1<=t_j<=p_j$ for $1<=j<=ν$ and $1<=r_i<=γ_i$ for
$1<=i<=s$. For fixed $x_(ν+1),dots,x_n$, this kernel is rational in
$x_1,dots,x_ν$. Indeed, averaging over all choices of roots leaves a rational
function of these variables and $E=exp(α_1 sum_(j=ν+1)^n x_j)$: every conjugate
choice merely permutes the summands. Differentiation preserves rationality in
$x_1,dots,x_ν,E$. For the general principle that a globally single-valued
algebraic function is rational, see #bib-ref("Hurwitz1929"), p. 393, and
#bib-ref("Shabat1969"), Problem 16b, p. 302.#footnote[
  The same observation applies to @eq:nested-exponential-kernel when all the
  parameters determining the expression after the exponential sign in
  @eq:nested-exponential-domain are equal to $1$.
]

#keep-next[In particular, for a positive integer $p$, if]
#eq(
  $
    D=lr({z in CC^2: abs(z_1)^(2/p)<exp(-abs(z_2)^2)}),
  $,
) <eq:powered-exponential-domain>
#source(216, "204")
#keep-next[then]
#eq(
  $
    h(x)=frac(∂, ∂ x_1)lr((frac(1, 1-x_1 exp(p x_2)))).
  $,
) <eq:powered-exponential-kernel>

c) Suppose at least one $p_j$, $j=ν+1,dots,n$, exceeds $1$. For example, if #eq(
  $
    D=lr({z in CC^2: abs(z_1)^2<exp(-abs(z_2))}),
  $,
) <eq:square-root-exponential-domain>
#keep-next[then]
#eq(
  $
    h(x)=frac(∂, ∂ x_1)lr(
      (
        frac(1-x_1 cosh sqrt(x_2), 1-2x_1 cosh sqrt(x_2)+x_1^2)
      )
    ),
  $,
) <eq:square-root-exponential-kernel>
where $cosh t=(e^t+e^(-t))/2$. Because $cosh$ is even and entire,
$cosh sqrt(x_2)$ is entire in $x_2$. Thus @eq:square-root-exponential-kernel is
holomorphic wherever its denominator is nonzero.
