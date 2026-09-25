#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source

#source(159, "147")
#problem[
  Suppose that $g_0,g_1,dots,g_(n-1)$ are disjoint sets containing
  $a_0,a_1,dots,a_(n-1)$ distinct elements, respectively. In how many ways can
  their elements be arranged in a row so that no two elements from any one set
  $g_k$ ($k=1,2,dots,n-1$) are adjacent?

  #source(160, "148")
  #keep-next[
    The number $N_4=N_(4)(a_0,dots,a_3)$ of such arrangements when $n=4$
    (#bib-ref("Bhaskaranada1968")) is
  ]
  $
    N_4 & =a_0!a_1!a_2!a_3! \
        & quad times
          sum_(r=a_1-a_2-a_3)^(a_1)
          quad sum_(s=a_2-a_3)^(a_2)
          quad sum_(k=a_1+a_2-a_3-r-s)^(a_1-r) \
        & quad times binom(a_1-1, r-1)binom(a_0+1, r)
          binom(a_2-1, s-1)binom(a_1-r, k) \
        & quad times binom(a_0+r+1, s-k)
          binom(a_0+r+s+k+1, a_0+a_1+a_2-a_3+1).
  $
  Here the $a_i$ are nonnegative integers. In this formula, $binom(-1, -1)=1$;
  all other binomials $binom(a, b)$ with $a<b$ or $b<0$ are zero.

  #keep-next[a) Find the generating function for the sequence]
  $ lr({N_4/(a_0!a_1!a_2!a_3!)}). $

  b) Find the asymptotic behavior of $N_(4)(a_0,a_1,a_2,a_3)$ as one of
  $a_0,a_1,a_2,a_3$ becomes large, with the other parameters fixed.
] <prob:ordered-block-arrangements>
