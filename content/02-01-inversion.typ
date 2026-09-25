#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": example, proof, solution
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note

#source(60, "48")
#heading(level: 3)[The inversion rule] <sec:inversion-rule>

The inversion rule often appears in the evaluation of the most difficult and
interesting combinatorial sums.

#example(title: [])[
  Compute the sum
  $
    S_n=p sum_(k=0)^n binom(n, k)(p-k q)^(k-1)(r+k q)^(n-k).
  $
  Here $n$ is a nonnegative integer. In the term with $k=0$, cancel
  $p(p-k q)^(-1)=1$ before evaluating the parameters, so this term is $r^n$.

  #source(61, "49")
] <ex:abel-sum>

#solution[
  We have
  $
    S_n & =n! sum_(k=0)^n
          lr((frac((p-k q)^k, k!)+q frac((p-k q)^(k-1), (k-1)!)))
          frac((r+k q)^(n-k), (n-k)!) \
        & =n! sum_(k=0)^infinity
          lr((res_u e^((p-k q)u)u^(-k-1)+q res_u e^((p-k q)u)u^(-k))) \
        & quad times res_v e^((r+k q)v)v^(-n+k-1).
  $
  #keep-next[
    In the first line, the term containing $(k-1)!$ is taken as zero when $k=0$.
    The coefficients with $k>n$ in the second line vanish. Thus
  ]
  $
    S_n & =n! res_v lr(
            [v^(-n-1)e^(r v)
              sum_(k=0)^infinity (v e^(q v))^k \
              &quad times res_u e^(p u)(1+q u)e^(-k q u)u^(-k-1)]
          ) \
        & =n! res_v e^(p v+r v)v^(-n-1)=(p+r)^n,
  $
  where the inversion rule gives the last residue expression. The substitution
  is based on the series $u e^(q u)$, whose linear coefficient is $1$.

  #block(sticky: true)[
    This gives another proof of Abel's well-known identity (#bib-ref(
      "Kaucky1975",
    ), §6.6.2):
  ]
  #eq(
    $
      p sum_(k=0)^n binom(n, k)(p-k q)^(k-1)(r+k q)^(n-k)=(p+r)^n.
    $,
  ) <eq:abel-identity>
  #index-mark([@eq:abel-identity], group: [Identities])[Abel]
  Kaucký (#bib-ref("Kaucky1975"), pp. 273–293) surveys various proofs of
  identities of Abel type and their history (see @prob:graph-identities).
]

#example(title: [])[
  Compute the sum
  $
    S_n=sum_(k=0)^n frac(q, p k+q)binom(p k+q, k)binom(p n-p k, n-k).
  $
  Use generalized binomial coefficients and interpret the product
  $frac(q, p k+q)binom(p k+q, k)$ by polynomial cancellation at $p k+q=0$. Its
  value is $1$ when $k=0$.
] <ex:hagen-rothe-sum>

#solution[
  With $binom(a, -1)=0$, we have
  $
    S_n & =sum_(k=0)^n lr({binom(p k+q, k)-p binom(p k+q-1, k-1)})
          binom(p n-p k, n-k) \
        & =sum_(k=0)^n lr(
            (res_u (1+u)^(p k+q)u^(-k-1)
              -p res_u (1+u)^(p k+q-1)u^(-k))
          ) \
        & quad times res_v (1+v)^(n p-k p)v^(-n+k-1).
  $
  #keep-next[
    Rearranging and applying the inversion rule gives
  ]
  $
    S_n & =res_v lr(
            [(1+v)^(n p)v^(-n-1)
              sum_(k=0)^infinity lr((frac(v, (1+v)^p)))^k \
              &quad times res_u (1+u)^(q-1)(1+u-u p)(1+u)^(k p)u^(-k-1)]
          ) \
        & =res_v (1+v)^(n p)v^(-n-1)(1+v)^q=binom(n p+q, n).
  $
  Here the inverse substitution is based on $u/(1+u)^p$, again with linear
  coefficient $1$.

  #source(62, "50")
  #block(sticky: true)[
    We obtain Rohatgi's identity (cf. #bib-ref("Rohatgi1966")):
  ]
  #eq(
    $
      sum_(k=0)^n frac(q, p k+q)binom(p k+q, k)binom(p n-p k, n-k)
      =binom(n p+q, n).
    $,
  ) <eq:hagen-rothe-identity>
  #index-mark([@eq:hagen-rothe-identity], group: [Identities])[Rohatgi]
]

#example(title: [])[
  Prove Rodeja's identity (cf. #bib-ref("GarciaRodeja1967")) #eq(
    $
      sum_(k=0)^n omega_(k)(p+q k)omega_(n-k)(r-q k) \
      =sum_(k=0)^n q^k omega_(n-k)(p+r+k d),
    $,
  ) <eq:rising-factorial-convolution>
  #index-mark([@eq:rising-factorial-convolution], group: [Identities])[Jensen]
  #index-mark([@eq:rising-factorial-convolution], group: [Identities])[Rodeja]
  where #eq(
    $
      omega_(n)(x)=frac(1, n!)x(x+d)dots(x+(n-1)d).
    $,
  ) <eq:rising-factorial-polynomial>
  #index-mark([@eq:rising-factorial-polynomial], group: [Identities])[Gould]
  The convention is $omega_(0)(x)=1$.
] <ex:rising-factorial-convolution>

