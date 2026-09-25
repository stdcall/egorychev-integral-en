#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, source
#import "statements.typ": problem
#import "book-style.typ": keep-next

#source(197, "185")
#problem[
  Prove:

  a) The identities of Carlitz and Riordan #bib-ref("Carlitz1973a"): #eq(
    $
      sum binom(n+1, k)frac(k!, k_1!dots k_n!)
      binom(r, 1)^(k_1)dots binom(r, n)^(k_n)=binom(n r+r, n),
    $,
  ) <eq:carlitz-composition-identity>
  #index-mark([@eq:carlitz-composition-identity], group: [Identities])[Carlitz]
  #eq(
    $
      sum binom(n+p, k)frac(k!, k_1!dots k_n!)
      binom(r, 1)^(k_1)dots binom(r, n)^(k_n)=binom(n r+r p, n),
    $,
  ) <eq:carlitz-parameter-composition>
  #index-mark([@eq:carlitz-parameter-composition], group: [Identities])[Carlitz]
  where $r,n,p$ are positive integers. Both sums run over all nonnegative
  $k_1,dots,k_n$ with $k_1+2k_2+dots+n k_n=n$, and $k=k_1+dots+k_n$.

  #keep-next[
    b) The identity of Beineke and Pippert (#bib-ref("Beineke1969"), Lemma 2):
  ]
  #eq(
    $
      sum_(i_1+dots+i_(k+1)=n-k-1)binom(n-k-1, i_1, i_2, dots, i_(k+1))
      product_(j=1)^(k+1)(k i_j+1)^(i_j-1) \
      =(k+1)(k n-k^2+1)^(n-k-2),
    $,
  ) <eq:beineke-pippert-identity>
  #index-mark([@eq:beineke-pippert-identity], group: [Identities])[Beineke and
    Pippert]
  where $k>=0$ and $n>=k+1$ are integers, and the sum runs over all ordered
  nonnegative integer solutions $i_1,dots,i_(k+1)$ of the indicated equation.

  #keep-next[c) Rényi's identity (#bib-ref("Renyi1959"), §1, (1.1)):]
  #eq(
    $
      sum_(j_1+dots+j_k=n)frac(n!, j_1!j_2!dots j_k!)
      j_1^(j_1-1)j_2^(j_2-1)dots j_k^(j_k-1) \
      =k n^(n-k)product_(r=1)^(k-1)(n-r),
    $,
  ) <eq:forest-component-identity>
  #index-mark([@eq:forest-component-identity], group: [Identities])[Rényi]
  where $1<=k<=n$, the summation indices $j_1,dots,j_k$ are positive integers,
  and the empty product for $k=1$ equals $1$.

  #keep-next[d) Takács' identity #bib-ref("Takacs1973"):]
  #eq(
    $
      & sum_(j_1+dots+j_t<=k)
        binom(m-l_1-dots-l_t, k-j_1-dots-j_t)
        product_(i=1)^t lr((binom(c_i+j_i, m)binom(l_i, j_i))) \
      & =sum_(r_1+dots+r_t<=k)
        binom(m-r_1-dots-r_t, k-r_1-dots-r_t)
        product_(i=1)^t lr((binom(l_i, r_i)binom(c_i, m-r_i))),
    $,
  ) <eq:multivariate-binomial-transformation>
  #index-mark(
    [@eq:multivariate-binomial-transformation],
    group: [Identities],
  )[Takács]
  where $t>=1$, $k,l_1,dots,l_t,m$ are nonnegative integers satisfying $k<=m$
  and $l_1+dots+l_t<=m$, and $c_1,dots,c_t$ are arbitrary complex numbers. All
  summation indices are nonnegative integers.

  #keep-next[e) The identity (see, for example, #bib-ref("Renyi1966"), (1.20)):]
  #eq(
    $
      sum_(l_1+2l_2+dots+n l_n=n \ l_1+dots+l_n=r)
      frac(n!, product_(k=1)^n (k!)^(l_k)l_k!)=s_(2)(n,r),
    $,
  ) <eq:stirling-partition-sum>
  where $n>=1$, $0<=r<=n$, all $l_k$ are nonnegative integers, and $s_(2)(n,r)$
  is a Stirling number of the second kind.

  #source(198, "186")
] <prob:carlitz-composition-identity>

#problem[
  In light of §§@sec:splitting-method and @sec:splitting-integrals, analyze
  known solutions of combinatorial problems that involve changing the dimension
  of the original problem.
] <prob:dimension-changing-methods>

#problem[
  Prove the identities of Shih-Chieh Chu and Dixon by means of the splitting
  lemma.
] <prob:chu-dixon-splitting>

#problem[
  Use generating functions to compute the integrals #eq(
    $
      integral (f x+e)^m (a x^2+b x+c)^(-n)dif x,
    $,
  ) <eq:rational-antiderivative>
  with nonnegative integer $m$, positive integer $n$ and real coefficients, on
  intervals where the quadratic is nonzero; #eq(
    $
      integral_(-infinity)^(+infinity)(x^2+1)^8 (x^2+4)^(-13)dif x;
    $,
  ) <eq:rational-integral-example>
  #eq(
    $
      integral_(-infinity)^(+infinity)(x^2+1)^q (x^2+a^2)^(-p)dif x,
    $,
  ) <eq:rational-integral-family>
  where $a$ is a nonzero real number and $p,q$ are positive integers with $p>q$.
] <prob:rational-antiderivative>

#problem[
  a) Prove the identity of Govindarajulu and Suzuki, for nonnegative integer
  $m$, with $0^0=1$:
  $
    sum_(k=0)^m (-1)^k k^m binom(m, k)=(-1)^m m!.
  $
  b) Write a multidimensional analogue (see
  @prob:multivariate-power-difference[] for a possible answer).

  c) Choose several identities from @ch:univariate-sums[Chapter], write
  multidimensional analogues, and try to find combinatorial interpretations of
  them.
] <prob:power-difference-identities>
#index-mark(
  [@prob:power-difference-identities],
  group: [Identities],
)[Govindarajulu and Suzuki]
