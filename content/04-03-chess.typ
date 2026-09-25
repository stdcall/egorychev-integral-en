#import "statements.typ": corollary, lemma, solution, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(145, "133")
#heading(level: 3)[
  Arrangements of kings and rooks on a chessboard
] <sec:kings-and-rooks>

We use inclusion–exclusion to count arrangements of $m$ kings and $n-m$ rooks on
an $n times n$ chessboard, with exactly one piece in every row and column and no
piece attacking another. Here $n>=1$ and $0<=m<=n$ are integers. The cases $m=0$
and $m=n$ were solved in #bib-ref("Riordan1958") and #bib-ref("Abramson1966"),
respectively.

#solution[
  Let $M$ be the set to be counted and $I={1,dots,n}$. Let $M_emptyset$ consist
  of pairs $(sigma,A)$, where $sigma$ is a permutation of $I$ and
  $A subset.eq I$ has $m$ elements. Such a pair gives pieces on the squares
  $(1,sigma(1)),dots,(n,sigma(n))$, with a king in column $i$ precisely when
  $i in A$. These arrangements have one piece in each row and column.

  For $J={1,dots,n-1}$, define $P_(i)(sigma,A)$ to mean that the pieces in
  columns $i$ and $i+1$ attack one another. Equivalently,
  $ |sigma(i)-sigma(i+1)|=1 quad "and" quad (i in A "or" i+1 in A). $
  The desired set $M$ consists of pairs having none of these properties. Write
  $Omega=cal(P)(J)$. Inclusion–exclusion gives
  $ |M|=sum_(alpha in Omega)(-1)^(|alpha|)|M_alpha|, $
  where $M_alpha subset.eq M_emptyset$ consists of pairs satisfying every $P_i$
  for $i in alpha$.

  Following #bib-ref("Abramson1966"), call a maximal interval of consecutive
  integers in $alpha$ a *segment*. For $beta={l,dots,l+t}$, put
  $overline(beta)={l,dots,l+t+1}$. List the segments from left to right as
  $alpha_1,dots,alpha_r$ and their lengths as $arrow(d)=(d_1,dots,d_r)$. Let
  $k=k(alpha)=|alpha|=sum_(i=1)^r d_i$ and $r=r(alpha)$.

  The intervals $overline(alpha)_1,dots,overline(alpha)_r$ are disjoint. A pair
  $(sigma,A)$ belongs to $M_alpha$ exactly when:
  #source(146, "134")

  a) On each $overline(alpha)_i$, $sigma$ increases or decreases with step $1$.

  b) Each $overline(alpha)_i inter (I without A)$ contains no two consecutive
  integers.

  Indeed, successive differences of magnitude one cannot change sign in a
  permutation, since that would repeat a value. Condition b) says that no two
  adjacent pieces in one of these intervals are both rooks.
]

#lemma[
  _Let $beta_1,dots,beta_l$ be disjoint intervals in $I$, each of length at
  least two. The number of permutations increasing or decreasing with step one
  on every $beta_i$ is_
  $ 2^l lr((n+l-sum_(i=1)^l |beta_i|))!. $
  To see this, contract each prescribed interval to one block, order the blocks
  and the remaining single positions by their image values, and choose one of
  two orientations in each block. Consequently, the number of permutations
  satisfying a) is
  $
    2^r lr((n+r-sum_(i=1)^r |overline(alpha)_i|))! =2^r (n-k)!.
  $
] <lem:permutation-intervals>

#lemma[
  _The number of $t$-element subsets of ${1,dots,d}$ containing no consecutive
  integers is $binom(d-t+1, t)$._ Indeed, if $b_1<dots<b_t$ are chosen,
  subtracting $j-1$ from $b_j$ gives an arbitrary $t$-element subset of
  ${1,dots,d-t+1}$.
] <lem:nonconsecutive-subsets>

Let $t_i$ be the number of rooks in $overline(alpha)_i$. The number of king sets
$A$ satisfying b) is therefore
$
  sum_(t_1,dots,t_r>=0)
  lr([product_(i=1)^r binom(d_i+2-t_i, t_i)])
  binom(n-k-r, n-m-t_1-dots-t_r).
$
Only feasible choices are included: $t_i<=floor((d_i+2)/2)$ and the remaining
$n-m-sum_i t_i$ rooks lie in the $n-k-r$ positions outside these intervals.

Let $Omega_(arrow(d))$ be the subsets of $J$ with the prescribed ordered segment
lengths $arrow(d)$. #lemma[
  _If $k=sum_(i=1)^r d_i$, $d_i>=1$, then_
  $ |Omega_(arrow(d))|=binom(n-k, r). $
  #block(sticky: true)[
    The $r-1$ internal gaps each contain at least one integer; the two end gaps
    may be empty. Distributing the remaining gap lengths proves the formula. All
    $|M_alpha|$ for $alpha in Omega_(arrow(d))$ are equal, so for any such
    $alpha_0$,
  ]
  $ sum_(alpha in Omega_(arrow(d)))|M_alpha|=binom(n-k, r)|M_(alpha_0)|. $
] <lem:interval-placement-count>

#block(sticky: true)[For $k+r<=n$, define]
$
  Phi(arrow(d)) & =2^r binom(n-k, r)
                  sum_(t_1,dots,t_r>=0)
                  lr([product_(i=1)^r binom(d_i+2-t_i, t_i)]) \
                & quad times binom(n-k-r, n-m-t_1-dots-t_r), \
         G(r,k) & =sum_(d_1+dots+d_r=k, d_i>=1)Phi(arrow(d)), \
           T(k) & =sum_(r=1)^k G(r,k), quad k>=1, quad T(0)=binom(n, m).
