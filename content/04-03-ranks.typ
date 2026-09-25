#import "statements.typ": lemma, proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(141, "129")
#heading(level: 3)[
  Ranks of the lower central factors of a free solvable group
] <sec:solvable-group-ranks>

Let $R_q^((3))(n)$ denote the rank of the factor of weight $n$ in the lower
central series of the free solvable group of derived length three on $q>=2$
generators. The main theorem of #bib-ref("Sokolov1969") gives #eq(
  $
    R_q^((3))(n)=cases(
      theta_q^((1))(n) & quad 1<=n<=3,
      theta_q^((1))(n)+theta_q^((2))(n) & quad n>=4,
    )
  $,
) <eq:solvable-third-rank>
#eq(
  $
    theta_q^((1))(n)=cases(
      0 & quad n<=0,
      q & quad n=1,
      (n-1)binom(n+q-2, q-2) & quad n>1,
    )
  $,
) <eq:metabelian-rank-count>
#eq(
  $
    theta_q^((2))(n) & =sum_(j=3)^(n-2)theta_q^((1))(j)
                       [psi(n-j, 2)-psi(n-j, j)] \
                     & quad +sum_(l=2)^(floor(n/2))sum_(i=2)^(floor(n/2))
                       (l-1)binom(theta_q^((1))(i)+l-2, l)psi(n-l i, i+1),
  $,
) <eq:solvable-second-component>
where $n>=4$ in the last formula.

#source(142, "130")
For $i>=1$, let $cal(P)(m,i)$ be the set of partitions of $m$ into parts at
least $i$. If $lambda$ has $k_j$ parts of size $i_j$, where the $i_j$ are
distinct, put
$
  theta_q^((i))(lambda)=product_(j=1)^s
  binom(theta_q^((1))(i_j)+k_j-1, k_j).
$
#block(sticky: true)[
  Thus $m=k_1 i_1+dots+k_s i_s$ and every $i_j>=i$. Define
]
#eq(
  $
    psi(m, i)=cases(
      sum_(lambda in cal(P)(m,i))theta_q^((i))(lambda) & quad m>=i,
      1 & quad m=0,
      0 & quad 0<m<i "or" m<0.
    )
  $,
) <eq:solvable-partition-function>
The weight counts partitions whose parts of size $j$ may have $theta_q^((1))(j)$
colours, with parts of the same size and colour indistinguishable.

#theorem[
  _Set $R_q^((3))(0)=0$. Then_
  #eq(
    $
      R_q^((3))(n)=cases(
        theta_q^((1))(n) & quad 0<=n<4,
        theta_q^((1))(n)+res_z (q z-1)
        product_(j=1)^n (1-z^j)^(-theta_q^((1))(j))z^(-n-1) & quad n>=4.
      )
    $,
  ) <eq:solvable-third-rank-residue>
  _The generating functions are_
  $
    R_(2)(w)=sum_(n=0)^infinity theta_q^((1))(n)w^n
    =1+q w+(1-w)^(-q)(q w-1),
  $
  #eq(
    $
      R_(3)(w) & =sum_(n=0)^infinity R_q^((3))(n)w^n \
               & =R_(2)(w)-sum_(n=0)^3 w^n res_z
                 (q z-1)exp(sum_(j=1)^3 frac(R_(2)(z^j), j))z^(-n-1) \
               & quad +(q w-1)exp(sum_(j=1)^infinity frac(R_(2)(w^j), j)),
    $,
  ) <eq:solvable-third-generating-function>
  _for $|w|<1$, and also as formal power series. The subscript in $R_2$ and
  $R_3$ refers to the derived length; $q$ remains fixed._
] <th:solvable-third-rank-residue>

We prove the theorem through five lemmas, finding residue representations
successively for the quantities in
@eq:solvable-third-rank–@eq:solvable-partition-function. Summation and
cancellation then reduce the original expressions to
@eq:solvable-third-rank-residue.

#source(143, "131")
#lemma[
  #eq(
    $
      theta_q^((1))(n)=res_w
      [1+q w+(1-w)^(-q)(q w-1)]w^(-n-1), quad n>=0.
    $,
  ) <eq:metabelian-generating-residue>
] <lem:metabelian-generating-residue>

#lemma[
  _For $j>=1$,_
  #eq(
    $
      psi(m, j)=res_z product_(i=j)^infinity
      (1-z^i)^(-theta_q^((1))(i))z^(-m-1).
    $,
  ) <eq:solvable-partition-residue>
  #block(sticky: true)[
    The first identity follows from the binomial series and
    @eq:metabelian-rank-count. The second follows by expanding each factor and
    comparing with @eq:solvable-partition-function. Only finitely many factors
    contribute to any fixed coefficient. For convenience, write
  ]
  $ P_(j)(z)=product_(i=j)^infinity (1-z^i)^(-theta_q^((1))(i)). $
] <lem:solvable-partition-residue>

#lemma[
  _For $n>=0$,_
  #eq(
    $
      S_1 & =sum_(j=0)^n theta_q^((1))(j)psi(n-j, 2) \
          & =psi(n, 2)+q psi(n-1, 2)+q psi(n-1, 1)-psi(n, 1).
    $,
  ) <eq:solvable-convolution-reduction>
] <lem:solvable-convolution-reduction>

