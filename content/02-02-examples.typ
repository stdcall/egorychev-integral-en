#import "statements.typ": example, remark
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(74, "62")
#remark[
  The following sums in #bib-ref("Gould1972a") are applications considered in
  this classification: (1.1)–(1.6), (1.9), (1.10), (1.23)–(1.36), (1.48)–(1.62),
  (1.70)–(1.99), (1.101), (1.105), (1.116), (1.120), (1.129)–(1.131), and
  (1.133), a total of 75 sums. Their parameter choices give the polynomials in
  the table below; $a_1$, $a_3$, $a_4$, and $a_6$ remain free. For these choices
  of $a_2$ and $a_5$, the roots of $P(w)$ are readily determined.

  #block(sticky: true)[In particular, this analysis gives the identity]
  $
    sum_(k=0)^(floor((n l+b-a)/r))binom(n l+b, k r+a)x^(a+k r)
    =frac(1, r)sum_(j=1)^(r)(1+omega_r^j x)^(n l+b)(omega_r^j)^(-a).
  $
  Here $r>=1$ is an integer, $omega_r=e^(2pi i/r)$, $0<=a<r$ is an integer, and
  $n l+b$ is a nonnegative integer. An empty sum is zero. The identity holds for
  every complex $x$: expand each power and use
  $r^(-1)sum_(j=1)^r omega_r^(j(t-a))=1$ when $t equiv a$ modulo $r$, and zero
  otherwise. It includes identities (1.1), (1.2), (1.24)–(1.34), (1.53)–(1.59),
  (1.87)–(1.91), (1.93)–(1.97), (1.99), and (1.101) in #bib-ref("Gould1972a").

  #source(75, "63")
  #[
    #set par(justify: false)
    #table(
      columns: (0.5fr, 1.2fr, 1.9fr, 2.5fr),
      inset: 5pt,
      stroke: 0.4pt,
      align: (center, center, center, left),
      table.header(
        [No.],
        [Values of\ $a_2,a_5$],
        [Polynomial\ $P(w)$],
        [Identities in #bib-ref("Gould1972a")],
      ),
      [1],
      [$a_2=0$\ $a_5=1$],
      [$w-x$],
      [(1.1), (1.2), (1.4)–(1.6), (1.9), (1.24)–(1.30), (1.35), (1.36),
        (1.83)–(1.86), (1.131)],

      [2],
      [$a_2=1$\ $a_5=0$],
      [$1-x(1+w)$],
      [(1.3), (1.10), (1.23), (1.48)–(1.52), (1.78)–(1.81), (1.116), (1.130),
        (1.133)],

      [3],
      [$a_2=0$\ $a_5=2$],
      [$w^2-x$],
      [(1.31)–(1.34), (1.82), (1.87)–(1.99), (1.101)],

      [4], [$a_2=2$\ $a_5=0$], [$1-x(1+w)^2$], [(1.129)],
      [5], [$a_2=0$\ $a_5=3$], [$w^3-x$], [(1.56), (1.57)],
      [6], [$a_2=1$\ $a_5=2$], [$w^2-x(1+w)$], [(1.60)–(1.62), (1.70)–(1.77)],
      [7], [$a_2=2$\ $a_5=1$], [$w-x(1+w)^2$], [(1.105)],
      [8], [$a_2=3$\ $a_5=0$], [$1-x(1+w)^3$], [],
      [9], [$a_2=0$\ $a_5=4$], [$w^4-x$], [(1.58), (1.59)],
    ) <table:binomial-polynomials>
  ]

  The following examples illustrate the method. In each, $n$ is a nonnegative
  integer.
]

#example(suffix: [])[
  (#bib-ref("Gould1972a"), Identity (1.94)). Let
  $
    S_n=sum_(k=0)^(n)(-1)^k binom(2n+1, 2k)
    =sum_(k=0)^(infinity)(-1)^k op("res")_w frac((1+w)^(2n+1), w^(2k+1)).
  $
  The extended sum has only finitely many nonzero coefficients. Here
  $m=infinity$, $a_2=0$, and $a_5=2$. By @eq:binomial-infinite-integral,
  $
    S_n=frac(1, 2pi i)integral_Gamma frac(w(1+w)^(2n+1), 1+w^2)dif w,
  $
  #source(76, "64")
  where $Gamma$ is a positively oriented circle of radius greater than $1$,
  enclosing the roots of $P(w)=1+w^2$. Their residues give
  $
    S_n & =frac(1, 2)lr(((1+i)^(2n+1)+(1-i)^(2n+1))) \
        & =2^((2n+1)/2)cos lr(((2n+1)pi/4))
          =(-1)^(floor((n+1)/2))2^n.
  $
] <ex:alternating-even-binomial>

#example(suffix: [])[
  (#bib-ref("Gould1972a"), Identity (1.79)). Let
  $
    S_n=sum_(k=0)^n binom(n+k, k)2^(-k).
  $
  #keep-next[
    Here $m=n$, $a_2=a_5=1$, and $N_1=n$, $N_2=0$. Formula
    @eq:binomial-finite-integral gives
  ]
  $
    S_n & =frac(1, 2pi i)integral_Gamma frac(2(1+w)^n, w-1)dif w \
        & quad -frac(2^(-n), 2pi i)integral_Gamma
          frac((1+w)^(2n+1), w^(n+1)(w-1))dif w.
  $
  Take $Gamma$ to be a small positively oriented circle about zero, excluding
  $1$. The first integral vanishes. The tail differential is invariant under
  $w=1/z$, since its exponents satisfy $(2n+1)+2(-n-1)+1=0$. This is case II.8
  of @th:binomial-sum-classification, with $a_4=0$. Hence
  $
    2S_n=frac(2^(-n), 2pi i)integral_gamma
    frac((1+w)^(2n+1), w^(n+1)(w-1))dif w,
  $
  #keep-next[
    where $gamma$ is a small positively oriented circle about $w=1$. Therefore
  ]
  $
    S_n=2^(-n-1)2^(2n+1)=2^n.
  $

  We next give an identity from #link(<table:binomial-polynomials>)[row 8 of the
    table] that is not among the identities in #bib-ref("Gould1972a").
] <ex:halved-binomial-sum>

#example[
  For $abs(x)<1$, let
  $
    S_n=sum_(k=0)^infinity binom(n+3k, n)x^(3k).
  $
  At $x=0$ the sum is $1$. For $0<abs(x)<1$, take a small positively oriented
  circle $Gamma$ about zero such that $abs(x)(1+abs(w))<1$ on it. Then
  $
    S_n=frac(1, 2pi i)integral_Gamma
    frac((1+w)^n, w^(n+1)(1-x^(3)(1+w)^3))dif w.
  $
  Put $omega=-1/2+i sqrt(3)/2$, so $omega^2=-1/2-i sqrt(3)/2$. The exterior
  poles are $w=(omega^j x)^(-1)-1$, $j=0,1,2$. The residue at each is
  $-frac(1, 3)(1-omega^j x)^(-n-1)$, and the differential is regular at
  infinity. The residue theorem therefore gives
  $
    S_n=frac((-1)^(n+1), 3)sum_(j=0)^(2)(omega^j x-1)^(-n-1).
  $
  #source(77, "65")
  #keep-next[
    Equivalently, we obtain the identity
  ]
  #eq(
    $
      sum_(k=0)^infinity binom(n+3k, n)x^(3k)
      =frac(1, 3)sum_(j=0)^2 frac(1, (1-omega^j x)^(n+1)).
    $,
  ) <eq:cubic-root-filter>
] <ex:cubic-root-filter>
