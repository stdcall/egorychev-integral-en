#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "statements.typ": problem

#source(116, "104")
#heading(level: 2)[Problems] <sec:inversion-problems>

#problem[
  Give complete proofs of @th:polynomial-matrix-inclusion,
  @th:matrix-generating-relation and @th:matrix-decomposition in the
  one-dimensional case.


  In Problems @prob:binomial-inverse-pairs[]–@prob:exponential-inverse-pairs[],
  as in @th:classical-inverse-pairs, show that each displayed pair consists of
  inverse relations of type $F_1^q$, or is the adjoint of a pair of this type.
  For every relation marked with an asterisk, also derive it from an adjoint
  pair and, independently, invert it by finding appropriate functional
  relations.

  All sequence indices are nonnegative. Use the polynomial convention for
  binomial coefficients, with value $0$ for a negative lower index. For
  upper-triangular systems, take finitely supported sequences so that the sums
  are defined. In each finite sum, omit terms whose sequence index is negative.
] <prob:univariate-matrix-proofs>
#index-mark(
  [@prob:univariate-matrix-proofs],
  group: [Pairs of inverse linear relations],
  after: [Ordinary type],
)[Chebyshev type]

#problem(suffix: [])[
  (#bib-ref("Riordan1968"), Table 2.1).


  *1.*
  $
    a_m=sum_(k=0)^m binom(m, k)b_k, quad
    b_m=sum_(k=0)^m (-1)^(k+m)binom(m, k)a_k.
  $
  *2.*
  $
    a_m=sum_(k=0)^m binom(p-k, m-k)b_k, quad
    b_m=sum_(k=0)^m (-1)^(k+m)binom(p-k, m-k)a_k.
  $
  *3.*
  $
    a_m & =sum_(k=1)^m frac(m!, k!)binom(m-1, k-1)b_k, \
    b_m & =sum_(k=1)^m (-1)^(k+m)frac(m!, k!)binom(m-1, k-1)a_k,
          quad m=1,2,dots.
  $
] <prob:binomial-inverse-pairs>

#problem(suffix: [])[
  (Chebyshev, #bib-ref("Riordan1968"), Table 2.3).


  *1.*
  $
    a_m & =sum_(k=0)^(floor(m/2))binom(m, k)b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))(-1)^k
          lr([binom(m-k, k)+binom(m-k-1, k-1)])a_(m-2k).
  $
  *2.*
  $
    a_m & =sum_(k=0)^(floor(m/2))
          lr([binom(m, k)-binom(m, k-1)])b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))(-1)^k binom(m-k, k)a_(m-2k).
  $
  #source(117, "105")
  *3.* \*
  $
    a_m & =sum_(k=0)^infinity binom(m+2k, k)b_(m+2k), \
    b_m & =sum_(k=0)^infinity (-1)^k
          lr([binom(m+k, k)+binom(m+k-1, k-1)])a_(m+2k).
  $
  *4.* \*
  $
    a_m & =sum_(k=0)^infinity
          lr([binom(m+2k, k)-binom(m+2k, k-1)])b_(m+2k), \
    b_m & =sum_(k=0)^infinity (-1)^k binom(m+k, k)a_(m+2k).
  $
  *5.*
  $
    a_m & =sum_(k=0)^m binom(m-k, k)b_(m-k), \
    b_m & =sum_(k=0)^m (-1)^k
          lr([binom(m+k-1, k)-binom(m+k-1, k-1)])a_(m-k).
  $
  *6.*
  $
    a_m & =sum_(k=0)^m
          lr([binom(m+1-k, k)+binom(m-k, k-1)])b_(m-k), \
    b_m & =sum_(k=0)^m (-1)^k binom(m+k, k)a_(m-k).
  $
] <prob:chebyshev-even-inversion>

#problem(suffix: [])[
  (Chebyshev, #bib-ref("Riordan1968"), Table 2.4). Here

  $
    a_m=sum_k A_(m,k)b_(m+c k), quad
    b_m=sum_k (-1)^k B_(m,k)a_(m+c k),
  $
  and $c$ is a nonzero integer. The sums run over $k>=0$ with $m+c k>=0$. For
  $c>0$, use finitely supported sequences as above.

  *1.*
  $
    A_(m,k) & =binom(m, k), \
    B_(m,k) & =binom(m+c k+k, k)-(c+1)binom(m+c k+k-1, k-1).
  $
  *2.*
  $
    A_(m,k) & =binom(m, k)+(c+1)binom(m, k-1), \
    B_(m,k) & =binom(m+c k+k, k).
  $
  *3.* \*
  $
    A_(m,k) & =binom(m+c k, k), \
    B_(m,k) & =binom(m-1+k, k)+c binom(m-1+k, k-1).
  $
  *4.* \*
  $
    A_(m,k) & =binom(m+c k, k)-(c-1)binom(m+c k, k-1), \
    B_(m,k) & =binom(m+k, k).
  $
] <prob:chebyshev-step-inversion>
#index-mark(
  [@prob:chebyshev-step-inversion],
  group: [Pairs of inverse linear relations],
  after: [Ordinary type],
)[Chebyshev type]
