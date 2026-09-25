#import "statements.typ": proof, theorem
#import "main-defs.typ": bib-ref, eq, source

#source(113, "101")
#block(breakable: false)[
  #heading(level: 2)[
    Determination of Multidimensional Analogues of Pairs of Inverse Relations in
    Combinatorial Analysis
  ] <sec:multivariate-inversion>

  We illustrate a method for constructing multidimensional analogues of known
  inverse pairs by two examples. First, integral representations give mutually
  inverse functional relations between the generating functions
  $A(w)=sum_(m>=0)a_m w^m$ and $B(w)=sum_(m>=0)b_m w^m$ of the original
  sequences. We then write functional relations of the same type in $n$
  variables, requiring that they reduce to the original relations when $n=1$.
  Such a generalization need not be unique. Finally, the rules for $op("res")$
  yield relations between the coefficients, solving the problem.#footnote[
    Approaches to multidimensional analogues of known combinatorial relations
    from somewhat different points of view are developed in #bib-ref(
      "Mohanty1970",
      "Mohanty1969",
      "Handa1969",
      "Gould1956",
    ). In using integral representations, we are primarily interested in the
    type of functional relations corresponding to the inverse pairs, and hence
    in the type of generating functions and the operations on them. In this book
    we confine ourselves to the algebra of power series.
  ]
]

We first find a multidimensional analogue of the Legendre–Chebyshev pair
@eq:row-binomial-inverse-pair: #eq(
  $
    a_m & =sum_(k=0)^m binom(c m+p, m-k)b_k, \
    b_m & =sum_(k=0)^m (-1)^(m+k)binom(m+p-1+c k-k, m-k)
          frac(p+c m, p+c k)a_k, quad m>=0.
  $,
) <eq:univariate-row-inversion>
Here $c$ is a nonzero integer and $p$ a nonnegative integer. Let
$m=(m_1,dots,m_n)$, let $c_1,dots,c_n$ be nonzero integers, and let
$p,p_1,dots,p_n$ be nonnegative integers. All multi-index sums below run over
$0<=k<=m$ coordinatewise. Put $d=m-k$ and $|d|=sum_i d_i$. We use
$
  binom(a, d_1, dots, d_n)=frac(a(a-1)dots(a-|d|+1), d_1! dots d_n!).
$
As before, products containing a rational factor are interpreted by polynomial
continuation at removable singularities; diagonal coefficients are $1$.

#theorem(suffix: [])[
  #bib-ref("Egorychev1975c"). The following multidimensional systems are pairs
  of inverse relations:

  #eq(
    $
      a_m & =sum_(0<=k<=m)b_k binom(p+sum_i c_i m_i, d_1, dots, d_n), \
      b_m & =sum_(0<=k<=m)a_k (-1)^(|d|)
            binom(p+sum_i (m_i+c_i k_i-k_i)-1, d_1, dots, d_n) \
          & quad times frac(p+sum_i c_i m_i, p+sum_i c_i k_i);
    $,
  ) <eq:multinomial-row-inversion>
  #source(114, "102")
  #eq(
    $
      a_m & =sum_(0<=k<=m)b_k product_(j=1)^n binom(p_j+c_j m_j, d_j), \
      b_m & =sum_(0<=k<=m)a_k (-1)^(|d|)
            product_(j=1)^n lr(
              (binom(p_j+c_j k_j+d_j-1, d_j)
                frac(p_j+c_j m_j, p_j+c_j k_j))
            ).
    $,
  ) <eq:product-row-inversion>
  Both reduce to @eq:univariate-row-inversion when $n=1$.
] <th:multinomial-row-inversion>

