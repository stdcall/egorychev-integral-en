#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": lemma, proof, theorem
#import "book-style.typ": keep-next

#source(219, "207")
#heading(level: 2)[
  Computation of the ranks of the lower central factors of a free solvable group
  and a free polynilpotent group
] <sec:solvable-polynilpotent-ranks>

For a free group $Φ$ on $q$ generators, the ranks of the lower central factors
are given by Witt's formula (#bib-ref("Hall1959"), Theorem 11.2.2): #eq(
  $M_q (n)=frac(1, n) sum_(d divides n) μ(d)q^(n/d), quad n>=1.$,
) <eq:witt-rank>
Here $μ$ is the Möbius function. In #bib-ref("Kourovka1967"), Question 2.18, M.
I. Kargapolov asked for the corresponding ranks for a free solvable group.

#source(220, "208")
Formulas (2)–(6) of #bib-ref("Sokolov1969") give the ranks $R_q^((3))(n)$ for a
free solvable group of derived length three on $q$ generators. In
§@sec:enumeration-integrals we used them with the method of integral
representation of sums to obtain a considerably simpler formula. This led to a
solution for free solvable groups (#bib-ref("Egorychev1972a")) and subsequently
for free polynilpotent groups (#bib-ref("Gorchakov1972"), #bib-ref(
  "Gorchakov1973",
)). We present the results in §§@sec:free-solvable-ranks and
@sec:free-polynilpotent-ranks, with a combinatorial proof in
§@sec:free-solvable-ranks. For the additional facts from group theory, see
#bib-ref("Hall1959").

#heading(level: 3)[The case of a free solvable group] <sec:free-solvable-ranks>

Fix an integer $q>=2$. Let $R^((k+1))(n)$ denote the rank of
$γ_n (F)/γ_(n+1)(F)$, $n>=1$, for the free solvable group $F$ of derived length
$k+1$ on $q$ generators. We suppress $q$ in this notation and set all ranks at
nonpositive weights to zero. The initial values are
$
  R^((2))(n)=cases(
    0 & quad n<=0,
    q & quad n=1,
    (n-1)binom(n+q-2, q-2) & quad n>1.
  )
$
For a partition $λ$ with $k_i$ parts of each distinct size $r_i$, put
$
  w_k (λ)=product_(i=1)^s binom(R^((k))(r_i)+k_i-1, k_i),
  quad C_k (m)=sum_(λ tack.r m) w_k (λ).
$
The part sizes are positive and distinct, the multiplicities are positive, and
$m=sum_i r_i k_i$. The empty partition has weight $1$, so $C_k (0)=1$; set
$C_k (m)=0$ for $m<0$. A size with no available colours contributes zero unless
its multiplicity is zero. Then, for $k>=2$, #eq(
  $
    R^((k+1))(n)=cases(
      R^((k))(n) & quad n<n^((k)),
      R^((k))(n)+q C_k (n-1)-C_k (n) & quad n>=n^((k)).
    )
  $,
) <eq:solvable-rank-recurrence>
#keep-next[Here]
$
  n^((k))=cases(
    (2^(k+2)-1)/3 & quad q=2 " and " k in lr({0,2,4}),
    (2^(k+2)-2)/3 & quad q=2 " and " k in lr({1,3}),
    21 dot 2^(k-4) & quad q=2 " and " k>=5,
    2^k & quad q>=3.
  )
$
The coefficients $C_k (n-1)$ and $C_k (n)$ are the two partition sums in this
recursion.

The proof also suggests a proof of Witt's theorem and extensions to other
classes of groups. The associated graded Lie ring of a free solvable group is
the free solvable Lie ring of the same derived length (#bib-ref(
  "Shmelkin1964",
)). Thus we can count the regular words in its homogeneous basis.

#source(221, "209")
We use the basis of #bib-ref("Bokut1963"). A _word_ is a nonassociative word in
$x_1,dots,x_q$. Its weight is defined by $w(x_j)=1$ and
$w(A_1 A_2)=w(A_1)+w(A_2)$. Words of weight $1$ are called $R_0$-words. Having
defined $R_i$-words for $i<r$, define an $R_r$-word to be a left-associated word
$
  (A_1,dots,A_l)=((dots((A_1 A_2)A_3)dots)A_l), quad l>=2,
