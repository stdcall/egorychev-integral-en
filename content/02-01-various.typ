#import "index-style.typ": index-mark
#import "statements.typ": example, remark, solution
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, res, source

#source(63, "51")
#heading(level: 3)[Various sums] <sec:various-sums>

The following examples use different properties of $res$ from
§@sec:residue-rules to compute combinatorial sums.

#example(title: [])[
  Compute the sum of Le-Jen Shoo. #eq(
    $
      S=S_(n,m)=sum_(k=0)^m binom(m, k)^2 binom(n+2m-k, 2m).
    $,
  ) <eq:squared-binomial-sum>
  Here $m$ and $n$ are nonnegative integers.
] <ex:squared-binomial-sum>

#solution[
  We have
  $
    S & =sum_(k=0)^m res_u frac((1+u)^m, u^(k+1))
        res_v frac((1+v)^m, v^(m-k+1))
        res_w frac((1+w)^(n+2m-k), w^(2m+1)) \
      & =res_(v w) lr(
          (
            (1+v)^(m)(1+w)^(m+n)(1+v+w)^m v^(-m-1)w^(-2m-1)
          )
        ),
  $
  #source(64, "52")
  where the last step uses the substitution rule. Extracting the coefficients
  with respect to $w$ and then $v$ gives
  $
    S & =res_v (1+v)^m v^(-m-1)lr(
          (
            sum_(k=m)^(2m) binom(m+n, k)binom(m, 2m-k)(1+v)^(k-m)
          )
        ) \
      & =sum_(k=m)^(2m) binom(m+n, k)binom(m, 2m-k)binom(k, m) \
      & =binom(m+n, n)sum_(k=0)^m binom(m, m-k)binom(n, k) \
      & =binom(m+n, n)^2.
  $
  #block(sticky: true)[
    Thus we obtain another proof of Shoo's well-known identity (see, for
    example, #bib-ref("Kaucky1975"), pp. 171–193):
  ]
  #eq(
    $
      sum_(k=0)^m binom(m, k)^2 binom(n+2m-k, 2m)=binom(m+n, n)^2.
    $,
  ) <eq:squared-binomial-value>
  #index-mark([@eq:squared-binomial-value], group: [Identities])[Le-Jen Shoo]
  This proof is essentially a regrouping of the terms in
  @eq:squared-binomial-sum. It seems somewhat artificial, since it does not
  explain why the sum is the square $binom(m+n, n)^2$. Another proof in
  §@sec:splitting-integrals, using the “splitting” method, will help answer this
  question. Various authors have reproved and generalized Shoo's identity.
]

#example(title: [])[
  The Moriarty identities: #eq(
    $
      sum_(k=0)^n (-1)^k binom(k, a)binom(n+k, 2k)2^(2k)
      &=(-1)^n binom(n+a, 2a)2^(2a)frac(2n+1, 2a+1), \
      sum_(k=0)^n (-1)^k binom(k, a)binom(n+k, 2k+1)2^(2k)
      &=(-1)^(n-1)binom(n+a, 2a+1)2^(2a), \
      sum_(k=0)^n (-1)^k binom(k, a)binom(n+k, 2k)2^(2k)frac(n, n+k)
      &=(-1)^n binom(n+a, 2a)2^(2a)frac(n, n+a), \
      sum_(k=0)^n (-1)^k binom(k, a)binom(n+k, 2k)2^(2k)frac(2n+1, 2k+1)
      &=(-1)^n binom(n+a, 2a)2^(2a).
    $,
  ) <eq:davis-identities>
  #index-mark([@eq:davis-identities], group: [Identities])[Davis]
  #index-mark([@eq:davis-identities], group: [Identities])[Moriarty]
  Here $n$ is a positive integer and $a$ is an integer with $0<=a<n$.

  These are identities of Davis, who called them the Moriarty identities. In his
  recent articles #bib-ref("Gould1972c") and #bib-ref("Gould1974"), Gould traces
  connections between @eq:davis-identities and many combinatorial identities and
  pairs of inverse binomial relations previously studied by other authors.

  #source(65, "53")
] <ex:davis-identities>

