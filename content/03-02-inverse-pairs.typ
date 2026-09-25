#import "statements.typ": corollary, proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#block(breakable: false)[
  #heading(level: 3)[
    One-dimensional inverse relations of Abel, Gould, Chebyshev and Legendre
    types
  ] <sec:classical-inverse-pairs>

  We now show that $F_1^1$ includes a number of inverse pairs from the tables in
  #bib-ref("Riordan1968") that frequently occur in combinatorial
  analysis.#footnote[
    In #bib-ref("Riordan1968"), the Blissard symbolic calculus and formal power
    series are used systematically to invert relations of these types. The
    Bürmann–Lagrange series is used only occasionally, both there and in other
    sources (see, for example, #bib-ref("Skalsky1967")). Formal power series are
    sometimes used for relations such as $A(w)=B(1+w)$ and $B(z)=A(z-1)$,
    although in general these substitutions require convergence. In such cases
    we use contour integrals.
  ] The remaining inverse pairs in those tables are left to the problems.
]

#source(105, "93")
Unless stated otherwise, all relations hold for $m=0,1,dots$, and all sums below
run from $k=0$ to $m$. In @eq:lacunary-inverse-pair, $r$ is a positive integer
and the upper limit is $floor(m/r)$. Elsewhere $p,q,r,alpha$ may be complex.
Apparent singularities in products of binomial coefficients and rational factors
are interpreted by polynomial continuation. Diagonal coefficients are $1$,
including the Abel expressions with exponent $-1$.

*1. The simplest inverse relations* (#bib-ref("Riordan1968"), Table 2.1, class
4): #eq(
  $
    a_m=sum_k binom(m+p, m-k)b_k, quad
    b_m=sum_k (-1)^(m-k)binom(m+p, m-k)a_k.
  $,
) <eq:binomial-inverse-pair>

*2. Ordinary Gould inverse relations* (#bib-ref("Riordan1968"), Table 2.2,
classes 1 and 2): #eq(
  $
    a_m & =sum_k binom(p+q k-k, m-k)b_k, \
    b_m & =sum_k (-1)^(m-k)binom(p+q m-k, m-k)
          frac(p+q k-k, p+q m-k)a_k;
  $,
) <eq:shifted-binomial-inverse-pair>
#eq(
  $
    a_m & =sum_k lr(
            (binom(p+q k-k, m-k)
              +q binom(p+q k-k, m-1-k))
          )b_k, \
    b_m & =sum_k (-1)^(m-k)binom(q m+p-k, m-k)a_k.
  $,
) <eq:weighted-binomial-inverse-pair>

*3. Chebyshev inverse relations* (#bib-ref("Riordan1968"), Table 2.4, class 1):
#eq(
  $
    a_m & =sum_(k=0)^(floor(m/r))binom(m, k)b_(m-r k), \
    b_m & =sum_(k=0)^(floor(m/r))(-1)^k binom(m-r k+k, k)
          frac(m, m-r k+k)a_(m-r k).
  $,
) <eq:lacunary-inverse-pair>

*4. Legendre–Chebyshev inverse relations* (#bib-ref("Riordan1968"), Table 2.6,
classes 1 and 7): #eq(
  $
    a_m & =sum_k binom(r m+p, m-k)b_k, \
    b_m & =sum_k (-1)^(m-k)binom(m+p-1+k r-k, m-k)
          frac(p+r m, p+r k)a_k;
  $,
) <eq:row-binomial-inverse-pair>
#eq(
  $
    a_m & =sum_k lr(
            (binom(p+r k, m-k)
              +(r+1)binom(p+r k, m-1-k))
          )b_k, \
    b_m & =sum_k (-1)^(m-k)binom(m+r m+p-k, m-k)a_k.
  $,
) <eq:column-binomial-inverse-pair>

