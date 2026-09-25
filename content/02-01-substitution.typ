#import "index-style.typ": index-mark
#import "statements.typ": example, proof, solution, theorem
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, res, source

#heading(level: 3)[The substitution rule] <sec:substitution-rule>

When sums are evaluated by integral representations, the substitution rule is
used to find a generating function that is the product or composition of two
others, and to evaluate an analytic function at a point. This probably explains
the rule's frequent use in our approach.

#example(title: [], suffix: [*. Another proof of the Tepper identity.*])[
  Compute the sum
  $
    S=S_(r,p,alpha)=sum_(k=0)^r (-1)^k binom(r, k)(alpha-k)^p,
  $
  where $r$ is a nonnegative integer, $p=0,1,dots,r$, and $alpha$ is any complex
  number.
] <ex:finite-difference-powers>

#solution[
  Using formulas $M_(1)(u)$ and $M_(3)(v)$, followed by the linearity and
  substitution rules, we obtain
  $
    S & =p! sum_(k=0)^r (-1)^k binom(r, k)frac((alpha-k)^p, p!) \
      & =p! sum_(k=0)^r (-1)^k res_u frac((1+u)^r, u^(k+1))
        res_v frac(exp(v(alpha-k)), v^(p+1)) \
      & =p! res_v frac(exp(alpha v), v^(p+1))
        lr((sum_(k=0)^r (-e^(-v))^k res_u frac((1+u)^r, u^(k+1)))) \
      & =p! res_v frac(exp(alpha v), v^(p+1))(1-e^(-v))^r \
      & =p! res_v frac(exp(alpha v), v^(p+1))
        lr((frac(v, 1!)-frac(v^2, 2!)+dots))^r \
      & =cases(0 &quad "if" 0<=p<r, r! &quad "if" p=r).
  $
  The substitution is into the polynomial $(1+u)^r$, so the nonzero constant
  term of $-e^(-v)$ causes no difficulty. The last power series starts with
  $v^r$, with coefficient $1$.

  #source(59, "47")
  #block(sticky: true)[
    This gives another proof of the Tepper identity (cf. #bib-ref("Papp1972")):
  ]
  #eq(
    $
      sum_(k=0)^r (-1)^k binom(r, k)(alpha-k)^p
      =cases(0 &quad "if" 0<=p<r, r! &quad "if" p=r).
    $,
  ) <eq:finite-difference-powers>
  #index-mark([@eq:finite-difference-powers], group: [Identities])[Tepper]
]

#example(title: [], suffix: [*. Refinement of an estimate in the theory of
trees.*])[
  In #bib-ref(
    "Konovaltsev1970",
  ), the following estimate is given for the root multiplicity $f(n)$, averaged
  over all plane rooted trees: #eq(
    $ lim_(n->infinity) f(n)<=3 dot 2^(3/2) pi^(-1/2), $,
  ) <eq:catalan-ratio-bound>
  where #eq(
    $
        f(n) & =frac(eta(n), R(n)), \
      eta(n) & =sum_(k=0)^n frac(1, k+1)binom(2k, k)
               frac(1, n-k+1)binom(2n-2k, n-k), \
        R(n) & =frac(1, n+1)binom(2n, n).
    $,
  ) <eq:catalan-ratio>
  Here $n$ is a nonnegative integer.
] <ex:catalan-ratio-bound>

#theorem[
  The following exact formula holds: #eq(
    $ f(n)=4-frac(6, n+2), quad lim_(n->infinity) f(n)=4. $,
  ) <eq:catalan-ratio-value>
] <th:catalan-ratio-value>