#proof[
  By the preceding lemmas and the substitution rule,
  $
    S_1 & =sum_(j=0)^n
          lr((res_w R_(2)(w)w^(-j-1)))lr((res_z P_(2)(z)z^(-n+j-1))) \
        & =res_z P_(2)(z)z^(-n-1)
          sum_(j=0)^infinity z^j res_w R_(2)(w)w^(-j-1) \
        & =res_z [1+q z+(1-z)^(-q)(q z-1)]P_(2)(z)z^(-n-1).
  $
  Since $theta_q^((1))(1)=q$, we have $P_(1)(z)=(1-z)^(-q)P_(2)(z)$. Applying
  @eq:solvable-partition-residue proves @eq:solvable-convolution-reduction.
]

#lemma[
  _For $n>=0$ and $i>=2$,_
  $
    S_(2)(i) & =sum_(l=0)^(floor(n/2))
               binom(theta_q^((1))(i)+l-2, l)(l-1)psi(n-l i, i+1) \
             & =theta_q^((1))(i)psi(n-i, i)-psi(n, i).
  $
  At $l=0$ the summand is $-psi(n, i+1)$, including when $theta_q^((1))(i)=1$.
] <lem:weighted-solvable-partitions>

#source(144, "132")
#proof[
  For $alpha>=1$ and $l>=0$, using the polynomial binomial convention at $l=0$,
  $
    (l-1)binom(alpha+l-2, l)=res_w
    (1-w)^(-alpha)(alpha w-1)w^(-l-1).
  $
  #block(sticky: true)[
    Put $alpha=theta_q^((1))(i)$. By Lemma #text(weight: "semibold")[4.3.2] and
    the substitution rule,
  ]
  $
    S_(2)(i) & =sum_(l=0)^(floor(n/2))
               lr((res_z P_(i+1)(z)z^(-n+l i-1))) \
             & quad times lr((res_w (1-w)^(-alpha)(alpha w-1)w^(-l-1))) \
             & =res_z P_(i+1)(z)z^(-n-1)
               sum_(l=0)^infinity z^(i l)
               res_w (1-w)^(-alpha)(alpha w-1)w^(-l-1) \
             & =res_z P_(i+1)(z)(1-z^i)^(-alpha)
               (alpha z^i-1)z^(-n-1) \
             & =theta_q^((1))(i)psi(n-i, i)-psi(n, i).
  $
  The extension in $l$ is valid because $i>=2$ and all the extra coefficients
  have negative index.
]

#lemma[
  _For $n>=4$,_
  $ theta_q^((2))(n)=q psi(n-1, 1)-psi(n, 1). $
] <lem:solvable-component-cancellation>

#proof[
  Put $h=floor(n/2)$. In the first sum of @eq:solvable-second-component, extend
  the convolution with $psi(n-j, 2)$ to $j=0,dots,n$. The new nonzero terms are
  $q psi(n-1, 2)$, $theta_q^((1))(2)psi(n-2, 2)$ and $theta_q^((1))(n)$. In the
  second sum add the $l=0$ term; the $l=1$ term vanishes. Combining these
  changes gives #eq(
    $
      theta_q^((2))(n) & =S_1-q psi(n-1, 2)-theta_q^((1))(n) \
                       & quad -sum_(j=2)^h theta_q^((1))(j)psi(n-j, j)
                         +sum_(i=2)^h S_(2)(i)+sum_(i=2)^h psi(n, i+1).
    $,
  ) <eq:solvable-component-decomposition>
  Substitute Lemmas #text(weight: "semibold")[4.3.3] and #text(
    weight: "semibold",
  )[4.3.4]. The sums telescope, leaving
  $
    theta_q^((2))(n)=q psi(n-1, 1)-psi(n, 1)
    -theta_q^((1))(n)+psi(n, h+1).
  $
  A partition of $n$ with every part greater than $n/2$ has just one part, $n$.
  Consequently $psi(n, h+1)=theta_q^((1))(n)$, proving the lemma.

  #source(145, "133")
  #block(sticky: true)[
    Lemma #text(weight: "semibold")[4.3.5], together with
    @eq:solvable-third-rank and @eq:solvable-partition-residue, gives
    @eq:solvable-third-rank-residue. To obtain
    @eq:solvable-third-generating-function, use
  ]
  $
    product_(j=1)^infinity (1-w^j)^(-theta_q^((1))(j))
    & =exp(-sum_(j=1)^infinity theta_q^((1))(j)ln(1-w^j)) \
    & =exp(
      sum_(r=1)^infinity sum_(j=1)^infinity
      theta_q^((1))(j)w^(r j)/r
    ) \
    & =exp(sum_(r=1)^infinity frac(R_(2)(w^r), r)).
  $
  The exponents $theta_q^((1))(j)$ grow polynomially in $j$, so these expansions
  converge absolutely and locally uniformly for $|w|<1$. They are also valid
  coefficientwise. The finite subtraction in
  @eq:solvable-third-generating-function removes degrees zero through three;
  terms with $j>3$ cannot affect those degrees. This proves the theorem.
]