*5. Abel inverse relations* (#bib-ref("Riordan1968"), Table 3.1, class 3a and
relation (1)): #eq(
  $
    a_m & =sum_k binom(m, k)(alpha+m)(alpha+k)^(m-k-1)b_k, \
    b_m & =sum_k (-1)^(m-k)binom(m, k)(alpha+m)^(m-k)a_k;
  $,
) <eq:abel-inverse-pair>
#source(106, "94")
#eq(
  $
    a_m & =sum_k binom(m, k)alpha(alpha+k)^(k-1)b_(m-k), \
    b_m & =sum_k (-1)^(m-k)binom(m, k)alpha(alpha-m+k)^(m-k-1)a_k.
  $,
) <eq:abel-convolution-inverse-pair>

*6. Exponential inverse relations* (#bib-ref("Riordan1968"), Table 3.3, class
1): #eq(
  $
    a_m=sum_k binom(m, k)frac(b_(m-k), k+1), quad
    b_m=sum_k binom(m, k)B_k a_(m-k).
  $,
) <eq:bernoulli-inverse-pair>
Here $B_k$ denotes the Bernoulli number with $B_1=-1/2$.

#theorem(suffix: [])[
  #bib-ref("Bourbaki1950", "Caccioppoli1949"). Each of
  @eq:binomial-inverse-pair–@eq:bernoulli-inverse-pair is a pair of inverse
  relations. Each relation in @eq:binomial-inverse-pair is equivalent to either
  functional relation in @eq:binomial-functional-pair. The same holds for
  @eq:shifted-binomial-inverse-pair and @eq:shifted-binomial-functional-pair,
  @eq:weighted-binomial-inverse-pair and @eq:weighted-binomial-functional-pair,
  and so on, through @eq:bernoulli-inverse-pair and
  @eq:bernoulli-functional-pair.
] <th:classical-inverse-pairs>

For the first four types, let $A(w)=sum_(m>=0)a_m w^m$ and
$B(w)=sum_(m>=0)b_m w^m$. For the Abel and exponential types, use
$tilde(A)(w)=sum_(m>=0)a_m w^m/m!$ and $tilde(B)(w)=sum_(m>=0)b_m w^m/m!$. All
substitutions below may be read formally; binomial powers have constant term
$1$. An inverse substitution always denotes the branch through the origin.

#eq(
  $
    A(w) & =(1-w)^(-p-1)B(w/(1-w)), \
    B(z) & =(1+z)^(-p-1)A(z/(1+z));
  $,
) <eq:binomial-functional-pair>
#eq(
  $
    A(w) & =(1+w)^p B(w(1+w)^(q-1)), \
    B(z) & =lr([(1+w)^(-p)A(w)])|_(w=W_(q)(z)),
  $,
) <eq:shifted-binomial-functional-pair>
where $W_q$ is the inverse of $w mapsto w(1+w)^(q-1)$; #eq(
  $
    A(w) & =(1+w)^(p)(1+q w)B(w(1+w)^(q-1)), \
    B(z) & =lr([A(w)(1+w)^(-p)(1+q w)^(-1)])|_(w=W_(q)(z));
  $,
) <eq:weighted-binomial-functional-pair>
#eq(
  $
    A(w/(1+w^r)) & =frac(1+w^r, 1+w^r-r w^r)B(w), \
            B(w) & =frac(1+w^r-r w^r, 1+w^r)A(w/(1+w^r));
  $,
) <eq:lacunary-functional-pair>
#eq(
  $
    A(w(1+w)^(-r)) & =frac((1+w)^(p+1), 1+w-r w)B(w), \
              B(w) & =(1+w)^(-p-1)(1+w-r w)A(w(1+w)^(-r));
  $,
) <eq:row-binomial-functional-pair>
#eq(
  $
    A(w) & =(1+w)^(p)(1+(1+r)w)B(w(1+w)^r), \
    B(z) & =lr([A(w)(1+w)^(-p)(1+(1+r)w)^(-1)])
           |_(w=W_(r+1)(z));
  $,
) <eq:column-binomial-functional-pair>
#eq(
  $
    tilde(A)(w) & =e^(alpha w)(1+w)tilde(B)(w e^w), \
    tilde(B)(z) & =lr([e^(-alpha w)(1+w)^(-1)tilde(A)(w)])|_(w=V(z)),
  $,
) <eq:abel-functional-pair>
where $V$ is the inverse of $w mapsto w e^w$; #eq(
  $
    tilde(A)(w) & =e^(alpha T(w))tilde(B)(w), \
    tilde(B)(w) & =e^(-alpha T(w))tilde(A)(w),
  $,
) <eq:abel-convolution-functional-pair>
where $T(w)e^(-T(w))=w$ and $T(0)=0$;
#source(107, "95")
#eq(
  $
    tilde(A)(w) & =frac(e^w-1, w)tilde(B)(w), \
    tilde(B)(w) & =frac(w, e^w-1)tilde(A)(w).
  $,
) <eq:bernoulli-functional-pair>

