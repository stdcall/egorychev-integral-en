#import "index-style.typ": index-mark
#import "statements.typ": example
#import "hypergeometric.typ": hyper
#import "q-binomial.typ": qbinom
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(88, "76")
The next example, Dawson's identity (#bib-ref("Riordan1968"), p. 71),
illustrates how reversing a finite sum makes Gauss's second summation theorem
applicable.

#example(title: [], suffix: [*. Proof of Reed Dawson's identity.*])[
  For a nonnegative integer $n$, #eq(
    $
      sum_(k=0)^n (-1)^k binom(n, k)2^(-k)binom(2k, k)
      =cases(
        2^(-2nu)binom(2nu, nu) & "if" n=2nu,
        0 & "if" n "is odd."
      )
    $,
  ) <eq:dawson-identity>
  #index-mark([@eq:dawson-identity], group: [Identities])[Dawson]
  First, @th:factorial-multiplication gives #eq(
    $
      sum_(k=0)^n (-1)^k binom(n, k)2^(-k)binom(2k, k)
      &=sum_(k=0)^n frac((-n)_k (1)_k (1/2)_k 2^k, k! k! k!) \
      &=#hyper($F$, 2, 1, $-n,1/2$, $1$, $2$).
    $,
  ) <eq:dawson-hypergeometric>
  Slater's table in #bib-ref("Slater1966"), Appendix III, gives a summation
  formula with argument $1/2$, whereas the argument here is $2$. Replacing $k$
  by $n-k$ transforms the sum to the required form:
  $
    S & =sum_(k=0)^n (-1)^(n-k)binom(n, k)2^(-n+k)binom(2n-2k, n-k) \
      & =(-1)^n 2^(-n)binom(2n, n)
        sum_(k=0)^n frac((-n)_k (-n)_k (1/2)^k, (-n+1/2)_k k!).
  $
  #source(89, "77")
  Thus Gauss's second summation theorem gives
  $
    S & =(-1)^n 2^(-n)binom(2n, n)
        #hyper($F$, 2, 1, $-n,-n$, $-n+1/2$, $1/2$) \
      & =(-1)^n 2^(-n)binom(2n, n)
        frac(Gamma(1/2)Gamma(1/2-n), Gamma(1/2-n/2)^2).
  $
  The reciprocal gamma factor is zero when $n$ is odd. When $n=2nu$, the
  half-integer gamma values reduce the expression to $2^(-2nu)binom(2nu, nu)$,
  proving @eq:dawson-identity.

  The corresponding $q$-analogue uses an identity of Andrews #bib-ref(
    "Andrews1973",
  ), a $q$-analogue of Gauss's second theorem that was recent at the time of
  writing. For $0<abs(q)<1$ and $a b q != q^(-2j)$, $j=0,1,2,dots$, it states
  #eq(
    $
      sum_(k=0)^infinity
      frac([a]_k [b]_k q^(k(k+1)/2), [q]_k [a b q;q^2]_k)
      =frac(
        [-q]_infinity [a q;q^2]_infinity [b q;q^2]_infinity,
        [a b q;q^2]_infinity
      ).
    $,
  ) <eq:q-gauss-summation>
  Here $[a;q]_infinity=product_(j=0)^infinity (1-a q^j)$.
] <ex:dawson-identity>

#example(title: [], suffix: [*. Proof of the q-analogue of Dawson's
identity.*])[
  For $n>=0$ and $0<abs(q)<1$, #eq(
    $
      sum_(k=0)^n (-1)^k #qbinom($n$, $k$, $q$)
      frac(1, [-q]_k)#qbinom($2k$, $k$, $q$)q^((n-k)(n-k-1)/2) \
      =cases(
        0 & "if" n "is odd,",
        frac(q^(2nu^2), [-q]_nu^2)#qbinom($2nu$, $nu$, $q$) & "if" n=2nu.
      )
    $,
  ) <eq:q-dawson-identity>
  #index-mark([@eq:q-dawson-identity], group: [Identities])[Dawson,
    $q$-analogue]
  Denote the sum by $S$, and reverse its order. Using
  @th:factorial-multiplication and splitting the even and odd factors gives
  $
    S & =sum_(k=0)^n (-1)^(n-k)#qbinom($n$, $k$, $q$)
        frac(1, [-q]_(n-k))#qbinom($2n-2k$, $n-k$, $q$)q^(k(k-1)/2) \
      & =(-1)^n sum_(k=0)^n
        frac(
          [q^(-n)]_k q^(n k)[q]_(2n-2k),
          [q]_k [q]_(n-k)[q^2;q^2]_(n-k)
        ) \
      & =(-1)^n sum_(k=0)^n
        frac([q^(-n)]_k q^(n k)[q;q^2]_(n-k), [q]_k [q]_(n-k)) \
      & =frac((-1)^n [q;q^2]_n, [q]_n)sum_(k=0)^n
        frac([q^(-n)]_k^2 q^(k(k+1)/2), [q]_k [q^(1-2n);q^2]_k).
  $
  Applying @eq:q-gauss-summation with $a=b=q^(-n)$ yields
  $
    S=frac(
      (-1)^n [q;q^2]_n [-q]_infinity
      [q^(1-n);q^2]_infinity^2,
      [q]_n [q^(1-2n);q^2]_infinity
    ).
  $
  When $n$ is odd the numerator product vanishes and the denominator does not.
  For $n=2nu$, reverse the finitely many negative powers in the products and use
  $[-q]_infinity [q;q^2]_infinity=1$. Then
  $
    S=frac(q^(2nu^2)[q;q^2]_nu^2, [q]_(2nu))
    =frac(q^(2nu^2), [-q]_nu^2)#qbinom($2nu$, $nu$, $q$),
  $
  which proves @eq:q-dawson-identity.
] <ex:q-dawson-identity>