#proof[
  Denote the left-hand side of @eq:rising-factorial-convolution by $S_n$. Since
  $
    omega_(n)(x)=cases(
      res_v (1-d v)^(-x/d)v^(-n-1) & quad "for" d!=0,
      res_v e^(x v)v^(-n-1) & quad "for" d=0,
    ),
  $
  #keep-next[
    the inversion rule gives, for $d!=0$,
  ]
  $
    S_n & =sum_(k=0)^n res_u frac((1-d u)^(-(p+k q)/d), u^(k+1))
          res_v frac((1-d v)^(-(r-k q)/d), v^(n-k+1)) \
        & =res_v (1-d v)^(-(p+r)/d)(1-v q(1-v d)^(-1))^(-1)v^(-n-1) \
        & =res_v lr(
            [lr((sum_(k=0)^infinity (v q)^(k)(1-v d)^(-k)))
              (1-v d)^(-(p+r)/d)v^(-n-1)]
          ) \
        & =sum_(k=0)^n q^k omega_(n-k)(p+r+k d).
  $
  #keep-next[
    For this application of inversion use $u(1-d u)^(q/d)$, whose linear
    coefficient is $1$. The next step expands
  ]
  $
    (1-v q(1-v d)^(-1))^(-1)
  $
  as a geometric series. Its ratio has zero constant term, and only $k<=n$
  contributes to the required coefficient.

  The case $d=0$ is proved similarly. With $d=-1$,
  @eq:rising-factorial-convolution gives Jensen's formula (cf. #bib-ref(
    "Kaucky1975",
  ), pp. 243–247). With $d=0$, it gives Gould's identity #eq(
    $
      sum_(k=0)^n frac((p+q k)^k, k!)frac((r-q k)^(n-k), (n-k)!)
      =sum_(k=0)^n frac((p+r)^(n-k), (n-k)!)q^k.
    $,
  ) <eq:abel-convolution>

  #source(63, "51")
  Kaucký (#bib-ref("Kaucky1975"), pp. 249–252) gives several proofs of
  identities of the types @eq:hagen-rothe-identity and
  @eq:rising-factorial-convolution (see @prob:hagen-identities). A related
  identity of Gould, #eq(
    $
      sum_(k=0)^n (-1)^k A_(k)(r,m q)A_(n-k)(p+q k-k,(1-m)q) \
      =A_(n)(p-r,(1-m)q),
    $,
  ) <eq:gould-polynomial-convolution>
  where
  $
    A_(k)(p,q)=frac(p, p+q k)binom(p+q k, k),
  $
  #keep-next[
    was reproved by Skalsky #bib-ref("Skalsky1967") using Lagrange's theorem. At
    removable singularities, use the polynomial form
  ]
  $
    A_(0)(p,q)=1, quad
    A_(k)(p,q)=frac(p, k!)product_(j=1)^(k-1)(p+q k-j) quad (k>=1).
  $
  All parameters in these identities may be complex, with nonnegative integer
  summation indices and the cancellation conventions just specified.
]

#example(title: [])[
  Compute the sum involving Stirling numbers of the second kind and generalized
  Bernoulli numbers #bib-ref("Egorychev1974c"):
  $
    S_n=sum_(k=0)^n s_(2)(n,k)B_k^((k+1)).
  $
] <ex:stirling-bernoulli-sum>

#solution[
  By the inversion rule,
  $
    S_n & =sum_(k=0)^n frac(n!, k!)res_x (e^x-1)^k x^(-n-1)
          k! res_y (e^y-1)^(-k-1) \
        & =n! res_x x^(-n-1)lr(
            (sum_(k=0)^infinity (e^x-1)^k
              res_y (e^y-1)^(-k-1))
          ) \
        & =n! res_x (e^(-x)x^(-n-1))=(-1)^n.
  $
  The inverse of $e^y-1$ is $log(1+t)$, with derivative $1/(1+t)$. Substituting
  $t=e^x-1$ gives the factor $e^(-x)$ in the last line. Also $s_(2)(n,k)=0$ for
  $k>n$, so the infinite extension does not change the coefficient.

  #block(sticky: true)[Thus we obtain the new identity]
  #eq(
    $
      sum_(k=0)^infinity s_(2)(n,k)B_k^((k+1))=(-1)^n.
    $,
  ) <eq:stirling-bernoulli-identity>
  #index-mark([@eq:stirling-bernoulli-identity], group: [Identities])[Gould]
  Further analogous new identities appear in @prob:special-number-identities.
]
