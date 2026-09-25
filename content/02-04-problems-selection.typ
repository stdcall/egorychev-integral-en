#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source

#source(93, "81")
#problem[
  _Prove the identities_ (#bib-ref("Vilenkin1969"), Problems 391c, 393, 428–433,
  436, and 437):

  #keep-next[a)]
  $
    sum_(i=0)^(floor(n/3))binom(n, 2+3i)
    =frac(2^n+2cos((n+2)pi/3), 3);
  $
  #keep-next[b)]
  $
    sum_(i=0)^n frac(binom(n, i)binom(n, k), binom(2n, i+k))
    =frac(2n+1, n+1), quad n>k;
  $
  #source(94, "82")
  #keep-next[c)]
  $
    sum_(i=0)^n (-1)^i binom(n, i)binom(2n-2i, m-2i)
    =2^m binom(n, m), quad 2n>=m;
  $
  #keep-next[d)]
  $
    sum_(i=0)^(floor(m/2))binom(n+i, i)binom(2n+m, 2n+2i)
    =2^(m-1)frac(2n+m, m)binom(m+n-1, n), quad m>=1;
  $
  #keep-next[e)]
  $
    sum_(i=0)^(2m+1) (-2)^i binom(n+i-1, i)
    binom(2n+2m+i, 2m+1-i)=0;
  $
  #keep-next[f)]
  $
    sum_(i=0)^n (-1)^i binom(n, i)binom(2n-2i, 2m-i)2^i
    =binom(n, m), quad n>=m;
  $
  #keep-next[g)]
  $
    2sum_(i=0)^m binom(n+2i, n-1)binom(n+2m-2i, n-1) \
    =binom(2n+2m+1, 2n-1)-binom(n+m, n-1), quad n>=1;
  $
  #keep-next[h)]
  $
    2sum_(i=0)^m binom(n, 2m-2i)binom(n+1, 2i+1) \
    =binom(2n+1, 2m+1)+(-1)^m binom(n, m), quad n>=2m;
  $
  #keep-next[i)]
  $
    sum_(i=0)^k (-1)^i binom(m, m-k+i)binom(n+i, n)
    =binom(m-n-1, k), quad m>=k+n+1;
  $
  #keep-next[j)]
  $
    sum_(i=0)^n (-1)^i binom(m-i k, n)binom(n, i)
    =k^n, quad m>=k n;
  $
  #keep-next[k)]
  $
    sum_(i=0)^m (-1)^i binom(n+m-i, n)binom(n+i, n)
    =cases(
      binom(n+m/2, m/2) & "if" m "is even,",
      0 & "if" m "is odd."
    )
  $
] <prob:residue-class-selection>
