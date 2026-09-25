#import "index-style.typ": index-mark
#import "statements.typ": solution
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, dw, eq, res, source

#heading(level: 2)[Examples] <sec:method-examples>

#heading(level: 3)[
  Computation of a certain finite sum of Hardy
] <sec:hardy-sum>
#index-mark([@sec:hardy-sum], group: [Identities])[Hardy]

_Compute the sum_
#eq(
  $
    S_m=sum_(k=0)^(floor(m\/2)) (-1)^k binom(m-k, k) 1/(m-k),
    quad m=1,2,dots.
  $,
) <eq:alternating-binomial-sum>

#solution[
  Elementary transformations of the binomial coefficients and formula $M_(1)(w)$
  give an integral representation for the general term of the sum
  @eq:alternating-binomial-sum. For $0<rho<1$, we have
  #source(37, "25")
  #eq(
    $
      binom(m-k, k) 1/(m-k)
      =1/m lr((binom(m-k, k)+binom(m-k-1, k-1)))
    $,
  ) <eq:binomial-decomposition>
  #eq(
    $
      =1/m lr(
        (
          1/(2 pi i) integral_(abs(w)=rho) (1+w)^(m-k) w^(-m+2k-1) dw \
          +1/(2 pi i) integral_(abs(w)=rho) (1+w)^(m-k-1) w^(-m+2k-1) dw
        )
      )
    $,
  ) <eq:binomial-two-integrals>
  #eq(
    $
      =1/m 1/(2 pi i) integral_(abs(w)=rho)
      (2+w)(1+w)^(m-k-1) w^(-m+2k-1) dw.
    $,
  ) <eq:binomial-single-integral>
  #block(sticky: true)[Further,]
  #eq(
    $
      S_m=sum_(k=0)^(floor(m\/2)) (-1)^k/m 1/(2 pi i)
      integral_(abs(w)=rho) (2+w)(1+w)^(m-k-1) w^(-m+2k-1) dw \
      =sum_(k=0)^infinity dots,
    $,
  ) <eq:alternating-sum-integral>
  because the integrals in @eq:alternating-sum-integral vanish for
  $k>floor(m\/2)$. Choose $rho$ sufficiently small, say $rho=1/2$, so that the
  geometric series $sum_(k=0)^infinity (-w^2)^k (1+w)^(-k)$ converges uniformly
  on the contour $abs(w)=rho=1/2$. We may therefore take the sum in
  @eq:alternating-sum-integral under the integral sign and sum the geometric
  series:
  $
    S_m=1/(2 pi i m) integral_(abs(w)=1/2)
    (2+w) (1+w)^(m-1)/w^(m+1)
    lr((sum_(k=0)^infinity (-w^2)^k/(1+w)^k)) dw \
    =1/(2 pi i m) integral_(abs(w)=1/2)
    (2+w)(1+w)^m (1+w+w^2)^(-1) w^(-m-1) dw.
  $
  #keep-next[
    By the residue theorem, summing the residues at the two other poles gives
  ]
  $
    S_m=-1/m sum_(sigma in {-1,1})
    lr([(2+w)(1+w)^m/((1+2w)w^(m+1))])|_(w=-1/2+sigma i sqrt(3)/2) \
    =2(-1)^m/m cos((2 pi)/3 m),
  $
  and finally we obtain Hardy's identity (#bib-ref("Gould1972a"), (1.68)): #eq(
    $
      sum_(k=0)^(floor(m\/2)) (-1)^k binom(m-k, k) 1/(m-k)
      =cases(2(-1)^m/m & m=3n, (-1)^(m-1)/m & "otherwise".).
    $,
  ) <eq:alternating-sum-values>

  #source(38, "26")*Remarks on the proof.* We clarify the first step of the
  computation. In computing sums involving binomial coefficients, one often uses
  transformations of the form #eq(
    $
      binom(m, k)=binom(m, m-k), quad k binom(m, k)=m binom(m-1, k-1), \
      binom(k p+q, k) q/(k p+q)=binom(k p+q, k)-p binom(k p+q-1, k-1)
    $,
  ) <eq:binomial-symmetries>
  and so on. In the method of integral representation, these transformations
  amount to choosing suitable integral representations, from Table M in the
  Appendix, for the numbers appearing in the sum. For example,
  $binom(m, k)=binom(m, m-k)$ corresponds to
  $
    res_w (1+w)^m w^(-k-1)=res_z (1+z)^m z^(-m+k-1).
  $
  This reverses the coefficients of the finite polynomial $(1+w)^m$;
  equivalently, for the Laurent polynomial $A(w)=(1+w)^m w^(-k-1)$, it uses
  $res_w A(w)=res_z z^(-2) A(z^(-1))$. The transformation in
  @eq:binomial-decomposition corresponds to the passage from
  @eq:binomial-single-integral to @eq:binomial-two-integrals.

  #keep-next[
    In passing from @eq:binomial-decomposition to @eq:binomial-two-integrals,
    Table M allows us to replace $binom(m-k, k)$, and likewise
    $binom(m-k-1, k-1)$, by any of the following expressions:
  ]
  #eq(
    $
      1/(2 pi i) integral_(abs(w)=rho_1) (1+w)^(m-k) w^(-k-1) dw, \
      1/(2 pi i) integral_(abs(w)=rho_2) (1-w)^(-m+2k-1) w^(-k-1) dw, \
      1/(2 pi i) integral_(abs(w)=rho_1) (1+w)^(m-k) w^(-m+2k-1) dw, \
      1/(2 pi i) integral_(abs(w)=rho_2) (1-w)^(-k-1) w^(-m+2k-1) dw, \
      0<rho_1<infinity, quad 0<rho_2<1.
    $,
  ) <eq:binomial-contour-choices>
  In @eq:alternating-binomial-sum the summands are understood to be zero for
  $k>floor(m\/2)$, so it is natural to use the third or fourth formula in
  @eq:binomial-contour-choices. We used the third. This example shows, in a
  simple form, how the first step of the calculation implements Cauchy's general
  idea of finding solutions of differential equations through integral
  representations satisfying prescribed “boundary” conditions. For the discrete
  parameters $m,k,dots$, the boundary conditions are the prescribed zero values
  of the binomial array $binom(m-k, k)$ for $k<0$ and $k>floor(m\/2)$.

  The second part of the proof follows a familiar procedure for computing
  contour integrals depending on integer parameters by means of a generating
  function (see, for example, §@sec:independent-indices). At this stage of the
  #source(39, "27") calculation, the crucial points are the choice of the
  integration contour and the evaluation of the integral for $S_m$.

  The following example uses $res$ and its properties.
]

