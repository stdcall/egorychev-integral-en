#import "index-style.typ": index-mark
#import "statements.typ": example, proof, solution
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, res, source

#source(67, "55")
#example(title: [])[
  Compute the Lyamin–Selivanov sum #eq(
    $
      S & =sum_(a=0)^(n-k)sum_(d=0)^a sum_(p=0)^a sum_(c=d)^(p+d)
          (-1)^(p+a-c)binom(k-d, a-d)binom(d, p+d-c) \
        & quad times frac(n! n^(n-k-a-1), (k-d)!(n-k-p)!c!)
          s_(2)(c,d)s_(2)(n-k-p,n-k-a).
    $,
  ) <eq:stirling-multiple-sum>
  #index-mark([@eq:stirling-multiple-sum], group: [Identities])[Lyamin and
    Selivanov]
  Let $n>=1$ and $0<=k<=n$ be integers. Terms with $a>k$ are zero. More
  precisely, interpret the potentially singular factor by cancellation:
  $
    frac(binom(k-d, a-d), (k-d)!)
    =frac(d!, k!)binom(k, a)binom(a, d),
  $
  with the right-hand side defining its value throughout $0<=d<=a$.

  #source(68, "56")
] <ex:stirling-multiple-sum>

#solution[
  Apply the substitution rule three times. For brevity, write
  $
    C_a=(-1)^a frac(n! n^(n-k-a-1), (n-k-a)!k!)binom(k, a).
  $
  Using the residue representation of Stirling numbers, we have
  $
    S & =sum_(a=0)^(n-k)sum_(d=0)^a sum_(p=0)^a sum_(c=d)^(p+d)
        C_(a)(-1)^(p-c)binom(a, d)binom(d, p+d-c) \
      & quad times res_x (e^x-1)^d x^(-c-1)
        res_y (e^y-1)^(n-k-a)y^(-n+k+p-1).
  $
  #block(sticky: true)[
    Replace the two binomial coefficients by their residues. The first
    substitution, summing over $c$, is
  ]
  $
    sum_(c=0)^(infinity)(-u)^c res_x (e^x-1)^d x^(-c-1)=(e^(-u)-1)^d.
  $
  #keep-next[Thus]
  $
    S & =sum_(a=0)^(n-k)sum_(d=0)^a sum_(p=0)^a C_(a)(-1)^p
        res_w (1+w)^a w^(-d-1) \
      & quad times res_u lr(
          {
            (1+u)^d u^(-p-d-1)
            res_y (e^y-1)^(n-k-a)y^(-n+k+p-1) \
                                              & quad times lr(
                                                  (sum_(c=0)^(infinity)(-u)^c
                                                    res_x (e^x-1)^d x^(-c-1))
                                                )
          }
        ).
  $
  After summing over $c$, collect the powers of $y$ and sum over $p$:
  $
    S & =sum_(a=0)^(n-k)sum_(d=0)^a C_a
        res_y lr(
          {(e^y-1)^(n-k-a)y^(-n+k-1)
            res_w (1+w)^a w^(-d-1) \
            & quad times lr(
              (sum_(p=0)^(infinity)(-y)^p
                res_u (1+u)^(d)(e^(-u)-1)^d u^(-p-d-1))
            )
          }
        ) \
      & =sum_(a=0)^(n-k) C_a res_y lr(
          {
            (e^y-1)^(n-k-a)y^(-n+k-1) \
                                      & quad times sum_(d=0)^infinity
                                        lr(((1-y)(e^y-1)(-y)^(-1)))^d
                                        res_w (1+w)^a w^(-d-1)
          }
        ) \
      & =sum_(a=0)^(n-k) C_a res_y
        frac((e^y-1)^(n-k-a)(y-(1-y)(e^y-1))^a, y^(n-k+a+1)).
  $
  The $p$-substitution applies to the ordinary power series
  $(1+u)^(d)((e^(-u)-1)/u)^d$. The $d$-substitution applies to the finite
  polynomial $(1+w)^a$.

  #block(sticky: true)[
    Since $e^y-1=y+O(y^2)$ and $y-(1-y)(e^y-1)=y^2/2+O(y^3)$, the final residue
    equals $2^(-a)$. Hence $S=sum_(a=0)^(n-k) C_a 2^(-a)$. This gives an
    analytic evaluation of @eq:stirling-multiple-sum and proves, for
    $0<=a<=n-k$, the identity
  ]
  #eq(
    $
      sum_(d=0)^a sum_(p=0)^a sum_(c=d)^(p+d)
      (-1)^(p+c)binom(a, d)binom(d, p+d-c)
      frac(d!(n-k-a)!, c!(n-k-p)!) \
      times s_(2)(c,d)s_(2)(n-k-p,n-k-a)=lr((frac(1, 2)))^a.
    $,
  ) <eq:stirling-cancellation>
  Lyamin and Selivanov (#bib-ref("Lyamin1969"), (3.37)) computed a sum close to
  @eq:stirling-multiple-sum by combinatorial methods in their enumeration of
  simple hypergraphs.

  #source(69, "57")
]

