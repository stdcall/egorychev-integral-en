#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, source

#source(130, "118")
#heading(level: 2)[
  Combinatorial Interpretation of Identities
] <sec:identity-interpretations>
#index-mark([@sec:identity-interpretations], group: [Numbers])[Combinatorial]

Combinatorial analysis developed in the seventeenth century as the study of
permutations and combinations. It now studies arrangements of elements subject
to specified rules and determines how many such arrangements exist. Two broad
classes of problems are distinguished: existence and enumeration. Its basic
operations are selecting subsets and ordering elements; see, for example,
#bib-ref("Hall1958", "Riordan1958", "Rybnikov1972").

Enumerative combinatorics, together with related areas of discrete and
continuous mathematics, is developing rapidly as computing power increases and
methods of asymptotic analysis advance. To discover and prove combinatorial
identities, researchers draw on permutations and combinations, distributions of
particles among cells, lattice theory, graph theory, and other methods. It is
instructive to understand how such combinatorial constructions yield complicated
analytic formulas.

#source(131, "119")
#heading(level: 3)[
  Interpretation of combinatorial numbers
] <sec:combinatorial-numbers>

Binomial coefficients and the Stirling, Bell, Bernoulli, DeMorgan and Euler
numbers are commonly called *combinatorial numbers*; see the Appendix and
#bib-ref("Platonov1975"). Many count familiar classes of objects, while others
occur as signed or weighted coefficients. Analytically, these numbers often
appear as transition coefficients between polynomial bases, or as coefficients
of various generating functions. For example, the Stirling numbers of the first
and second kinds are determined by #eq(
  $
    x^((n)) & =x(x-1)dots(x-n+1)=sum_(k=0)^n s_(1)(n,k)x^k, \
        x^n & =sum_(k=0)^n s_(2)(n,k)x^((k)), quad n=0,1,dots,
  $,
) <eq:stirling-basis-change>
where $x^((0))=x^0=s_(1)(0,0)=s_(2)(0,0)=1$.

The authors of #bib-ref("Mullin1970"), on finite-difference methods in
combinatorial analysis, study sequences of polynomials $P_(n)(x)$ of degree $n$
satisfying
$
  P_(n)(x+y)=sum_(k=0)^n binom(n, k)P_(k)(x)P_(n-k)(y).
$
They call these sequences *of binomial type*. Many well-studied polynomial
systems have this property. The authors give an efficient algorithm for finding
the transition coefficients between any two such sequences. They also provide
combinatorial interpretations in terms of constrained distributions of balls
among boxes and the enumeration of classes of rooted trees.

Here are some familiar interpretations. The number $s_(2)(n,k)$ counts
partitions of an $n$-element set into $k$ nonempty blocks, and the Bell number
$B(n)$ counts all set partitions. The DeMorgan number
$ Delta^k 0^n=k!s_(2)(n,k) $
#source(132, "120")
counts distributions of $n$ distinct objects among $k$ distinct cells, with no
cell empty. The number $(-1)^(n+k)s_(1)(n,k)$ counts permutations of $n$
elements with exactly $k$ cycles.

A permutation $(a_1,dots,a_n)$ is *alternating* if its successive inequalities
alternate. Let $A(n)$ count those beginning $a_1<a_2>a_3<dots$, with
$A(0)=A(1)=1$. For $n>=1$, the Euler and Bernoulli numbers satisfy
$
  E_(2n)=(-1)^n A(2n), quad
  B_(2n)=(-1)^(n-1)n 2^(-2n+1)(2^(2n)-1)^(-1)A(2n-1).
$
For $n>=1$, the *Eulerian numbers* $A(n,k)$ in the convention of Table M,
@table:eulerian count permutations of $n$ elements with $k-1$ ascents, that is,
indices $i$ for which $a_i<a_(i+1)$.

