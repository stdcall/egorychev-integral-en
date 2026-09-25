#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source

#source(92, "80")
#problem[
  a) Prove the following identities involving generalized Bernoulli numbers,
  Stirling numbers, and Euler numbers #bib-ref(
    "Egorychev1974c",
  ). Use the conventions of #link(<app:table-m>)[Table M]. In particular,
  $s_(1)$ denotes the signed Stirling numbers of the first kind.
  $
    sum_(k=r)^n B_(k-r)s_(1)(n-r,k-r)=(-1)^(n-r)frac((n-r)!, n+1-r),
    quad 0<=r<=n;
  $
  $
    sum_(n=0)^m sum_(j=1)^n (-1)^(j-1)frac(n!, j)binom(m, n-j)s_(2)(m,n)
    =m^m, quad m>=1;
  $
  $
    sum_(k=0)^p frac((-1)^(p+k), p!)s_(1)(p,k)p^k=binom(2p-1, p);
  $
  $
    sum_(k=0)^n E_k s_(1)(n,k)
    =n! frac(-(-1-i)^(n+1)-(-1+i)^(n+1), 2^(n+1));
  $
  $
    sum_(k=0)^n s_(2)^((alpha))(n,k,r)B_k^((k+1))=(alpha-r)^n,
    quad r>=1;
  $
  $
    sum_(k=0)^n E_k lr(
      [2s_(1)(n,k)+2n s_(1)(n-1,k)
        +n(n-1)s_(1)(n-2,k)]
    )=0, quad n>=2;
  $
  $
    sum_(k=m)^n binom(n, k)E_(n-k)^((m))s_(2)^((-m))(k,m,4)
    =2^(m+n)s_(2)(n,m), quad 1<=m<=n.
  $
  b) Analyze your proofs of the identities in part a), and formulate new
  identities of the same type.
] <prob:special-number-identities>

#problem[
  _Prove:_

  #metadata((kind: "index-anchor")) <idx:goldberg>
  #index-mark([@idx:goldberg], group: [Identities])[Goldberg]
  #keep-next[a) the identity (#bib-ref("Kaucky1975"), p. 298)]
  $
    sum_(k=1)^n (-1)^(k-1)binom(n, k)sum_(j=1)^(2k)frac(1, j)
    =frac(1, 2n)+frac(2 dot 4 dots (2n-2), 3 dot 5 dots (2n-1)), quad n>1;
  $
  #source(93, "81")
  #keep-next[b) Goldberg's identity #bib-ref("Goldberg1958"), for $n>=1$,]
  $
    n^2 sum_(k=0)^n (-1)^(n+k)frac((n+k-1)!, (n-k)!k!k!)
    sum_(j=1)^(n+k-1)frac(1, j)=1;
  $
  #keep-next[c) the identity (#bib-ref("Kaucky1975"), p. 302), for $n>=1$,]
  $
    sum_(p=1)^n binom(n, p)^2 sum_(j=1)^p frac(1, j)
    =binom(2n, n)lr([sum_(k=1)^n frac(1, k)-sum_(k=n+1)^(2n)frac(1, k)]);
  $
  #keep-next[d) the identity (#bib-ref("Kaucky1975"), p. 306), for $n>=1$,]
  $
    sum_(k=1)^(2n-1) (-1)^(k-1)binom(2n, k)^(-1)sum_(j=1)^k frac(1, j)
    =frac(n, 2(n+1)^2)+frac(1, 2n+2)sum_(k=1)^(2n)frac(1, k).
  $
] <prob:harmonic-identities>

#problem[
  _Prove the trigonometric identities_ (#bib-ref(
    "Gould1972a",
  ), (1.27), (1.28), (1.32), (1.33), and (1.62)):

  #keep-next[a)]
  $
    sum_(k=0)^n binom(n, k)sin(k x)
    =2^n sin(n x/2)(cos(x/2))^n;
  $
  #keep-next[b)]
  $
    sum_(k=0)^n (-1)^k binom(n, k)cos(k x)
    =(-1)^n 2^n (sin(x/2))^n cos(n(x+pi)/2);
  $
  #keep-next[c)]
  $
    sum_(k=0)^(floor(n/2)) binom(n, 2k)sin(k x) \
    =2^(n-1)lr(
      [
        (cos(x/4))^n sin(n x/4)+(-1)^n (sin(x/4))^n sin(n(2pi+x)/4)
      ]
    ).
  $
  #keep-next[d)]
  $
    sum_(k=0)^(floor((n-1)/2)) binom(n, 2k+1)cos((2k+1)x) \
    =2^(n-1)lr(
      [
        (cos(x/2))^n cos(n x/2)-(-1)^n (sin(x/2))^n cos(n(pi+x)/2)
      ]
    ).
  $
  #keep-next[e)]
  $
    sum_(k=0)^(floor(n/2)) (-1)^k binom(n-k, k)(2cos x)^(n-2k)
    =frac(sin((n+1)x), sin x), quad sin x != 0.
  $
] <prob:trigonometric-identities>
