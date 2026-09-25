#import "index-style.typ": index-mark
#import "statements.typ": theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": eq, source

#source(216, "204")
We state without proof a generalization of @th:szego-general-series. Let
$n_1>dots>n_k$ be positive integers, put $n=n_1$, and let $P$ be the $k times n$
matrix whose $i$th row is $(p_(i,1),dots,p_(i,n_i),0,dots,0)$, with every active
entry $p_(i,j)$ a positive integer. For each $2<=i<=k$, choose endpoints
$
  0=b_(i,0)<b_(i,1)<dots<b_(i,n_i)=n_(i-1)
$
and write $B_(i,j)={b_(i,j-1)+1,dots,b_(i,j)}$. These consecutive blocks specify
which terms belong to each nested sum. Define the sums recursively by
$
  L_(1,j)(z)=abs(z_j)^2, quad
  L_(i,j)(z)=sum_(r in B_(i,j)) L_(i-1,r)(z)^(1/p_(i-1,r))
  quad (2<=i<=k),
$
and set $L_v=L_(k,v)$. Consider the domain #eq(
  $
    D=lr(
      {z in CC^n: L_1 (z)<exp lr(
          (-p_(k,1)
            sum_(v=2)^(n_k) L_v (z)^(1/p_(k,v)))
        )}
    ).
  $,
) <eq:nested-exponential-domain>
The first summation level thus contains $abs(z_j)^(2/p_(1,j))$; each subsequent
level takes the indicated root before summing. When $n_k=1$, the empty sum in
@eq:nested-exponential-domain is zero and the domain is bounded.

#source(217, "205")
Let $h(x)=h(x_1,dots,x_n)$ be the Szegő kernel of @eq:nested-exponential-domain
for the normalized measure corresponding to
$
  frac(1, (2 pi i)^n) dif abs(ζ)^2 [n] ∧ frac(dif ζ, ζ).
$
For the algebraic sums, put
$
  σ_(i,j)=exp(2 pi i α_(i,j)/p_(i,j)), quad Q_(1,j)(x)=x_j,
$
$
  Q_(i,j)(x)=sum_(r in B_(i,j)) σ_(i-1,r)
  Q_(i-1,r)(x)^(1/p_(i-1,r)) quad (2<=i<=k),
$
and write $Q_v=Q_(k,v)$. Let $cal(A)$ be the set of pairs $(i,j)$ with $1<=i<=k$
and $1<=j<=n_i$, excluding $(k,1)$. In the following sum each $α_(i,j)$
independently runs from $1$ to $p_(i,j)$ for $(i,j) in cal(A)$.

#theorem[
  #eq(
    $
      h(x) & =lr((product_((i,j) in cal(A)) p_(i,j)^(-1))) D_x sum_α \
           & quad times frac(
               1,
               1-Q_1 (x)exp lr(
                 (p_(k,1)
                   sum_(v=2)^(n_k) σ_(k,v)Q_v (x)^(1/p_(k,v)))
               ),
             ),
    $,
  ) <eq:nested-exponential-kernel>
  where $D_x=frac(∂^(n-1), ∂ x_1 dots ∂ x_(n-1))$. Every choice of roots is
  included, so the complete average is independent of their initial branches.
  Near $x=0$ it defines a holomorphic function, including points where roots
  coalesce.
] <th:nested-exponential-kernel>
#index-mark([@th:nested-exponential-kernel], group: [Kernels])[Szegö]