#proof[
  Repeating the calculation in part 4 of @th:classical-inverse-pairs, we obtain
  #eq(
    $
      A(w(1+w)^(-c)) & =B(w)frac((1+w)^(p+1), 1+w-c w), \
                B(w) & =A(w(1+w)^(-c))(1+w)^(-p-1)(1+w-c w).
    $,
  ) <eq:univariate-row-functional>
  These functional relations correspond to @eq:univariate-row-inversion. Put
  $s=1+sum_i w_i$ and $T_(j)(w)=w_j s^(-c_j)$. One multidimensional analogue is
  #eq(
    $
      A(T(w)) & =B(w)frac(s^(p+1), 1+sum_i (1-c_i)w_i), \
         B(w) & =A(T(w))s^(-p-1)lr((1+sum_i (1-c_i)w_i)).
    $,
  ) <eq:multinomial-row-functional>
  Another uses $U_(j)(w)=w_(j)(1+w_j)^(-c_j)$: #eq(
    $
      A(U(w)) & =B(w)product_(j=1)^n
                (1+w_j)^(p_j)lr((1-frac(c_j w_j, 1+w_j)))^(-1), \
         B(w) & =A(U(w))product_(j=1)^n
                (1+w_j)^(-p_j)lr((1-frac(c_j w_j, 1+w_j))).
    $,
  ) <eq:product-row-functional>
  All powers have constant term $1$, and the substitutions have identity linear
  part. They therefore have unique formal inverses through the origin.

  Extracting coefficients and using the change-of-variables rule gives
  @eq:multinomial-row-inversion and @eq:product-row-inversion. Explicitly,
  $
    det D T(w)=s^(-sum_j c_j-1)lr((s-sum_i c_i w_i)).
  $
  In the extraction of $a_m$, this Jacobian cancels the denominator in
  @eq:multinomial-row-functional, leaving $[w^d]s^(p+sum_i c_i m_i)$. For the
  inverse coefficient, put $P=p+sum_i c_i k_i$. Direct extraction from the
  second relation in @eq:multinomial-row-functional gives
  $
    (-1)^(|d|)lr(
      (
        binom(P+|d|, d_1, dots, d_n)
        +sum_i (c_i-1)binom(P+|d|-1, d_1, dots, d_i-1, dots, d_n)
      )
    ).
  $
  A multinomial coefficient with a negative lower index is $0$. Simplifying this
  polynomial yields the inverse coefficient in @eq:multinomial-row-inversion,
  including its removable parameter values. The independent-coordinate
  substitution in @eq:product-row-functional gives the product of the scalar
  coefficients in @eq:univariate-row-inversion, which proves
  @eq:product-row-inversion.

  #source(115, "103")
  The same method gives the following multidimensional analogues of the Gould
  pair @eq:shifted-binomial-inverse-pair (#bib-ref("Bourbaki1950")): #eq(
    $
      a_m & =sum_(0<=k<=m)b_k
            binom(p+sum_i k_(i)(q_i-1), d_1, dots, d_n), \
      b_m & =sum_(0<=k<=m)a_k (-1)^(|d|)
            binom(p+sum_i (q_i m_i-k_i), d_1, dots, d_n) \
          & quad times frac(p+sum_i k_(i)(q_i-1), p+sum_i (q_i m_i-k_i));
    $,
  ) <eq:multinomial-column-inversion>
  #eq(
    $
      a_m & =sum_(0<=k<=m)b_k product_(j=1)^n
            binom(p_j+(q_j-1)k_j, d_j), \
      b_m & =sum_(0<=k<=m)a_k product_(j=1)^n lr(
              (
                (-1)^(d_j)binom(p_j+m_j q_j-k_j, d_j)
                frac(p_j+k_(j)(q_j-1), p_j+m_j q_j-k_j)
              )
            ).
    $,
  ) <eq:product-column-inversion>
  Here the parameters may be complex, with the same convention at removable
  singularities. These pairs correspond to the following functional relations.
  For $F_(j)(w)=w_j s^(q_j-1)$, #eq(
    $
      A(w) & =s^p B(F(w)), \
      B(z) & =lr([s^(-p)A(w)])_(w=F^(-1)(z));
    $,
  ) <eq:multinomial-column-functional>
  #block(sticky: true)[
    and for $G_(j)(w)=w_(j)(1+w_j)^(q_j-1)$,
  ]
  #eq(
    $
      A(w) & =B(G(w))product_(j=1)^n (1+w_j)^(p_j), \
      B(z) & =lr([A(w)product_(j=1)^n (1+w_j)^(-p_j)])_(w=G^(-1)(z)).
    $,
  ) <eq:product-column-functional>
  The inverses again fix the origin. The forward coefficients follow by the
  multinomial theorem. For the inverse coefficients in
  @eq:multinomial-column-inversion, use
  $
    det D F(w)=s^(sum_j (q_j-1)-1)lr((1+sum_i q_i w_i)).
  $
  Writing $P=p+sum_i (q_i m_i-k_i)$, the resulting coefficient is
  $
    (-1)^(|d|)lr(
      (
        binom(P, d_1, dots, d_n)
        -sum_i q_i binom(P-1, d_1, dots, d_i-1, dots, d_n)
      )
    ).
  $
  This simplifies to the displayed ratio. Formula @eq:product-column-inversion
  follows coordinate by coordinate.

  Finally, @eq:shifted-binomial-functional-pair and
  @eq:product-column-functional allow partial inversion of the Gould relations
  @eq:shifted-binomial-inverse-pair and @eq:product-column-inversion.
  Multiplication by the reciprocal prefactors and coefficient extraction give
  #eq(
    $
      & sum_(k=0)^m (-1)^(m-k)binom(p+m-k-1, m-k)a_k \
      & quad =sum_(k=0)^m binom(k(q-1), m-k)b_k, quad m>=0,
    $,
  ) <eq:univariate-convolution-inversion>
  #source(116, "104")
  and #eq(
    $
      & sum_(0<=k<=m)a_k (-1)^(|d|)product_(j=1)^n binom(p_j+d_j-1, d_j) \
      & quad =sum_(0<=k<=m)b_k product_(j=1)^n binom(k_(j)(q_j-1), d_j),
        quad m>=0.
    $,
  ) <eq:product-convolution-inversion>
]
