#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(194, "182")
#heading(level: 2)[Problems] <sec:multivariate-problems>

#problem[
  Prove formula @eq:carlitz-common-generating-function.
] <prob:carlitz-generating-function>

#problem[
  Prove the following identities. Binomial coefficients have their generalized
  meaning, and vanish for negative integer lower indices. All discrete indices
  below are integers.

  a) The Fjeldstad identity (#bib-ref("Gould1972a"), (6.1)), for $n,x,z>=0$:
  #eq(
    $
      sum_(k=0)^(2n) (-1)^k binom(2n, k)binom(2x, x-n+k)binom(2z, z-n+k) \
      =(-1)^n frac(
        (n+x+z)!(2n)!(2x)!(2z)!,
        (n+x)!(n+z)!(x+z)!n!x!z!
      ).
    $,
  ) <eq:dixon-factorial-identity>
  #index-mark([@eq:dixon-factorial-identity], group: [Identities])[Fjeldstad]

  #source(195, "183")
  #keep-next[
    b) Nanjundiah's identity (#bib-ref("Gould1972a"), (6.17)), for $m,n>=0$ and
    complex $x,y$:
  ]
  #eq(
    $
      sum_(k=0)^n binom(m-x+y, k)binom(n+x-y, n-k)binom(x+k, m+n)
      =binom(x, m)binom(y, n),
    $,
  ) <eq:shifted-binomial-product-identity>
  #index-mark(
    [@eq:shifted-binomial-product-identity],
    group: [Identities],
  )[Nanjundiah]
  #keep-next[
    and Surányi's identity (#bib-ref("Gould1972a"), (6.19)), for $n,r>=0$ and
    complex $x$:
  ]
  #eq(
    $
      sum_(k=0)^n binom(n, k)binom(r, k)binom(x+n+r-k, n+r)
      =binom(x+r, r)binom(x+n, n).
    $,
  ) <eq:carlitz-product-specialization>
  #index-mark(
    [@eq:carlitz-product-specialization],
    group: [Identities],
  )[Surányi]

  #keep-next[
    c) Riordan's identities (#bib-ref("Gould1972a"), (6.44) and (6.45)), for
    $m,n>=0$ and complex $x$:
  ]
  #eq(
    $
      sum_(k=0)^n binom(n, k)binom(m+n-k, m-k)binom(x, m+n-k)
      =binom(x, m)binom(x, n),
    $,
  ) <eq:binomial-product-trinomial>
  #index-mark([@eq:binomial-product-trinomial], group: [Identities])[Riordan]
  #eq(
    $
      sum_(k=0)^n binom(n, k)binom(m, n-k)binom(x+n-k, n+m)
      =binom(x, m)binom(x, n).
    $,
  ) <eq:binomial-product-shifted>
  #index-mark([@eq:binomial-product-shifted], group: [Identities])[Riordan]

  #keep-next[
    d) Gould's identity (#bib-ref("Gould1972a"), (6.52)), for $a,b>=0$ and
    complex $x,y$:
  ]
  #eq(
    $
      sum_(k=0)^(min(a, b)) binom(x+y+k, k)binom(y, a-k)binom(x, b-k)
      =binom(x+a, b)binom(y+b, a).
    $,
  ) <eq:binomial-product-symmetric>
  #index-mark([@eq:binomial-product-symmetric], group: [Identities])[Gould]

  #keep-next[
    e) Van Ebbenhorst Tengbergen's identity (#bib-ref("Gould1972a"), (6.50)),
    for $1<=a<=n$:
  ]
  #eq(
    $
      sum_(k=a)^n binom(k+a-1, k)binom(2n, n-k)binom(k, a)
      =binom(2n-1, n)binom(n, a).
    $,
  ) <eq:positive-binomial-convolution>
  #index-mark([@eq:positive-binomial-convolution], group: [Identities])[Van
    Ebbenhorst Tengbergen]

  #keep-next[
    f) Bizley's identities #bib-ref("Bizley1970"), for $m,n>=0$, arbitrary
    integer $k$ and complex $p$:
  ]
  #eq(
    $
      sum_(i=0)^m binom(m, i)binom(n, k-i)binom(p+i, m+n)
      =binom(p, m+n-k)binom(p-n+k, k),
    $,
  ) <eq:bizley-convolution>
  #index-mark([@eq:bizley-convolution], group: [Identities])[Bizley]
  #eq(
    $
      sum_(i=0)^m binom(m, i)binom(n, i-k)binom(p+i, m+n)
      =binom(p, m-k)binom(p+k, n+k).
    $,
  ) <eq:bizley-shifted-convolution>
  #index-mark([@eq:bizley-shifted-convolution], group: [Identities])[Bizley]
] <prob:dixon-factorial-identity>
