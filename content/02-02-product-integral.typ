#import "statements.typ": proof, remark, theorem
#import "book-style.typ": keep-next, keep-together
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(77, "65")
Let $n$ be a nonnegative integer, $x$ a complex number, $a_1$ and $b_1$ real,
and $a_2,dots,a_6,b_2,dots,b_6$ integers. Let $m=m(a,b,n)$ be a nonnegative
integer-valued function of the parameters, linear in $n$, or let $m=infinity$.
Write
$
  N_1=a_1 n+a_3, quad N_2=a_4 n+a_6, quad
  M_1=b_1 n+b_3, quad M_2=b_4 n+b_6.
$
As before, a binomial coefficient with a negative integer lower index is zero.

#theorem[
  _The sum_
  #eq(
    $
      S(a,b,n,x)=sum_(k=0)^m
      binom(a_1 n+a_2 k+a_3, a_4 n+a_5 k+a_6)
      binom(b_1 n+b_2 k+b_3, b_4 n+b_5 k+b_6)x^k
    $,
  ) <eq:binomial-product-sum>
  #keep-next[
    _has the following integral representations. Put_
  ]
  $
    R(w,z)=x frac((1+w)^(a_2)(1+z)^(b_2), w^(a_5)z^(b_5)).
  $
  #block(sticky: true)[_For finite $m$,_]
  #eq(
    $
      S(a,b,n,x) & =frac(1, (2pi i)^2)integral_gamma
                   frac(
                     (1+w)^(N_1)(1+z)^(M_1) dif w ∧ dif z,
                     w^(N_2+1)z^(M_2+1)(1-R(w,z))
                   ) \
                 & quad -frac(x^(m+1), (2pi i)^2)integral_gamma
                   frac(
                     (1+w)^(N_1+a_(2)(m+1))(1+z)^(M_1+b_(2)(m+1))
                     dif w ∧ dif z,
                     w^(N_2+a_(5)(m+1)+1)z^(M_2+b_(5)(m+1)+1)(1-R(w,z))
                   ).
    $,
  ) <eq:binomial-product-finite-integral>
  #block(sticky: true)[_For $m=infinity$,_]
  #eq(
    $
      S(a,b,n,x)=frac(1, (2pi i)^2)integral_gamma
      frac(
        (1+w)^(N_1)(1+z)^(M_1)dif w ∧ dif z,
        w^(N_2+1)z^(M_2+1)(1-R(w,z))
      ).
    $,
  ) <eq:binomial-product-infinite-integral>
  Here $gamma$ is the product torus $abs(w)=rho$, $abs(z)=sigma$, with the
  positive product orientation in the order $w,z$. All powers of $1+w$ and $1+z$
  occurring in the sum must be analytic on and inside the corresponding circles,
  with their branches continued from $1$ at the origin. Radii $0<rho,sigma<1$
  suffice for this analytic requirement; larger radii are allowed when the
  corresponding powers are polynomials.


  #block(sticky: true)[_For $m=infinity$, also require on $gamma$ that_]
  #eq(
    $
      abs(w^(a_5)z^(b_5))>abs(x(1+w)^(a_2)(1+z)^(b_2)).
    $,
  ) <eq:binomial-product-contour-bound>
  #keep-together[
    For finite $m$, if the separate integrals in
    @eq:binomial-product-finite-integral are undefined, interpret their
    difference through the combined finite geometric kernel.
  ]
] <th:binomial-product-sum>

#proof[
  Apply Cauchy's coefficient formula separately in $w$ and $z$ to each of the
  two binomial coefficients. Their product, multiplied by $x^k$, has coefficient
  kernel
  $
    H(w,z)R(w,z)^k, quad
    H(w,z)=frac((1+w)^(N_1)(1+z)^(M_1), w^(N_2+1)z^(M_2+1)).
  $
  For finite $m$, summing the geometric polynomial gives $H(1-R^(m+1))/(1-R)$,
  with value $(m+1)H$ at $R=1$. Splitting the numerator gives
  @eq:binomial-product-finite-integral, including the $a_(5)(m+1)$ and
  $b_(5)(m+1)$ shifts in the lower powers. For $m=infinity$, condition
  @eq:binomial-product-contour-bound and compactness give $max_gamma abs(R)<1$,
  so the series converges uniformly and absolutely on the torus and may be
  integrated term by term. This gives @eq:binomial-product-infinite-integral,
  just as in @th:binomial-parameter-sum.
]

#remark[
  The sums on the left sides of identities (3.1)–(3.38), (3.40)–(3.56),
  (3.61)–(3.75), (3.80)–(3.88), (3.90), (3.91), (3.97)–(3.99), (3.101)–(3.121),
  (3.139), (3.141), (3.143)–(3.145), (3.150), (3.153)–(3.159), (3.162)–(3.167),
  and (3.169)–(3.183) in #bib-ref("Gould1972a"), a total of 139 sums, admit
  integral representations of the form @eq:binomial-product-finite-integral or
  @eq:binomial-product-infinite-integral under the corresponding hypotheses.
]