We conclude with the probabilistic interpretation of the generalized Stirling
numbers of the second kind given in #bib-ref("Ivchenko1965b"). Toss $n$ distinct
objects independently and uniformly into $N=k+r>0$ labelled urns, of which $k$
are white and $r$ are black. All parameters are nonnegative integers.
#block(sticky: true)[
  Let $xi_k$ be the number of occupied white urns. Then, for $0<=m<=k$,
]
$
  P{xi_k=m}=frac(k!, (k-m)!)frac(s_(2)^((r))(n,m), (k+r)^n).
$
Here the normalization is
$
  s_(2)^((r))(n,m)=frac(1, m!)sum_(j=0)^m
  (-1)^(m-j)binom(m, j)(r+j)^n,
$
with $0^0=1$. Choose the $m$ occupied white urns and apply inclusion–exclusion
to require each of them to be nonempty. This proves the probability formula.

Equivalently, $s_(2)^((r))(n,k)$ counts distributions into $k$ unlabelled,
nonempty cells and $r$ labelled cells that may be empty. If the first $k$ cells
are also labelled, the count is $k!s_(2)^((r))(n,k)$.

#heading(level: 3)[
  A combinatorial proof of the identity in §@sec:univariate-inversion
] <sec:stirling-tree-proof>

In §@sec:univariate-inversion we obtained the identity #eq(
  $
    sum_(t=1)^n binom(n-1, t-1)n^(n-t)t!s_(2)(t+k,t)=n^(n+k),
    quad n>=1, quad k>=0,
  $,
) <eq:stirling-tree-identity>
and asked for a combinatorial interpretation. The following proof was found by
Liskovets; we give a sketch from #bib-ref("Egorychev1974c").

Let $X$ and $Y$ be disjoint labelled sets, with $|X|=n$, $|Y|=k+1$, and a fixed
$x_1 in X$. Let $P_n$ consist of maps $X union Y -> X$ whose restriction to $X$
is a tree directed towards $x_1$, with $x_1$ mapped to itself. By Cayley's
formula and the independent choices of images for $Y$,
$ p(n)=|P_n|=n^(n-2)n^(k+1)=n^(n+k-1). $
For $n=1$ there is one map, as this expression also gives.

For each map, retain the paths from the vertices of $Y$ to $x_1$. Their union is
a tree on $Y union Z$, where $x_1 in Z subset.eq X$ and $|Z|=t>=1$.
#source(133, "121")
It has $k+t+1$ vertices; its leaves are exactly the vertices of $Y$, together
possibly with $x_1$. No other vertex can be a leaf of this union of paths.
Rényi's formula #bib-ref("Renyi1959") gives $(N-r)!s_(2)(N-2,N-r)$ labelled
trees on $N>=2$ vertices whose leaf set is a specified set of size $r$. Thus,
for each fixed $Z$, the number of these trees is
$
  q(t) & =t!s_(2)(t+k-1,t)+(t-1)!s_(2)(t+k-1,t-1) \
       & =(t-1)!s_(2)(t+k,t).
$
The two terms distinguish whether $x_1$ is a leaf.

Now use the embedding method #bib-ref("Liskovets1969"). There are
$binom(n-1, t-1)$ choices for $Z$, and each of its component trees extends to
the same number $alpha(n, t)$ of maps in $P_n$. To count the extensions, attach
the remaining vertices $X without Z$ without creating new cycles. Göbel's
formula #bib-ref("Moon1967") states that any given map $Z->Z$ extends to exactly
$alpha(n, t)=t n^(n-t-1)$ maps $X->X$ with no new cyclic vertices. Here
$Z subset.eq X$, $|Z|=t$ and $|X|=n$; the value is $1$ when $t=n$. For $t=1$ the
formula reduces to Cayley's formula. The vertices of $Y$ remain leaves and have
their images already fixed, so they introduce no further choices. Therefore
$
  sum_(t=1)^n binom(n-1, t-1)t n^(n-t-1)q(t)=p(n).
$
Substituting the expressions for $q(t)$ and $p(n)$ and multiplying by $n$ gives
@eq:stirling-tree-identity.