$
whose factors $A_1,dots,A_l$ are $R_(r-1)$-words.

Words of weight $1$ are _regular_, ordered by their subscripts. Inductively,
suppose the regular words of weight less than $n$ have been defined and ordered,
each belonging to some class $R_i$. The order has these properties:

1) If $A$ is a regular $R_i$-word, $B$ is a regular $R_j$-word and $i>j$, then
$A>B$.

2) Within one class $R_i$, greater weight means greater word. If the weights of
$A=A_1 A_2$ and $B=B_1 B_2$ are equal, compare their factors lexicographically:
$A>B$ if $A_1>B_1$, or if $A_1=B_1$ and $A_2>B_2$.

A word $C$ of weight $n$ is regular if $C=A B$, both factors are regular, $A>B$,
and, whenever $A=A_1 A_2$, one also has $B>=A_2$. Such a word belongs to a class
$R_i$. Extend the order to weight $n$ by the same two rules. This completes the
induction. In particular, a regular product $A B$ is greater than its right
factor $B$.

Let $α^k (n)$ count the regular $R_k$-words of weight $n$. Let $Φ(n,k)$ be the
set of nondecreasing sequences of total weight $n$ made from regular words of
classes $R_0,dots,R_(k-1)$. Equivalently, the sequences have the form #eq(
  mark: "a",
  $
    underbrace(A_(i_1)<=dots<=A_(i_(s_1)), R_0"-words")
    <underbrace(A_(j_1)<=dots<=A_(j_(s_2)), R_1"-words") \
    quad <dots<underbrace(A_(l_1)<=dots<=A_(l_(s_k)), R_(k-1)"-words").
  $,
) <eq:hall-word-order>
Any block may be absent. Put $φ^k (n)=abs(Φ(n,k))$; in particular, $φ^k (0)=1$,
from the empty sequence.

#lemma[
  _For $k>=1$ and $n>=1$,_
  #eq($α^k (n)=q φ^k (n-1)-φ^k (n).$) <eq:derived-word-count>
] <lem:derived-word-count>

#source(222, "210")
#proof[
  Prefix each sequence $A_1,dots,A_s$ in $Φ(n-1,k)$ by one of the $q$ letters.
  The resulting set $G(n,k)$ need not consist of ordered sequences, and #eq(
    $abs(G(n,k))=q abs(Φ(n-1,k)).$,
  ) <eq:hall-extension-count>
  We order each sequence by enclosing its initial terms in parentheses, as in
  the argument for Witt's theorem in #bib-ref("Hall1959"), §11.2. Start with the
  prefixed letter $B_0=x_j$. If $B_0<=A_1$, stop. Otherwise form
  $B_1=(B_0,A_1)$, a regular $R_1$-word.

  Continue in this way: stop when $B_i<=A_(i+1)$, leaving the ordered sequence
  $B_i,A_(i+1),dots,A_s$; otherwise form $B_(i+1)=(B_i,A_(i+1))$. Regularity
  follows from $A_i<=A_(i+1)$. If $B_i$ has class $R_l$, the next factor has
  class $R_(l-1)$ or $R_l$ whenever a bracket is formed. The new word then has
  class $R_l$ or $R_(l+1)$, respectively. If the end is reached, the output is
  the single word $B_s$. The empty initial sequence simply gives the prefixed
  letter.

  Let $overline(G)(n,k)$ be the set of outputs. The operation is reversible:
  unfold the leftmost branch of the first output word until its initial letter
  is reached, and put the peeled right factors before the untouched tail. The
  regularity inequalities put those factors in nondecreasing order. Thus #eq(
    $abs(overline(G)(n,k))=abs(G(n,k)).$,
  ) <eq:hall-reduction-count>
  Every sequence in $Φ(n,k)$ is obtained by this inverse construction. The
  remaining outputs are precisely the single regular $R_k$-words of weight $n$:
  once class $R_k$ is reached, all remaining factors have lower class, so the
  bracketing continues to the end. Conversely, unfolding an $R_k$-word leaves
  only lower-class right factors. Therefore
  $
    α^k (n)=abs(overline(G)(n,k))-abs(Φ(n,k))
    =q φ^k (n-1)-φ^k (n).
  $
]

