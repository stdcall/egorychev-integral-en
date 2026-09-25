#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "main-defs.typ": bib-ref, source

#source(118, "106")
#problem(suffix: [])[
  (Abel, #bib-ref("Riordan1968"), Table 3.1). Here

  $
    a_m=sum_(k=0)^m binom(m, k)A_(m,k)b_k, quad
    b_m=sum_(k=0)^m (-1)^(k+m)binom(m, k)B_(m,k)a_k.
  $
  Interpret the apparent singularities by polynomial continuation; all diagonal
  coefficients are $1$.

  *1.*
  $
    A_(m,k) & =alpha(alpha+m-k)^(m-k-1), \
    B_(m,k) & =alpha(alpha-m+k)^(m-k-1).
  $
  *2.*
  $
    A_(m,k) & =(alpha+m-k)^(m-k), \
    B_(m,k) & =(alpha^2-m+k)(alpha-m+k)^(m-k-2).
  $
  *3.*
  $
    A_(m,k) & =(alpha+k)^(m-k), \
    B_(m,k) & =(alpha+k)(alpha+m)^(m-k-1).
  $
  *4.*
  $
    A_(m,k) & =(alpha+2m)(alpha+m+k)^(m-k-1), \
    B_(m,k) & =(alpha+2m)(alpha+m+k)^(m-k-1).
  $
  #source(119, "107")
  *5.*
  $
    A_(m,k) & =(alpha+2k)(alpha+m+k)^(m-k-1), \
    B_(m,k) & =(alpha+2k)(alpha+m+k)^(m-k-1).
  $
  *6.*
  $
    A_(m,k) & =(m+k)^(m-k), \
    B_(m,k) & =(m+k(4m-1))(m+k)^(m-k-2).
  $
] <prob:abel-inversion>
#index-mark(
  [@prob:abel-inversion],
  group: [Pairs of inverse linear relations],
  after: [Definition],
)[Abel type]

#problem(suffix: [])[
  (Ordinary inverse relations, #bib-ref("Riordan1968"), Table 3.2).


  *1.*
  $
    a_m & =sum_(k=0)^m binom(p+k, k)b_(m-k), \
    b_m & =sum_(k=0)^m (-1)^k binom(p+1, k)a_(m-k).
  $
  *2.*
  $
    a_m & =sum_(k=0)^(floor(m/q))binom(p+k, k)b_(m-q k), \
    b_m & =sum_(k=0)^(floor(m/q))(-1)^k binom(p+1, k)a_(m-q k).
  $
  Here $q$ is a positive integer.

  *3.*
  $
    a_m=sum_(k=0)^m f_k^((p))b_(m-k), quad
    b_m=sum_(k=0)^m f_k^((-p))a_(m-k).
  $
  *4.*
  $
    a_m & =sum_(k=0)^m binom(2k, k)b_(m-k), \
    b_m & =sum_(k=0)^m frac(1, 1-2k)binom(2k, k)a_(m-k).
  $
  *5.*
  $
    a_m & =sum_(k=0)^m frac(1, k+1)binom(2k, k)b_(m-k), \
    b_m & =a_m-sum_(k=1)^m frac(1, k)binom(2k-2, k-1)a_(m-k).
  $
  *6.*
  $
    a_m & =sum_(k=0)^m binom(2p+2k, p+k)binom(p+k, k)
          binom(2p, p)^(-1)b_(m-k), \
    b_m & =sum_(k=0)^m (-1)^k binom(2p+1, 2k)binom(p+k, k)
          binom(p+k, 2k)^(-1)a_(m-k).
  $
  The ratios in part 6 are interpreted after cancellation, including removable
  parameter values.

  *7.*
  $
    a_m & =sum_(k=0)^(floor(m/2))binom(4k, 2k)b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))frac(8k+1, (2k+1)(1-4k))
          binom(4k, 2k)a_(m-2k).
  $
  *8.*
  $
    a_m & =sum_(k=0)^(floor(m/2))binom(4k+2, 2k+1)b_(m-2k), \
    b_m & =frac(1, 2)a_m-sum_(k=1)^(floor(m/2))
          frac(8k-3, 2k(4k-3))binom(4k-2, 2k-1)a_(m-2k).
  $
  *9.*
  $
    a_m & =sum_(k=0)^(floor(m/2))frac(1, 1-4k)binom(4k, 2k)b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))frac(1, 2k+1)binom(4k, 2k)a_(m-2k).
  $
  Here $f_k^((p))$ are the convoluted Fibonacci numbers, normalized by
  $
    sum_(k>=0)f_k^((p))w^k=(1-w-w^2)^(-p).
  $
  In parts 3–6, $a_(m-k)$ and $b_(m-k)$ may be replaced by $a_(m-q k)$ and
  $b_(m-q k)$, for a positive integer $q$, with the sums restricted to
  nonnegative sequence indices.
] <prob:ordinary-inversion>
#index-mark([@prob:ordinary-inversion], group: [Pairs of inverse linear
  relations])[Ordinary type]