#example(title: [])[
  The Shirokov–Signaevskii identity #bib-ref(
    "Shirokov1972",
  ): #eq(
    $
      sum_(p=q)^(2^q-1)lr({binom(p, q)product_(i=q+1)^(p)(2^q-i)})s_(2)(n,p) \
      =sum_(j=q)^n binom(n, j)(2^q-q-1)^(n-j)s_(2)(j,q).
    $,
  ) <eq:stirling-weighted-sum>
  #index-mark([@eq:stirling-weighted-sum], group: [Identities])[Shirokov and
    Signaevskiĭ]
  Here $n,q$ are nonnegative integers, an empty product is $1$, and an empty sum
  is zero. Powers with exponent zero have value $1$, including a zero base.
] <ex:stirling-weighted-sum>

#proof[
  Find residue representations of both sides of @eq:stirling-weighted-sum. Put
  $M=2^q-q-1$, a nonnegative integer, and denote the left-hand side by $D(n,q)$.
  Since
  $
    frac(1, (p-q)!)product_(i=q+1)^(p)(2^q-i)=binom(M, p-q),
  $
  the substitution rule gives
  $
    D(n,q) & =frac(n!, q!)sum_(p=q)^(2^q-1)
             lr({frac(1, (p-q)!)product_(i=q+1)^(p)(2^q-i)})
             res_x (e^x-1)^p x^(-n-1) \
           & =frac(n!, q!)sum_(p=0)^infinity
             lr({res_y (1+y)^M y^(-p+q-1)})
             res_x (e^x-1)^p x^(-n-1) \
           & =frac(n!, q!)res_x lr(
               {x^(-n-1)
                 sum_(p=0)^(infinity)(e^x-1)^p
                 res_y y^(q)(1+y)^M y^(-p-1)
               }
             ).
  $
  #block(sticky: true)[
    The inner sum substitutes $y=e^x-1$ into $y^(q)(1+y)^M$, so
  ]
  #eq(
    $
      D(n,q)=frac(n!, q!)res_x lr(
        (
          x^(-n-1)(e^x-1)^q exp(x(2^q-q-1))
        )
      ).
    $,
  ) <eq:predicate-count-generating>
  #block(sticky: true)[
    Similarly, write $D(n\/q)$ for the right-hand side of
    @eq:stirling-weighted-sum. Then
  ]
  $
    D(n\/q) & =frac(n!, q!)sum_(k=0)^n
              frac(M^(n-k), (n-k)!)res_y (e^y-1)^q y^(-k-1) \
            & =frac(n!, q!)sum_(k=0)^infinity
              lr({res_x x^(-n+k-1)exp(x M)})
              res_y (e^y-1)^q y^(-k-1) \
            & =frac(n!, q!)res_x lr(
                {x^(-n-1)exp(x M)
                  lr(
                    (sum_(k=0)^infinity x^k
                      res_y (e^y-1)^q y^(-k-1))
                  )
                }
              ).
  $
  Applying the substitution rule once more gives #eq(
    $
      D(n\/q)=frac(n!, q!)res_x exp(x(2^q-q-1))(e^x-1)^q x^(-n-1),
    $,
  ) <eq:predicate-equivalence-count>
  which proves the identity. The infinite extensions are coefficientwise finite.

  The right-hand side of @eq:stirling-weighted-sum counts the minimal covers of
  an $n$-element set by $q$ subsets. Hearne and Wagner #bib-ref("Hearne1973")
  give a simpler method for obtaining this number than that in #bib-ref(
    "Shirokov1972",
  ).
]