#solution[
  Let us prove the first identity in @eq:davis-identities. We have
  $
    S_n & =sum_(k=0)^n (-4)^k binom(k, a)binom(n+k, 2k) \
        & =sum_(k=0)^infinity (-4)^k frac(1, 2pi i)
          integral_(abs(w)=rho_1) frac((1+w)^k dif w, w^(a+1)) \
        & quad times frac(1, 2pi i)
          integral_(abs(v)=rho_2) frac((1+v)^(n+k)dif v, v^(2k+1)).
  $
  Take, for example, $rho_1=1/7$ and $rho_2=6$, with both circles positively
  oriented. The terms with $k>n$ vanish after coefficient extraction, and on
  these circles the geometric ratio has modulus at most $8/9$. Summing over $k$
  gives
  $
    S_n=frac(1, (2pi i)^2)
    integral_(abs(w)=rho_1)integral_(abs(v)=rho_2)
    frac(
      (1+v)^n v dif v dif w,
      w^(a+1)(v^2+4(1+v)(1+w))
    ).
  $
  In general, the radii must satisfy $abs(4(1+v)(1+w))<abs(v^2)$ on the
  integration torus. With the radii chosen above, the other $w$-pole lies
  outside $abs(w)=rho_1$. The residue at $w=0$ therefore gives
  $
    S_n & =frac(4^(a)(-1)^a, 2pi i)
          integral_(abs(v)=rho_2) frac((1+v)^(n+a)v, (v+2)^(2a+2))dif v \
        & =2^(2a)(-1)^n binom(n+a, 2a)frac(2n+1, 2a+1).
  $
  The last integral is evaluated at its pole $v=-2$. The remaining identities in
  @eq:davis-identities are proved similarly.
]

#remark[
  In §@sec:hypergeometric-summation we prove two Moriarty identities closely
  related to @eq:davis-identities. Andrews #bib-ref("Andrews1974") proved them
  using summation formulas for the hypergeometric function $F(a,b;c;z)$.
  Moriarty identities often arise in the computation of trigonometric sums.
]

#example(title: [])[
  Compute the trigonometric sum
  $
    S_n=sum_(k=0)^(floor(n/2))binom(n, k)cos((n-2k)x),
  $
  where $n$ is a nonnegative integer and $x$ is real.
] <ex:trigonometric-sum>

#solution[
  Let $a_k$ denote the summand. Since $a_k=a_(n-k)$, we have #eq(
    $
      sum_(k=0)^(floor(n/2))binom(n, k)cos((n-2k)x) \
      =frac(1, 2)sum_(k=0)^n binom(n, k)cos((n-2k)x)
      +frac(1+(-1)^n, 4)binom(n, n/2).
    $,
  ) <eq:cosine-sum-symmetry>
  #index-mark([@eq:cosine-sum-symmetry], group: [Identities])[Davis]
  #index-mark([@eq:cosine-sum-symmetry], group: [Identities])[Moriarty]
  #keep-next[
    The final term is taken as zero for odd $n$, so its binomial coefficient is
    needed only when $n$ is even. By the substitution rule,
  ]
  #eq(
    $
      sum_(k=0)^n binom(n, k)cos((n-2k)x)
      &=sum_(k=0)^n op("Re")(e^(i(n-2k)x))
      res_w frac((1+w)^n, w^(k+1)) \
      &=op("Re")lr(
        (e^(i n x)lr(
            (sum_(k=0)^n (e^(-2i x))^k
              res_w frac((1+w)^n, w^(k+1)))
          ))
      ) \
      &=op("Re")lr((e^(i n x)(1+e^(-2i x))^n)) \
      &=op("Re")lr(((e^(i x)+e^(-i x))^n))=2^n cos^n x.
    $,
  ) <eq:cosine-full-sum>
  #source(66, "54")
  Combining @eq:cosine-sum-symmetry and @eq:cosine-full-sum gives the identity
  (#bib-ref(
    "Gould1972a",
  ), (1.30)) #eq(
    $
      sum_(k=0)^(floor(n/2))binom(n, k)cos((n-2k)x)
      =2^(n-1)cos^n x+frac(1+(-1)^n, 4)binom(n, n/2).
    $,
  ) <eq:cosine-partial-sum>
]