$
Set $G(r,k)=0$ when $r>n-k$ or $r>k$. Binomial coefficients in these counting
formulas are zero outside their nonnegative combinatorial ranges.

#source(147, "135")
Then
$ |M|=sum_(k=0)^(n-1)(-1)^k (n-k)!T(k). $
For $m=n$, every $t_i=0$, and hence
$
  Phi(arrow(d))=2^r binom(n-k, r), quad
  G(r,k)=sum_(d_1+dots+d_r=k, d_i>=1)2^r binom(n-k, r).
$
#corollary[
  _There are $binom(k-1, r-1)$ ordered compositions of $k$ into $r$ positive
  parts. Thus, when $m=n$,_
  $
    G(r,k)=2^r binom(n-k, r)binom(k-1, r-1), quad
    T(k)=sum_(r=1)^k 2^r binom(n-k, r)binom(k-1, r-1).
  $
  This recovers the result of #bib-ref("Abramson1966").
]

#block(sticky: true)[
  We now use these lemmas to obtain a simpler integral expression for $T(k)$.
  The identity
]
$
  [x^(d+2)]frac(1, 1-x-x^2 y)=sum_(t=0)^(floor((d+2)/2))
  binom(d+2-t, t)y^t
$
#block(sticky: true)[
  turns the formula for $Phi$ into
]
$
  Phi(arrow(d)) & =frac(1, (2pi i)^(r+2))integral_(Gamma)
                  lr([product_(i=1)^r frac(1, x_i^(d_i+3)(1-x_i-x_i^2 y))]) \
                & quad times frac((1+y)^(n-k-r), y^(n-m+1))
                  frac((1+2z)^(n-k), z^(r+1))
                  dif y ∧ dif z ∧ dif x_1 ∧ dots ∧ dif x_r.
$
Here $Gamma$ is a product of positively oriented circles about zero. Choose
$|x_i|=delta_i<1$ and $|y|=eta>0$ so that $eta delta_i^2<1-delta_i$ for every
$i$; the $z$ circle has any positive radius. The geometric expansions then
converge uniformly.

To sum over positive $d_i$ with total $k$, write $d_i=h_i+1$ and introduce $w$
to extract $sum_i h_i=k-r$. This gives
$
  G(r,k) & =frac(1, (2pi i)^(r+3))integral_(Gamma')
           lr([product_(i=1)^r frac(1, x_i^3 (x_i-w)(1-x_i-x_i^2 y))]) \
         & quad times frac((1+y)^(n-k-r), y^(n-m+1))
           frac((1+2z)^(n-k), z^(r+1)w^(k-r+1)) \
         & quad times dif y ∧ dif z ∧ dif w
           ∧ dif x_1 ∧ dots ∧ dif x_r,
$
#source(148, "136")
where in addition $0<|w|<min_i delta_i$.

#block(sticky: true)[
  For each $x$ circle, the integral is
]
$
  frac(1, 2pi i)integral_(|x|=delta)
  frac(dif x, x^3 (x-w)(1-x-x^2 y))
  =frac(1+2y+w y+w y^2, 1-w-w^2 y)=H(w,y).
$
Indeed, if $F(x)=1/(1-x-x^2 y)$, expanding $(x-w)^(-1)$ shows that the integral
is $sum_(h=0)^infinity [x^(h+3)]F(x)w^h$, which equals
$[F(w)-1-w-(1+y)w^2]/w^3$. The apparent singularity at $w=0$ is removable.

After evaluating all the $x_i$ integrals,
$
  G(r,k)=frac(1, (2pi i)^3)integral H(w,y)^r
  frac((1+y)^(n-k-r), y^(n-m+1))
  frac((1+2z)^(n-k), z^(r+1)w^(k-r+1))
  dif y ∧ dif z ∧ dif w.
$
For $k>=1$, the $r=0$ term has zero $w$ residue, so it may be added to the sum
for $T(k)$. Taking the $z$ coefficient and then summing over $r$ gives
$
  sum_(r=0)^(n-k)binom(n-k, r)(2w H(w,y))^r (1+y)^(n-k-r)
  =(1+y+2w H(w,y))^(n-k).
$
#block(sticky: true)[
  Terms with $r>k$ have zero $w^k$ coefficient. Since
]
$
  1+y+2w H(w,y)=frac(1+y+w+3w y+w^2 y+w^2 y^2, 1-w-w^2 y),
$
we obtain #eq(
  $
    T(k) & =frac(1, (2pi i)^2)integral integral
           lr((frac(1+y+w+3w y+w^2 y+w^2 y^2, 1-w-w^2 y)))^(n-k) \
         & quad times frac(dif y ∧ dif w, y^(n-m+1)w^(k+1)),
           quad 1<=k<=n-1,
  $,
) <eq:chess-rook-integral>
with $T(0)=binom(n, m)$. The two circles may be chosen sufficiently small that
the rational kernel is analytic on and inside their product.

#theorem(suffix: [])[
  #bib-ref("Avramenok1975"). _The number of arrangements of $m$ kings and $n-m$
  rooks on an $n times n$ chessboard, with one piece in every row and column and
  no attacks, is_ #eq(
    $
      |M|=sum_(k=0)^(n-1)(-1)^k (n-k)!T(k),
    $,
  ) <eq:chess-permutation-count>
  _where $T(k)$ is given by @eq:chess-rook-integral and $T(0)=binom(n, m)$._
] <th:chess-permutation-count>
