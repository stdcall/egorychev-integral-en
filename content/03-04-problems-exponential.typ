#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, source
#import "statements.typ": problem

#source(119, "107")
#problem(suffix: [])[
  (Exponential inverse relations, #bib-ref("Riordan1968"), Table 3.3).

  $
    a_m & =sum_(k=0)^(floor(m/2))binom(m, 2k)b_(m-2k), \
    b_m & =sum_(k=0)^(floor(m/2))binom(m, 2k)E_(2k)a_(m-2k).
  $

  #source(120, "108")
] <prob:exponential-inverse-pairs>
#index-mark([@prob:exponential-inverse-pairs], group: [Pairs of inverse linear
  relations])[Exponential type]

#problem[
  Invert the following systems of relations (exponential, #bib-ref(
    "Riordan1968",
  ), Table 3.3).

  *1.*
  $ a_m=sum_(k=0)^(floor(m/2))binom(m, 2k)(2k+1)^(-1)b_(m-2k). $
  *2.*
  $ a_m=sum_(k=0)^(floor(m/2))binom(m+1, 2k+1)b_(m-2k). $
  *3.*
  $
    a_m=sum_(k=0)^(floor(m/2))binom(m, 2k)binom(2k+2, 2)^(-1)b_(m-2k).
  $
  *4.*
  $ a_m=sum_(k=0)^(floor(m/2))binom(m+2, 2k+2)b_(m-2k). $
  *5.*
  $
    a_m=sum_(k=0)^(floor(m/2))binom(m, 2k)binom(2k+3, 3)^(-1)b_(m-2k).
  $
  *6.*
  $ a_m=sum_(k=0)^(floor(m/2))binom(m+3, 2k+3)b_(m-2k). $
] <prob:exponential-inversion>
#index-mark([@prob:exponential-inversion], group: [Pairs of inverse linear
  relations])[Exponential type]

#problem[
  Using the method of @sec:multivariate-inversion, write down some
  multidimensional analogues of the inverse pairs in @sec:univariate-inversion
  and Problems @prob:binomial-inverse-pairs[]–@prob:exponential-inversion[], and
  partially invert some of them.#footnote[
    Many results of this kind can be found in L. Ya. Dubinskaya's master's
    thesis, _The Bürmann–Lagrange series (multidimensional case) and its use in
    combinatorial analysis_, completed under the author's supervision at
    Krasnoyarsk State University in 1974.
  ]
] <prob:multivariate-inverse-pairs>
#index-mark([@prob:multivariate-inverse-pairs], group: [Pairs of inverse linear
  relations])[Two-index type]

#problem[
  Find suitable functional relations to prove the equivalence of each of the
  following pairs of systems, and show that they are of type $F_n^1$.

  a) The simplest polynomial relation (#bib-ref("Riordan1968"), Chapter 3, (29),
  and also #bib-ref("Bizley1960", "Hsu1954")):
  $
    a_r & =sum_(0<=k<=r)b_k product_(j=1)^n binom(r_j, k_j)(-1)^(k_j), \
    b_r & =sum_(0<=k<=r)a_k product_(j=1)^n binom(r_j, k_j)(-1)^(k_j),
          quad r>=0.
  $

  #block(sticky: true)[
    b) The two-index Chebyshev relation (#bib-ref("Riordan1968"), Chapter 3,
    (30)):
  ]
  $
    a_(r m) & =sum_(nu=0)^(floor(r/2))sum_(k=0)^(floor(m/2))
              binom(r, nu)binom(m, k)b_(r-2nu,m-2k), \
    b_(r m) & =sum_(nu=0)^(floor(r/2))sum_(k=0)^(floor(m/2))(-1)^(nu+k)
              frac(r, r-nu)binom(r-nu, nu) \
            & quad times frac(m, m-k)binom(m-k, k)a_(r-2nu,m-2k).
  $
  At $(r,nu)=(0,0)$ and $(m,k)=(0,0)$, interpret the corresponding fraction
  times binomial coefficient as $1$.

  #block(sticky: true)[
    c) The two-index Chebyshev relation (#bib-ref("Riordan1968"), Chapter 3,
    (31)):
  ]
  $
    a_(r m) & =sum_(nu=0)^(floor(r/2))sum_(k=0)^m (-1)^k
              binom(r, nu)binom(m, k)b_(r-2nu,k), \
    b_(r m) & =sum_(nu=0)^(floor(r/2))sum_(k=0)^m (-1)^(nu+k)
              frac(r, r-nu)binom(r-nu, nu)binom(m, k)a_(r-2nu,k),
  $
  with the same convention at $(r,nu)=(0,0)$.

  #source(121, "109")
  #block(sticky: true)[
    d) The simplest polynomial relation (#bib-ref("Riordan1968"), p. 116):
  ]
  $
    a_(r m) & =b_(r m)-b_(r-1,m)-b_(r,m-1)+b_(r-1,m-1), \
    b_(r m) & =sum_(nu=0)^r sum_(k=0)^m a_(nu k).
  $
  Here $b_(r m)=0$ if either index is negative.
] <prob:functional-pair-equivalence>
