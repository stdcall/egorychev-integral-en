#import "main-defs.typ": eq, res, source
#import "statements.typ": proof
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note

#source(43, "31")
#heading(level: 2)[
  The method of generating functions in the Cauchy algebra of formal power
  series
] <sec:generating-function-operations>

When using generating functions to solve analytic problems, one usually
encounters one of two related questions.

a) A generating function $C(w)$ is expressed in terms of generating functions
$A(w)$, $B(w)$, … by operations in the Cauchy algebra of power series. Find the
coefficients of $C(w)$.

b) Relations among the terms of numerical sequences $lr({a_n})$, $lr({b_n})$,
$lr({c_n})$, … are given. Find the corresponding relation, if any, among their
generating functions $A(w)$, $B(w)$, $C(w)$, … in the Cauchy algebra of power
series.

We solve these questions using the properties of $res$ in §@sec:residue-rules
and the algorithm of §@sec:computation-algorithm, when $C(w)$ is obtained from
$A(w)$ #source(44, "32")and $B(w)$ by multiplication, division, composition or
compositional inversion in one variable. We also solve a simple recurrence.
These arguments explain both the computations in this book and the connection
between generating functions and integral representations.

#proof(title: [Proof. The product operation])[
  If $C(w)=A(w)B(w)$, then #eq(
    $
      c_n=res_w C(w)w^(-n-1)=res_w A(w)B(w)w^(-n-1) \
      =res_w (sum_(k=0)^n a_k w^k)(sum_(k=0)^n b_k w^k)w^(-n-1) \
      =sum_(k=0)^n a_k b_(n-k), quad n=0,1,dots.
    $,
  ) <eq:product-coefficients>
  #block(sticky: true)[Conversely, if @eq:product-coefficients is given, then]
  $
    c_n=sum_(k=0)^n a_k b_(n-k)
    =sum_(k=0)^n (res_v A(v)v^(-k-1))(res_w B(w)w^(-n+k-1)) \
    =res_w B(w)w^(-n-1)(sum_(k=0)^n w^k res_v A(v)v^(-k-1)) \
    =res_w B(w)w^(-n-1)(sum_(k=0)^infinity w^k res_v A(v)v^(-k-1)) \
    =res_w B(w)A(w)w^(-n-1), quad n=0,1,dots,
  $
  or $C(w)=A(w)B(w)$. The terms added when extending the sum to infinity cannot
  contribute to the coefficient of $w^n$.

  *The division operation.* If $C(w)=A^(-1)(w)$ and $A(w) in R_0$, then
  $
    c_n=res_w C(w)w^(-n-1)=res_w A^(-1)(w)w^(-n-1) \
    =a_0^(-1)res_w (1+sum_(k=1)^n a_k/a_0 w^k)^(-1)w^(-n-1),
    quad n=0,1,dots,
  $
  and hence #eq(
    $
      c_n=a_0^(-1) sum_(k_1+2k_2+dots+n k_n=n)
      binom(k_1+dots+k_n, k_1, dots, k_n)
      product_(i=1)^n (-a_i/a_0)^(k_i).
    $,
  ) <eq:reciprocal-coefficients>
  Here all $k_i$ are nonnegative integers. The last step uses the multinomial
  expansion of the negative power; empty sums and products have their usual
  values, so $c_0=a_0^(-1)$.

  #source(45, "33")
  #keep-next[
    Conversely, suppose @eq:reciprocal-coefficients is given. With the same
    constraint on the first sum, we have
  ]
  $
    c_n=a_0^(-1) sum product_(i=1)^n (-a_i/a_0)^(k_i) \
    quad times res_(z_1 dots z_n)
    (1-sum_(i=1)^n z_i)^(-1) product_(i=1)^n z_i^(-k_i-1) \
    =a_0^(-1) sum_(k_1,dots,k_n=0)^infinity
    product_(i=1)^n (-a_i/a_0)^(k_i) \
    quad times res_(z_1 dots z_n w)
    (1-sum_(i=1)^n z_i w^i)^(-1)
    (product_(i=1)^n z_i^(-k_i-1))w^(-n-1).
  $
  The weight variable $w$ enforces the constraint $k_1+2k_2+dots+n k_n=n$. For
  each fixed coefficient of $w$, only finitely many terms contribute. Applying
  @rule:residue-substitution successively to the $n$ auxiliary variables gives,
  for $n>=1$,
  $
    c_n=a_0^(-1) sum_(k_1,dots,k_(n-1)=0)^infinity
    product_(i=1)^(n-1) (-a_i/a_0)^(k_i) \
    quad times res_(z_1 dots z_(n-1) w)
    (1-sum_(i=1)^(n-1) z_i w^i+a_n/a_0 w^n)^(-1) \
    quad times (product_(i=1)^(n-1) z_i^(-k_i-1))w^(-n-1) \
    =dots=a_0^(-1)res_(w)(1+sum_(i=1)^n a_i/a_0 w^i)^(-1)w^(-n-1) \
    =res_w A^(-1)(w)w^(-n-1).
  $
  Together with $c_0=a_0^(-1)$, this proves $C(w)=A^(-1)(w)$.

  *The substitution operation.* Let $C(w)=A(B(w))$, with $B(w) in R$. First
  suppose that $b_1!=0$. Then
  $
    c_n=res_w A(B(w))w^(-n-1) \
    =res_w sum_(k=0)^n a_(k)(sum_(i=1)^n b_i w^i)^k w^(-n-1) \
    =sum_(k=0)^n a_k b_1^k res_w
    (1+sum_(i=2)^n b_i b_1^(-1)w^(i-1))^k w^(-n+k-1),
  $
  #keep-next[
    and therefore
  ]
  #eq(
    $
      c_n=sum_(k=0)^n a_k b_1^k
      sum_(k_2+dots+(n-1)k_n=n-k)
      binom(k, k_2, dots, k_n) \
      quad times product_(i=2)^n (b_i/b_1)^(k_i),
      quad n=0,1,dots.
    $,
  ) <eq:composition-coefficients>
  #block(breakable: false)[
    The inner indices are nonnegative integers, and the multinomial coefficient
    is zero if $k_2+dots+k_n>k$. The same method applies when
    $
      B(w)=sum_(n=r)^infinity b_n w^n, quad b_r!=0, quad r>1:
    $
    factor out $b_r w^r$ and use the corresponding weights. If $B=0$, then
    $C(w)=a_0$.
  ]

  #source(46, "34")
  Conversely, suppose @eq:composition-coefficients is given. For $n>=2$,
  introducing the weight variable and eliminating the auxiliary variables gives
  $
    c_n=sum_(k=0)^n a_k b_1^k
    sum_(k_2,dots,k_n=0)^infinity
    (product_(i=2)^n (b_i/b_1)^(k_i)) \
    quad times res_(z_2 dots z_n w)
    (1+sum_(i=2)^n z_i w^(i-1))^k
    w^(-n+k-1) product_(i=2)^n z_i^(-k_i-1) \
    =sum_(k=0)^n a_k b_1^k
    sum_(k_2,dots,k_(n-1)=0)^infinity
    (product_(i=2)^(n-1) (b_i/b_1)^(k_i)) \
    quad times res_(z_2 dots z_(n-1) w)
    (1+sum_(i=2)^(n-1) z_i w^(i-1)+b_n/b_1 w^(n-1))^k \
    quad times (product_(i=2)^(n-1) z_i^(-k_i-1))w^(-n+k-1).
  $
  Continuing the substitutions, we obtain
  $
    c_n=sum_(k=0)^n a_k b_1^k res_w
    (1+sum_(i=2)^n b_i/b_1 w^(i-1))^k w^(-n+k-1) \
    =sum_(k=0)^infinity a_k res_w B^(k)(w)w^(-n-1)
    =res_w (sum_(k=0)^infinity a_k B^(k)(w))w^(-n-1) \
    =res_w A(B(w))w^(-n-1).
  $
  The cases $n=0,1$ give $c_0=a_0$ and $c_1=a_1 b_1$ directly. Thus
  $C(w)=A(B(w))$.

  *The inversion operation.* Let $C(w)=sum_(n=1)^infinity c_n w^n in R$ be the
  compositional inverse of
  $
    w=z phi(z)=sum_(n=1)^infinity a_n z^n, quad a_1!=0.
  $
  #block(sticky: true)[By formula @eq:inverse-substitution-univariate in
    @rule:inverse-substitution-univariate,]
  $
    c_n=1/n res_w phi^(-n)(w)w^(-n)
    =1/n res_(w)(a_1+sum_(i=2)^n a_i w^(i-1))^(-n)w^(-n) \
    =a_1^(-n)/n res_(w)(1+sum_(i=2)^n a_i/a_1 w^(i-1))^(-n)w^(-n),
  $
  or, finally, #eq(
    $
      c_n=a_1^(-n)/n sum_(k_2+dots+(n-1)k_n=n-1)
      binom(n+k_2+dots+k_n-1, k_2, dots, k_n) \
      quad times product_(i=2)^n (-a_i/a_1)^(k_i),
      quad n=1,2,dots,
    $,
  ) <eq:inverse-coefficients>
  where again all inner indices are nonnegative integers.

  #source(47, "35")
  Conversely, if @eq:inverse-coefficients is given, the same calculation yields,
  for $n>=2$,
  $
    c_n=a_1^(-n)/n sum_(k_2,dots,k_n=0)^infinity
    (product_(i=2)^n (-a_i/a_1)^(k_i)) \
    quad times res_(z_2 dots z_n w)
    lr(
      {(1-sum_(i=2)^n z_i w^(i-1))^(-n)
        w^(-n) product_(i=2)^n z_i^(-k_i-1)}
    ) \
    =a_1^(-n)/n sum_(k_2,dots,k_(n-1)=0)^infinity
    (product_(i=2)^(n-1) (-a_i/a_1)^(k_i)) \
    quad times res_(z_2 dots z_(n-1) w)
    lr(
      {(1-sum_(i=2)^(n-1) z_i w^(i-1)+a_n/a_1 w^(n-1))^(-n) \
        quad times w^(-n) product_(i=2)^(n-1) z_i^(-k_i-1)}
    ).
  $
  #keep-next[
    Eliminating the remaining auxiliary variables gives
  ]
  $
    c_n=a_1^(-n)/n res_(w)(1+sum_(i=2)^n a_i/a_1 w^(i-1))^(-n)w^(-n) \
    =1/n res_w phi^(-n)(w)w^(-n),
  $
  where $phi(w)=a_1+a_2 w+dots+a_n w^(n-1)+dots$. For $n=1$ the formula gives
  $c_1=a_1^(-1)$. This completes the converse.

  #block(breakable: false)[
    Addition is immediate and has therefore been omitted. The same method
    extends to several variables under the corresponding hypotheses of
    §@sec:residue-rules.
    #footnote[
      The reader is encouraged to work through the arguments of this section in
      the multidimensional case.
    ]
  ]
]