#proof[
  The two functional relations in each pair
  @eq:binomial-functional-pair–@eq:bernoulli-functional-pair are equivalent by
  an invertible formal substitution or multiplication by a unit. We first
  connect the forward sequence relations to these functional relations.

  *1.* Starting from the first relation in @eq:binomial-inverse-pair, we have
  $
    a_m & =sum_(k=0)^m binom(m+p, m-k)b_k \
        & =sum_(k=0)^infinity res_z (1+z)^(m+p)z^(-m+k-1)
          res_v B(v)v^(-k-1) \
        & =res_z (1+z)^(m+p)z^(-m-1)
          lr((sum_(k=0)^infinity z^k res_v B(v)v^(-k-1))) \
        & =res_z (1+z)^(m+p)B(z)z^(-m-1).
  $
  The substitution $w=z/(1+z)$ gives the first relation in
  @eq:binomial-functional-pair.

  *2.* For the first Gould pair,
  $
    a_m & =sum_(k=0)^infinity
          res_z (1+z)^(p+k(q-1))z^(-m+k-1)res_w B(w)w^(-k-1) \
        & =res_z (1+z)^p z^(-m-1)
          lr(
            (sum_(k=0)^infinity (z(1+z)^(q-1))^k
              res_w B(w)w^(-k-1))
          ) \
        & =res_z (1+z)^p B(z(1+z)^(q-1))z^(-m-1),
  $
  #source(108, "96")
  which is equivalent to @eq:shifted-binomial-functional-pair. For the second
  pair, the additional binomial term contributes an extra factor $q z$:
  $
    a_m & =sum_k lr(
            (res_z (1+z)^(p+q k-k)z^(-m+k-1) \
              &quad +q res_z (1+z)^(p+q k-k)z^(-m+k))
          )
          res_w B(w)w^(-k-1) \
        & =res_z (1+z)^(p)(1+q z)z^(-m-1)
          lr(
            (sum_(k=0)^infinity (z(1+z)^(q-1))^k
              res_w B(w)w^(-k-1))
          ) \
        & =res_z (1+z)^(p)(1+q z)B(z(1+z)^(q-1))z^(-m-1).
  $
  This proves @eq:weighted-binomial-functional-pair.

  *3.* For the Chebyshev relation,
  $
    a_m & =sum_k res_z (1+z)^m z^(-k-1)
          res_w B(w)w^(-m+r k-1) \
        & =res_w B(w)w^(-m-1)
          lr((sum_(k=0)^infinity w^(r k)res_z (1+z)^m z^(-k-1))) \
        & =res_w B(w)(1+w^r)^m w^(-m-1) \
        & =res_v lr([frac(B(w)(1+w^r), 1+w^r-r w^r)])
          |_(w=U(v))v^(-m-1),
  $
  where $U$ is the local inverse of $v=w/(1+w^r)$. This gives
  @eq:lacunary-functional-pair.

  #source(109, "97")
  *4.* For the first Legendre–Chebyshev pair,
  $
    a_m & =sum_k res_z (1+z)^(r m+p)z^(-m+k-1)
          res_w B(w)w^(-k-1) \
        & =res_z (1+z)^(r m+p)z^(-m-1)
          lr((sum_(k=0)^infinity z^k res_w B(w)w^(-k-1))) \
        & =res_z (1+z)^(r m+p)B(z)z^(-m-1) \
        & =res_w lr([frac(B(z)(1+z)^(p+1), 1+z-r z)])
          |_(z=U_(r)(w))w^(-m-1),
  $
  where $U_r$ is the inverse of $z mapsto z(1+z)^(-r)$. This is
  @eq:row-binomial-functional-pair. The calculation for
  @eq:column-binomial-inverse-pair gives
  $
    a_m & =sum_k lr(
            (res_z (1+z)^(p+r k)z^(-m+k-1) \
              &quad +(r+1)res_z (1+z)^(p+r k)z^(-m+k))
          )
          res_w B(w)w^(-k-1) \
        & =res_z (1+z)^(p)(1+(r+1)z)z^(-m-1)
          lr((sum_(k=0)^infinity (z(1+z)^r)^k res_w B(w)w^(-k-1))) \
        & =res_z (1+z)^(p)(1+(r+1)z)B(z(1+z)^r)z^(-m-1),
  $
  which proves @eq:column-binomial-functional-pair.

  #source(110, "98")
  *5.* For the first Abel pair, divide by $m!$ to obtain
  $
    frac(a_m, m!) & =sum_k frac(b_k, k!)
                    lr(
                      (frac((alpha+k)^(m-k), (m-k)!)
                        +frac((alpha+k)^(m-k-1), (m-k-1)!))
                    ) \
                  & =sum_k lr(
                      (res_w e^(w(alpha+k))w^(-m+k-1)
                        +res_w e^(w(alpha+k))w^(-m+k))
                    )
                    res_v tilde(B)(v)v^(-k-1) \
                  & =res_w e^(alpha w)(1+w)w^(-m-1)
                    lr(
                      (sum_(k=0)^infinity w^k e^(k w)
                        res_v tilde(B)(v)v^(-k-1))
                    ) \
                  & =res_w e^(alpha w)(1+w)tilde(B)(w e^w)w^(-m-1).
  $
  Terms with a negative factorial order are omitted. This yields
  @eq:abel-functional-pair. For the second Abel pair,
  $
    frac(a_m, m!) & =sum_k frac(b_(m-k), (m-k)!)
                    lr((frac((alpha+k)^k, k!)-frac((alpha+k)^(k-1), (k-1)!))) \
                  & =sum_k res_w tilde(B)(w)w^(-m+k-1)
                    lr(
                      (res_z e^(z(alpha+k))z^(-k-1)
                        -res_z e^(z(alpha+k))z^(-k))
                    ) \
                  & =res_w tilde(B)(w)w^(-m-1)
                    lr(
                      (sum_(k=0)^infinity w^k
                        res_z e^(alpha z)(1-z)e^(k z)z^(-k-1))
                    ) \
                  & =res_w tilde(B)(w)e^(alpha T(w))w^(-m-1).
  $
  The last equality uses $w=z e^(-z)$ and gives
  @eq:abel-convolution-functional-pair.

  *6.* The forward exponential relation is
  $
    a_m=sum_(k=0)^m binom(m, k)frac(b_(m-k), k+1).
  $
  #source(111, "99")
  After division by $m!$, its right side is $sum_k b_(m-k)/((k+1)!(m-k)!)$. By
  the integration rule,
  $
    frac(1, (k+1)!) & =frac(1, k+1)res_v e^v v^(-k-1) \
                    & =res_v lr((integral_0^v e^s dif s))v^(-k-2)
                      =res_v (e^v-1)v^(-k-2).
  $
  Hence
  $
    frac(a_m, m!) & =sum_k res_v (e^v-1)v^(-k-2)
                    res_z tilde(B)(z)z^(-m+k-1) \
                  & =res_z (e^z-1)tilde(B)(z)z^(-m-2),
  $
  which is the first relation in @eq:bernoulli-functional-pair.

  It remains to extract the inverse coefficients. For @eq:binomial-inverse-pair,
  @eq:lacunary-inverse-pair, @eq:row-binomial-inverse-pair and
  @eq:bernoulli-inverse-pair, this can be done directly from the corresponding
  explicit expression for $B$. For example, @eq:binomial-functional-pair gives
  $
    b_m & =res_w (1+w)^(-p-1)A(w/(1+w))w^(-m-1) \
        & =res_w (1+w)^(-p-1)
          lr((sum_(k=0)^m w^(k)(1+w)^(-k)a_k))w^(-m-1) \
        & =sum_k a_k res_w (1+w)^(-p-1-k)w^(-m+k-1) \
        & =sum_(k=0)^m a_(k)(-1)^(m-k)binom(p+m, m-k).
  $

  The inverse coefficients in the remaining pairs follow from the
  Bürmann–Lagrange rule for an implicit function. For example, #source(
    112,
    "100",
  )@eq:abel-functional-pair gives
  $
    frac(b_m, m!) & =res_z tilde(B)(z)z^(-m-1) \
                  & =res_w tilde(A)(w)e^(-alpha w)(1+w)^(-1)
                    (w e^w)' e^(-(m+1)w)w^(-m-1) \
                  & =sum_(k=0)^infinity frac(a_k, k!)
                    res_w e^(-(m+alpha)w)w^(-m+k-1) \
                  & =sum_(k=0)^m frac(a_k, k!)(-1)^(m-k)
                    frac((m+alpha)^(m-k), (m-k)!).
  $

  For completeness, put $N=m-k$ in the other binomial pairs. In
  @eq:shifted-binomial-inverse-pair, changing variables $z=w(1+w)^(q-1)$ gives,
  with $P=p+q m-k$,
  $
    & [w^N](1+q w)(1+w)^(-p-(q-1)m-1) \
    & =(-1)^N lr((binom(P, N)-q binom(P-1, N-1))).
  $

  This is the coefficient in @eq:shifted-binomial-inverse-pair, including its
  removable parameter values. The extra factor $1+q w$ in
  @eq:weighted-binomial-functional-pair cancels the Jacobian factor, leaving
  $(-1)^N binom(P, N)$, as in @eq:weighted-binomial-inverse-pair. Replacing $q$
  by $r+1$ gives @eq:column-binomial-inverse-pair.

  For @eq:row-binomial-inverse-pair, direct extraction from
  @eq:row-binomial-functional-pair gives
  $
    (-1)^N lr((binom(Q, N)+(r-1)binom(Q-1, N-1))),
    quad Q=p+r k+N,
  $
  #block(sticky: true)[
    which is its displayed coefficient after cancellation. Likewise, in
    @eq:lacunary-inverse-pair the coefficient multiplying $a_(m-r k)$ is
  ]
  $
    (-1)^k lr(
      (binom(m-r k+k, k)
        +(r-1)binom(m-r k+k-1, k-1))
    ).
  $
  These polynomial expressions also specify the values when a displayed ratio
  has a zero denominator. Finally,
  $
    [w^j]e^(alpha T(w))=frac(alpha(alpha+j)^(j-1), j!), quad j>=1,
  $
  with constant term $1$. Replacing $alpha$ by $-alpha$ proves the inverse
  formula in @eq:abel-convolution-inverse-pair. The Bernoulli generating
  function proves the inverse formula in @eq:bernoulli-inverse-pair. This
  completes the proof.
]

#corollary[
  The inverse pairs @eq:binomial-inverse-pair–@eq:bernoulli-inverse-pair are of
  type $F_1^1$.
]
