#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(195, "183")
#problem[
  Prove:

  a) Lee's identity (#bib-ref("Kaucky1975"), p. 68, Problem 44), for $n>=2$:
  #eq(
    $
      sum_(r=1)^n (-1)^(r-1)frac(1, r)
      sum_(i=0)^r (-1)^(r-i)binom(r, i)i^n=0;
    $,
  ) <eq:stirling-log-cancellation>
  #index-mark([@eq:stirling-log-cancellation], group: [Identities])[Lee]
  #keep-next[b) Gould's identity #bib-ref("Gould1960"), for $n>=1$:]
  #eq(
    $
      sum_(k=0)^n (-1)^k binom(n, k)binom(n+k-1, k)
      sum_(j=1)^(n+k-1)frac(1, j)=frac((-1)^n, n);
    $,
  ) <eq:harmonic-alternating-convolution>
  #keep-next[
    c) The identity (#bib-ref("Kaucky1975"), p. 61, Problem 9), for $m,n>=0$:
  ]
  #eq(
    $
      sum_(nu=0)^n sum_(mu=0)^m (-1)^(nu+mu)
      binom(n, n-nu)binom(m, m-mu)binom(mu+nu, nu)=delta_(m n);
    $,
  ) <eq:binomial-double-orthogonality>
  #source(196, "184")
  #keep-next[d) The identity (#bib-ref("Kaucky1975"), p. 309), for $n>=1$:]
  #eq(
    $
      sum_(k=1)^(2n-1)(-1)^(k-1)binom(2n-1, k)^(-1)
      sum_(j=1)^k frac(1, j)
      =frac(2n, 2n+1)sum_(k=1)^(2n)frac(1, k);
    $,
  ) <eq:reciprocal-binomial-harmonic-sum>
  #keep-next[
    e) The identity (#bib-ref("Kaucky1975"), p. 446, Problem 93), for $N>=0$:
  ]
  #eq(
    $
      sum_(r=0)^N sum_(s=0)^N frac((N+m)!, r!s!(N-M)!)
      =sum_(r=0)^N frac((N+r+1)!, r!(r+1)!(N-r)!),
    $,
  ) <eq:factorial-double-sum>
  where $m=min(r, s)$ and $M=max(r, s)$ in the double sum.
] <prob:stirling-log-cancellation>

#problem[
  Prove the identity #bib-ref("Egorychev1974d"): #eq(
    $
      & sum_(k_1=0)^(m_1) dots sum_(k_s=0)^(m_s)
        (-1)^(abs(k))lr((sum_(i=1)^s beta_i k_i))^(abs(m))
        product_(i=1)^s binom(m_i, k_i) \
      & =(-1)^(abs(m))abs(m)!product_(i=1)^s beta_i^(m_i),
    $,
  ) <eq:multivariate-power-difference>
  where $s>=1$, $m=(m_1,dots,m_s)$ has nonnegative integer components,
  $k=(k_1,dots,k_s)$, $abs(m)=sum_(i=1)^s m_i$, $abs(k)=sum_(i=1)^s k_i$, and
  $beta_1,dots,beta_s$ are arbitrary complex numbers. Interpret a zeroth power
  as $1$.
] <prob:multivariate-power-difference>

#problem[
  Prove Singhal's identities #bib-ref("Singhal1972").
] <prob:singhal-identities>

#problem[
  Prove the identities (#bib-ref("Gould1972a"), Identities X.3–X.5), for
  positive integers $p,r$ and complex $x,y$: #eq(
    $
      sum_(k=0)^(r p-r+1)binom(x+k-1, r p)
      sum_(j=0)^(k-1)(-1)^j binom(r p+1, j)binom(k+r-j-1, r)^p \
      =binom(x, r)^p,
    $,
  ) <eq:binomial-power-expansion>
  #eq(
    $
      sum_(k=0)^(r p)(-1)^k binom(r p+1, k)binom(r p-k+y+r-1, r)^p
      =binom(1-y, r)^p,
    $,
  ) <eq:binomial-power-reflection>
  #eq(
    $
      sum_(k=0)^(r p-r+1)(-1)^k binom(r p+1, k)binom(r p-k, r)^p=1.
    $,
  ) <eq:binomial-power-normalization>
  The inner sum in the $k=0$ term of @eq:binomial-power-expansion is empty.
] <prob:binomial-power-expansion>

#problem[
  Prove:

  a) The identity (#bib-ref("Kaucky1975"), p. 68), for positive integers $n,k$:
  #eq(
    $
      sum_(k_1+dots+k_n=k \ k_1+2k_2+dots+n k_n=n)
      frac(1, k_1!k_2!dots k_n!)
      =frac(1, k!)binom(n-1, k-1),
    $,
  ) <eq:composition-factorial-sum>
  where all $k_i$ are nonnegative integers.

  #keep-next[
    b) Carlitz's identities (#bib-ref("Kaucky1975"), pp. 92 and 165):
  ]
  #eq(
    $
      S_n=sum_(i+j+k=n)binom(i+j, i)binom(j+k, j)binom(k+i, k)
      =sum_(i=0)^n binom(2i, i), quad n>=0,
    $,
  ) <eq:cyclic-binomial-diagonal-sum>
  #index-mark([@eq:cyclic-binomial-diagonal-sum], group: [Identities])[Carlitz]
  #eq(
    $
      S_n-S_(n-1)=binom(2n, n), quad n>=1,
    $,
  ) <eq:cyclic-binomial-recurrence>
  #index-mark([@eq:cyclic-binomial-recurrence], group: [Identities])[Carlitz]
  #eq(
    $
      R_(m,n)-2R_(m-1,n-1)=binom(m+n, n), quad m,n>=1,
    $,
  ) <eq:double-binomial-recurrence>
  #index-mark([@eq:double-binomial-recurrence], group: [Identities])[Carlitz]
  #source(197, "185")
  where
  $
    R_(m,n)=sum_(i+j+k<=min(m, n))
    binom(i+j, j)binom(j+k, k)binom(m-i-j, k)binom(n-j-k, i),
    quad m,n>=0.
  $
  The indices $i,j,k$ in these sums are nonnegative integers.
] <prob:composition-factorial-sum>