#proof[
  Use the square-root series with constant term $1$. By formulas $M_(1)(u)$ and
  $M_(1)(v)$ and the substitution rule,
  $
    eta(n) & =sum_(k=0)^infinity frac(1, 2)
             res_u lr((frac(1-sqrt(1-4u), u)))u^(-k-1) \
           & quad times frac(1, 2)res_v lr((frac(1-sqrt(1-4v), v)))v^(-n+k-1) \
           & =frac(1, 4)res_v lr(
               [
                 frac(1-sqrt(1-4v), v^(n+2))
                 lr(
                   (sum_(k=0)^infinity v^k
                     res_u frac(1-sqrt(1-4u), u)u^(-k-1))
                 )
               ]
             ) \
           & =frac(1, 4)res_v (1-sqrt(1-4v))^2 v^(-n-3) \
           & =frac(1, 2)res_v (1-2v-sqrt(1-4v))v^(-n-3) \
           & =frac((2n+2)!, (n+2)!(n+1)!).
  $
  The terms with $k>n$ vanish, so extending the sum to infinity is legitimate.
  This yields the known identity (see, for example, #bib-ref("Vilenkin1969"),
  Russian p. 88, formula (22), and #bib-ref("Mathai1972")) #eq(
    $
      sum_(k=0)^n frac(1, k+1)binom(2k, k)
      frac(1, n-k+1)binom(2n-2k, n-k) \
      =frac((2n+2)!, (n+2)!(n+1)!).
    $,
  ) <eq:catalan-convolution>
  Dividing @eq:catalan-convolution by $R(n)$ gives @eq:catalan-ratio-value and
  proves the theorem.

  #source(60, "48")
]

#example(title: [])[
  Compute the sum
  $
    S_n=sum_(k=0)^n 2^k product_(j=0)^(k-1)(n-j)(2n-j)^(-1),
  $
  where $n$ is a nonnegative integer and the empty product equals $1$.
] <ex:central-binomial-reciprocal>

#solution[
  By formula $M_(9)(x)$ for the beta function,
  $
    S_n & =(2n+1)sum_(k=0)^n 2^k binom(n, k)B(k+1,2n-k+1) \
        & =(2n+1)sum_(k=0)^n 2^k integral_0^1 x^(k)(1-x)^(2n-k) dif x
          res_u frac((1+u)^n, u^(k+1)).
  $
  Next, the substitution rule for $res_u$ gives
  $
    S_n & =(2n+1)integral_0^1 (1-x)^(2n)
          lr((1+frac(2x, 1-x)))^n dif x \
        & =(2n+1)integral_0^1 (1-x^2)^n dif x \
        & =frac(1, 2)(2n+1)B(n+1,1/2) \
        & =frac(4^n, binom(2n, n)).
  $
  The polynomial simplification gives the continuous extension at $x=1$. We have
  thus obtained Gupta's identity (cf. the proof in #bib-ref("Gupta1954")): #eq(
    $
      sum_(k=0)^n 2^k product_(j=0)^(k-1)(n-j)(2n-j)^(-1)
      =frac(4^n, binom(2n, n)).
    $,
  ) <eq:central-binomial-reciprocal>
  #index-mark([@eq:central-binomial-reciprocal], group: [Identities])[Gupta]
]

#example(title: [])[
  Prove the identity (see #bib-ref("Kaucky1975"), §6.1) #eq(
    $
      sum_(k=0)^p binom(p, k)binom(q, k)alpha^(p-k)beta^k \
      =sum_(k=0)^p binom(p, k)binom(q+k, q)(alpha-beta)^(p-k)beta^k,
      quad p<=q,
    $,
  ) <eq:binomial-product-transformation>
  where $p,q$ are nonnegative integers and $alpha,beta$ are complex numbers.
] <ex:binomial-product-transformation>

#proof[
  As in the preceding examples, represent both sides of
  @eq:binomial-product-transformation using $res$. Each side equals
  $
    res_x (alpha x+beta)^(p)(1+x)^q x^(-p-1).
  $
  For the right-hand side, expand using $alpha x+beta=(alpha-beta)x+beta(1+x)$.
  This proves @eq:binomial-product-transformation.

  Three different proofs of @eq:binomial-product-transformation are given in
  #bib-ref("Kaucky1975"), pp. 166–171; Ljunggren's proof is closest to ours.
]
