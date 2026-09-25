#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "main-defs.typ": bib-ref, source

#source(117, "105")
#problem(suffix: [])[
  (Legendre, #bib-ref("Riordan1968"), Table 2.5).


  *1.*
  $
    a_m & =sum_(k=0)^m binom(m+p+k, m-k)b_k, \
    b_m & =sum_(k=0)^m (-1)^(k+m)
          lr([binom(2m+p, m-k)-binom(2m+p, m-k-1)])a_k.
  $
  #source(118, "106")
  *2.*
  $
    a_m & =sum_(k=0)^m binom(2m+p, m-k)b_k, \
    b_m & =sum_(k=0)^m (-1)^(k+m)
          lr([binom(m+p+k, m-k)+binom(m+p+k-1, m-k-1)])a_k.
  $
  *3.*
  $
    a_m & =sum_(k=0)^(floor(m/2))
          lr([binom(2m+p, k)-3binom(2m+p, k-1)])b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))(-1)^k binom(2m+p-3k, k)a_(m-2k).
  $
] <prob:legendre-inversion>
#index-mark([@prob:legendre-inversion], group: [Pairs of inverse linear
  relations])[Legendre type]

#problem(suffix: [])[
  (Legendre–Chebyshev, #bib-ref("Riordan1968"), Table 2.6). Here

  $
    a_m=sum_k A_(m,k)b_k, quad b_m=sum_k (-1)^(m+k)B_(m,k)a_k,
  $
  and $c$ is a nonzero integer. In parts 1 and 2, sum over $0<=k<=m$; in part 3,
  sum over $k>=m$ on finitely supported sequences.

  *1.*
  $
    A_(m,k) & =binom(c k+p, m-k), \
    B_(m,k) & =binom(c m+m+p-k-1, m-k)-c binom(c m+m+p-k-1, m-1-k).
  $
  *2.*
  $
    A_(m,k) & =binom(c m+p, m-k)-(c-1)binom(c m+p, m-1-k), \
    B_(m,k) & =binom(c k+m+p-k, m-k).
  $
  *3.* \*
  $
    A_(m,k) & =binom(c k+p, k-m)-(c-1)binom(c k+p, k-m-1), \
    B_(m,k) & =binom(c m-m+p+k, k-m).
  $
] <prob:legendre-chebyshev-inversion>
#index-mark([@prob:legendre-chebyshev-inversion], group: [Pairs of inverse
  linear relations])[Legendre–Chebyshev type]