#theorem[
  _Let_
  $
    R^((k))(n)=sum_(j=0)^(k-1) α^j (n)
  $
  _be the rank of the weight $n$ lower central factor of a free solvable group
  of derived length $k$ on $q>=2$ generators. For $k>=1$ and $n>=1$,_
  $α^k (n)=0$ _if $n<n^((k))$, and otherwise_ #eq(
    $
      α^k (n)=res_z (q z-1) product_(i=0)^(k-1)
      product_(j=1)^infinity (1-z^j)^(-α^i (j))z^(-n-1).
    $,
  ) <eq:derived-word-residue>
] <th:derived-word-residue>

#source(223, "211")
The initial values are
$
  R^((1))(n)=α^0 (n)=cases(0 & quad n!=1, q & quad n=1).
$
The number $n^((k))$ defined above is the minimum weight of a regular
$R_k$-word. A factor $(1-z^j)^(-α)$ equals $1$ when $α=0$. In particular, #eq(
  $
    R^((2))(n)=cases(
      0 & quad n<=0,
      q & quad n=1,
      (n-1)binom(n+q-2, q-2) & quad n>1,
    )
  $,
) <eq:metabelian-rank>
For $n<n^((k))$ the ranks $R^((k+1))(n)$ and $R^((k))(n)$ agree; for
$n>=n^((k))$, #eq(
  $
    R^((k+1))(n) & =R^((k))(n) \
                 & quad +res_z (q z-1) product_(j=1)^infinity
                   (1-z^j)^(-R^((k))(j))z^(-n-1).
  $,
) <eq:solvable-rank-residue>
Equivalently, for $n>=n^((k))$, #eq(
  $
    R^((k+1))(n) & =R^((k))(n)
                   +q sum_(λ tack.r n-1) product_(i=1)^s
                   binom(R^((k))(r_i)+k_i-1, k_i) \
                 & quad -sum_(λ tack.r n) product_(i=1)^s
                   binom(R^((k))(r_i)+k_i-1, k_i),
  $,
) <eq:solvable-rank-partitions>
where the parts and multiplicities belong to the partition $λ$ in the
corresponding sum. Below this threshold the ranks are unchanged. For $k>=2$,
this is @eq:solvable-rank-recurrence.

#proof[
  By @lem:derived-word-count, it remains to count the nondecreasing sequences in
  $Φ(n,k)$. For $k=1$, these are multisets of $n$ letters chosen from $q$ types:
  #eq($φ^1 (n)=binom(n+q-1, q-1), quad n>=0.$) <eq:hall-monomial-count>
  #source(224, "212")
  Substitution in @eq:derived-word-count proves @eq:metabelian-rank and the case
  $k=1$ of @eq:derived-word-residue. See also #bib-ref("Bachmuth1966"). For
  $k>1$, the choices of sequences from different classes are independent, so
  #eq(
    $φ^k (n)=res_z lr((product_(i=0)^(k-1) A_i (z)))z^(-n-1),$,
  ) <eq:hall-product-coefficient>
  #keep-next[where]
  $
    A_i (z)=sum_(n=0)^infinity δ^((i))(n)z^n,
  $
  and $δ^((i))(n)$ counts nondecreasing sequences of weight $n$ made from
  regular words of class $R_i$. There are $α^i (j)$ such words of weight $j$,
  each available with arbitrary multiplicity; hence
  $
    A_i (z)=product_(j=1)^infinity (1-z^j)^(-α^i (j)).
  $
  Together with @eq:derived-word-count, this proves @eq:derived-word-residue.
  Also,
  $
    product_(i=0)^(k-1) A_i (z)
    =product_(j=1)^infinity (1-z^j)^(-sum_(i=0)^(k-1) α^i (j))
    =product_(j=1)^infinity (1-z^j)^(-R^((k))(j)).
  $
  Since $α^k (n)=R^((k+1))(n)-R^((k))(n)$, we obtain @eq:solvable-rank-residue.
  Finally, expand each factor as
  $
    (1-z^j)^(-R^((k))(j))=sum_(l=0)^infinity
    binom(R^((k))(j)+l-1, l)z^(j l).
  $
  The constant term is $1$, including when $R^((k))(j)=0$. Taking the indicated
  coefficients yields the partition sums in @eq:solvable-rank-partitions. All
  these products are formal power series: only finitely many factors affect a
  fixed coefficient.
]
