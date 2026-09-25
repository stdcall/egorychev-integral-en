#import "statements.typ": example, proof, remark, theorem
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, res, source

#source(70, "58")
#example(title: [], suffix: [*. The number of $T(n,K)$-invariant subgroups of
the unitriangular group $op("UT")(n,K)$.*])[
  In #bib-ref("Levchuk1974"), the subgroups of the unitriangular group
  $op("UT")(n,K)$ over a division ring $K$ that are invariant under conjugation
  by $T(n,K)$ are described. Here $T(n,K)$ is the group of all nonsingular
  triangular $n times n$ matrices over $K$. When $abs(K)>2$, these subgroups
  have a purely geometric characterization. Their number is given by the
  following theorem.
] <ex:unitriangular-subgroups>

#theorem[
  _For a positive integer $n$ and a division ring $K$ with $abs(K)>2$, the
  number $P(n)$ of all $T(n,K)$-invariant subgroups of $op("UT")(n,K)$ is_
  #eq($P(n)=frac(1, n)binom(2n, n-1).$) <eq:partition-subgroup-count>
] <th:partition-subgroup-count>

#proof[
  By #bib-ref("Levchuk1974"), Corollary 4.3, #eq(
    $P(n)=1+sum_(r=1)^(n-1) B(r,n),$,
  ) <eq:partition-refinement-count>
  #block(sticky: true)[
    where, for $1<=r<=n-1$, $B(r,n)$ counts the pairs of sequences of positive
    integers satisfying
  ]
  #eq(
    $
      0<j_1<dots<j_r<n, quad 0<i_1<dots<i_r<n, \
      j_1<=i_1, quad j_2<=i_2, dots, j_r<=i_r.
    $,
  ) <eq:partition-index-constraints>
  #block(sticky: true)[We claim that]
  #eq(
    $
      B(r,n)=sum_(i=r)^(2r) binom(n-1, i)binom(i, 2r-i)Phi(i-r, i-r),
    $,
  ) <eq:partition-refinement-sum>
  where $Phi(m, m)$ counts lattice paths from $(0,0)$ to $(m,m)$, with unit
  steps to the right or upwards, which never rise above the main diagonal.

  Indeed, let $A={j_1,dots,j_r}$ and $B={i_1,dots,i_r}$ satisfy
  @eq:partition-index-constraints, and put $C=A union B$ and $D=A ∩ B$. If
  $abs(C)=i$, then $r<=i<=2r$ and $abs(D)=2r-i$. The symmetric difference has
  $m=2i-2r$ elements, with $i-r$ in each of $A$ and $B$.

  For a fixed $i$, there are $binom(n-1, i)$ choices of the union $C$ and
  $binom(i, 2r-i)$ choices of its subset $D$. It remains to partition the
  $2i-2r$ elements of $C without D$ between $A without B$ and $B without A$,
  with $i-r$ in each, subject to @eq:partition-index-constraints.

  Arrange these remaining elements as $l_1<dots<l_(2i-2r)$. For $i>r$, the first
  element belongs to $A$, so take a step from $(0,0)$ to $(1,0)$.
  #source(71, "59")
  If $l_2$ belongs to $A$, the next step ends at $(2,0)$; if it belongs to $B$,
  the next step ends at $(1,1)$. Continue with a right step for an element of
  $A$ and an upward step for an element of $B$. Condition
  @eq:partition-index-constraints is equivalent to the path staying on or below
  the diagonal. This construction is reversible. When $i=r$, use the unique
  empty path.

  The number of these paths is (#bib-ref("Feller1968"), Chapter III, §9, (9.1))
  $
    Phi(i-r, i-r)=frac(1, i-r+1)binom(2i-2r, i-r).
  $
  Substitute this expression in @eq:partition-refinement-sum, cancel factorials,
  and apply the substitution rule:
  $
    B(r,n) & =frac(1, n)binom(n, r+1)
             sum_(i=r)^(2r)binom(n-1-r, i-r)binom(r+1, 2r-i) \
           & =frac(1, n)binom(n, r+1)sum_(i=0)^infinity res_(u v)
             frac((1+u)^(n-1-r)(1+v)^(r+1), u^(i-r+1)v^(2r-i+1)) \
           & =frac(1, n)binom(n, r+1)res_v
             frac((1+v)^(n-1-r)v^(r)(1+v)^(r+1), v^(2r+1)) \
           & =frac(1, n)binom(n, r+1)binom(n, r).
  $
  The extension to an infinite sum adds only zero coefficients. Thus #eq(
    $
      B(r,n)=frac(1, n)binom(n, r+1)binom(n, r).
    $,
  ) <eq:partition-refinement-value>
  #block(sticky: true)[
    Substituting this in @eq:partition-refinement-count gives
    @eq:partition-subgroup-count by summation. Indeed, the missing $r=0$ term
    equals $1$, and Vandermonde's convolution gives
  ]
  $
    P(n)=frac(1, n)sum_(r=0)^(n-1)binom(n, r+1)binom(n, r)
    =frac(1, n)binom(2n, n-1).
  $
]

#remark[
  Once the closed forms @eq:partition-subgroup-count and
  @eq:partition-refinement-value for $P(n)$ and $B(r,n)$#editorial-note(
    "subgroup-paths",
  )[
    Here $B(r,n)=N(n,r+1)$ in the usual Narayana notation; see #cite(
      <Stanley2015>,
      supplement: [Problem A46(a), pp. 124–125],
    ). For $Phi$, see also #cite(
      <Krattenthaler2015>,
      supplement: [Corollary 10.3.2],
    ).
  ] have been found, they can also be proved combinatorially; this is left to
  the reader. This typical situation illustrates the role of analytic,
  “secondary” methods in solving enumeration problems.
]