#heading(level: 3)[
  Another proof of Grosswald's identity
] <sec:grosswald-identity>
#index-mark([@sec:grosswald-identity], group: [Identities])[Grosswald]

_For integers $0<=r<=n$, compute the sum_
#eq(
  $
    S_(n,r)=sum_(nu=0)^(n-r) (-2)^(-nu) binom(n, r+nu) binom(n+r+nu, nu),
    quad n-r equiv 0 (mod 2).
  $,
) <eq:parity-sum>

#solution[
  Reverse the index by replacing $nu$ with $n-r-nu$. In the resulting sum,
  represent $binom(n, nu)$ by formula $M_(1)(u)$ and $binom(2n-nu, n-r-nu)$ by
  formula $M_(1)(v)$. Then
  $
    S_(n,r)=2^(r-n) sum_(nu=0)^(n-r)
    (-2)^nu binom(n, nu) binom(2n-nu, n-r-nu) \
    =2^(r-n) sum_(nu=0)^(n-r) (-2)^nu
    res_u lr(((1+u)^n u^(-nu-1)))
    res_v (1+v)^(2n-nu) v^(-n+r+nu-1).
  $
  Taking the sum under $res_v$ and grouping the terms with index $nu$, we
  obtain, by the substitution rule @eq:residue-substitution-univariate, #eq(
    $
      S_(n,r)=2^(r-n) res_v (1+v)^(2n) v^(-n+r-1) \
      quad times lr((sum_(nu=0)^n ((-2v)/(1+v))^nu res_u (1+u)^n u^(-nu-1))) \
      =2^(r-n) res_v (1+v)^(2n) v^(-n+r-1) (1-(2v)/(1+v))^n \
      =2^(r-n) res_v (1-v^2)^n v^(-n+r-1).
    $,
  ) <eq:parity-sum-residue>
  Evaluating the last $res$ gives Grosswald's identity (#bib-ref("Kaucky1975"),
  pp. 309–320): #eq(
    $
      sum_(nu=0)^(n-r) (-2)^(-nu) binom(n, r+nu) binom(n+r+nu, nu)
      =(-1)^((n-r)/2) 2^(r-n) binom(n, (n-r)/2).
    $,
  ) <eq:parity-sum-value>
  This proof also yields @eq:parity-sum-value by the traditional methods of
  generating functions or residues. One can start from the coefficient of
  $v^(n-r)$ in $2^(r-n)(1-v^2)^n$ in @eq:parity-sum-residue, or from its
  integral representation, and write out the computations for the two sides of
  @eq:parity-sum-value separately.

  The next example gives a short proof of a result of Carlitz.
]
