#import "index-style.typ": index-mark
#import "statements.typ": example
#import "hypergeometric.typ": hyper
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(86, "74")
We now prove some known combinatorial identities using
@th:factorial-multiplication and summation formulas for hypergeometric series.
We follow the presentation in #bib-ref("Andrews1974"), Theorems 5.3–5.5.

#example(title: [], suffix: [*. Proof of the Moriarty identities.*])[
  For integers $n>=p>=0$, we have #eq(
    $
      sum_(k=0)^(n-p) binom(2n+1, 2p+2k+1)binom(p+k, k)
      =binom(2n-p, p)2^(2n-2p),
    $,
  ) <eq:moriarty-odd>
  #index-mark([@eq:moriarty-odd], group: [Identities])[Moriarty]
  and, for $n>=1$, #eq(
    $
      sum_(k=0)^(n-p) binom(2n, 2p+2k)binom(p+k, k)
      =frac(n, 2n-p)binom(2n-p, p)2^(2n-2p).
    $,
  ) <eq:moriarty-even>
  #index-mark([@eq:moriarty-even], group: [Identities])[Moriarty]
  When $n=p=0$, both sums are $1$.

  These identities are slightly disguised versions of Gauss's summation theorem
  @eq:gauss-summation. Applying @th:factorial-multiplication to the first sum
  gives
  $
    sum_(k=0)^(n-p) binom(2n+1, 2p+2k+1)binom(p+k, k)
    &=binom(2n+1, 2p+1)sum_(k=0)^(n-p)
    frac((p-n)_k (p-n+1/2)_k (p+1)_k, (p+1)_k (p+3/2)_k k!) \
    &=binom(2n+1, 2p+1)
    #hyper($F$, 2, 1, $p-n,p-n+1/2$, $p+3/2$, $1$).
  $
  Gauss's theorem, in its terminating form, now yields
  $
    binom(2n+1, 2p+1)frac((n+1)_(n-p), (p+3/2)_(n-p))
    &=frac(2^(2n-2p)(2n-p)!, p!(2n-2p)!) \
    &=binom(2n-p, p)2^(2n-2p),
  $
  where the factorial simplification follows from @th:factorial-multiplication.

  In the same way, the second sum is
  $
    sum_(k=0)^(n-p) binom(2n, 2p+2k)binom(p+k, k)
    &=binom(2n, 2p)sum_(k=0)^(n-p)
    frac((p-n)_k (p-n+1/2)_k (p+1)_k, (p+1/2)_k (p+1)_k k!) \
    &=binom(2n, 2p)
    #hyper($F$, 2, 1, $p-n,p-n+1/2$, $p+1/2$, $1$) \
    &=binom(2n, 2p)frac((n)_(n-p), (p+1/2)_(n-p)).
  $
  #source(87, "75")
  For $n>=1$, @th:factorial-multiplication simplifies this to
  $
    frac(2^(2n-2p)n(2n-p-1)!, p!(2n-2p)!)
    =2^(2n-2p)binom(2n-p, p)frac(n, 2n-p).
  $
] <ex:moriarty-odd>
