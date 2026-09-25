#import "statements.typ": theorem
#import "book-style.typ": keep-next, keep-together
#import "main-defs.typ": bib-ref, eq, res, source

#source(224, "212")
#heading(level: 3)[
  The case of a free polynilpotent group
] <sec:free-polynilpotent-ranks>

We first give the necessary definitions. Let $F=F_q$ be a free group of rank
$q>=2$, and let $μ=(n_1,n_2,dots)$ be a sequence of integers $n_i>=2$. Its
_polynilpotent series_ is defined by
$
  F_1=F, quad F_(i+1)=γ_(n_i)(F_i), quad i>=1,
$
where $γ_1 (X)=X$ and $γ_(j+1)(X)=[γ_j (X),X]$. See #bib-ref("Shmelkin1964").

#source(225, "213")
We use the _refined polynilpotent series_
$
  F_(0,n_0)=F, quad F_(i,j)=γ_j (F_(i-1,n_(i-1))),
  quad 1<=j<=n_i,
$
with $n_0=1$. Thus $F_(i,1)=F_i$ and $F_(i,n_i)=F_(i+1,1)$. To avoid repeating
these endpoints, index the terms by
$
  P=lr({(i,j):i>=1, quad 1<=j<n_i}),
$
ordered lexicographically. Increasing pairs correspond to decreasing groups.

The basis of #bib-ref("Bokut1963") is somewhat inconvenient for counting. A
similar construction gives a basis $S$ whose commutators are ordered according
to this refined series (#bib-ref("Gorchakov1970"), Lemmas 1 and 7). If $F_(i,j)$
and $F_(s,l)$ are consecutive terms, put
$
  S_(i,j)=S ∩ (F_(i,j) without F_(s,l)),
$
and let $S_(i,j)(n)$ consist of its commutators of weight $n$. The order first
compares the pairs $(i,j)$, then the weights. Within a fixed pair and weight it
may be chosen subject to the conditions defining basic commutators, or regular
words (#bib-ref("Shirshov1962")).

Write $θ_(i,j)(n)=abs(S_(i,j)(n))$, and let $n^((i,j))$ be the minimum weight in
$S_(i,j)$. The number of weight $n$ basis commutators in
$F_i without F_(i+1)=F_(i,1) without F_(i+1,1)$ is
$
  θ_i (n)=sum_(j=1)^(n_i-1) θ_(i,j)(n).
$
For the free polynilpotent quotient $F/F_(r+1)$, the rank of the weight $n$
lower central factor is therefore $sum_(i=1)^r θ_i (n)$.

#theorem[
  _Put $d_1=1$. The minimum weights are determined by a set $E$ of exceptional
  levels as follows:_
  $
    d_(t+1)=n_t d_t+cases(1 & quad t in E, 0 & quad t ∉ E),
  $
  $
    n^((t,j))=j d_t+cases(1 & quad t in E " and " j>=2, 0 & quad "otherwise"),
    quad 1<=j<n_t.
  $
  _The set $E$ is given by these three cases._
] <th:polynilpotent-minimum-weights>

1) _If $q>=3$, then $E=emptyset$._

2) _Suppose $q=2$ and $n_1>=3$. If the first term of $μ$ different from $3$ is a
$2$, say_
$
  n_1=dots=n_i=3, quad n_(i+1)=2, quad i>=1,
$
_then $E=lr({i+2})$. Otherwise $E=emptyset$: this includes a first non-$3$ term
at least $4$, and the sequence consisting entirely of $3$'s._

#keep-together[
  3) _Suppose $q=2$ and $n_1=2$. Start with $E=lr({2})$. If the first term
  different from $3$ in the tail $n_3,n_4,dots$ is a $2$, say_
  $
    n_3=dots=n_f=3, quad n_(f+1)=2, quad f>=2,
  $
  _then $E=lr({2,f+2})$. When $f=2$ the string of $3$'s is empty, so this means
  $n_3=2$. If the tail consists entirely of $3$'s, or its first non-$3$ term is
  at least $4$, keep $E=lr({2})$._
]

In particular, $E=emptyset$ gives $n^((t,j))=j product_(s=0)^(t-1) n_s$. Each
exceptional level adds $1$ to the minimum for brackets of length at least $2$;
the same increment then enters $d_(t+1)$ and is multiplied by the subsequent
$n_s$.

#source(226, "214")
#theorem[
  _The following formulas determine $θ_(i,j)(n)$ recursively. Set all these
  counts to zero for $n<=0$, and put $θ_(1,0)(n)=0$. For $1<=j<n_1$ the initial
  relations are_
  #eq(
    $θ_(1,j)(n)=cases(0 & quad j!=n, q & quad j=n=1),$,
  ) <eq:polynilpotent-initial-count>
  _the remaining diagonal values being determined by
  @eq:polynilpotent-rank-recurrence. Put_
  #eq(
    $θ_(i,0)(n)=sum_(l=1)^(i-1) sum_(t=1)^(n_l-1) θ_(l,t)(n), quad i>=2.$,
  ) <eq:polynilpotent-previous-levels>
  _For $i=1$, $2<=j=n<n_1$, or for $i>=2$, $1<=j<n_i$, one has $θ_(i,j)(n)=0$
  below the minimum $n^((i,j))$, and otherwise_
  #eq(
    $θ_(i,j)(n)=q φ_(i,j-1)(n-1)-φ_(i,j-1)(n)-ω_(i,j)(n).$,
  ) <eq:polynilpotent-rank-recurrence>
  _Here $ω_(i,1)(n)=0$; for $j>=2$,_
  #eq(
    $
      ω_(i,j)(n)=res_(v,z) lr(
        (
          product_(s=1)^(j-1) product_(k=1)^infinity
          (1-v^s z^k)^(-θ_(i,s)(k)) z^(-n-1)v^(-j-1)
        )
      ),
    $,
  ) <eq:polynilpotent-exclusion-residue>
  _and, for $j>=0$,_
  #eq(
    $
      φ_(i,j)(n)=res_(v,z) lr(
        (
          (1-v)^(-1) product_(s=0)^j product_(k=1)^infinity
          (1-v^s z^k)^(-θ_(i,s)(k)) z^(-n-1)v^(-j-1)
        )
      ).
    $,
  ) <eq:polynilpotent-word-residue>
  The residues extract formal coefficients. A factor with exponent zero is $1$;
  only finitely many factors contribute to any fixed coefficient.
] <th:polynilpotent-initial-count>

For $μ=(2,2,dots)$ these relations give
@eq:derived-word-residue–@eq:solvable-rank-residue: $α^j (n)=θ_(j+1)(n)$ and
$n^((k))=n^((k+1,1))$. They thus recover the ranks
$R^((k))(n)=sum_(j=0)^(k-1) α^j (n)$ for the free solvable group of derived
length $k$ on $q$ generators.

#source(227, "215")
#keep-next[
  They also give the generating function identity for the numbers $θ(j)$ of
  weight $j$ basic commutators of the free group:
]
$
  product_(j=1)^infinity (1-z^j)^(-θ(j))=(1-q z)^(-1).
$
For this purpose allow the first stage to run through all weights, and put
$θ(j)=θ_(1,j)(j)$. Equivalently, for each desired finite coefficient choose
$n_1$ greater than its weight. Taking logarithms and applying Möbius inversion
gives Witt's formula @eq:witt-rank.
