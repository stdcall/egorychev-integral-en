#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source

#source(158, "146")
#problem[
  Let $H_(n)(t_1,dots,t_m;r)$ count $m times n$ arrays of nonnegative integers
  with row sums $t_1,dots,t_m$ and column sums at most $r$. All parameters are
  integers. In the counting formulas below, $binom(a, b)=0$ when $a<b$ or $b<0$.

  #keep-next[It is shown in #bib-ref("Abramson1973") that]
  $
    H_(n)(t_1,t_2;r) & =binom(t_1+n-1, n-1)binom(t_2+n-1, n-1) \
                     & quad-n binom(t_1+t_2+2n-r-3, 2n-2),
  $
  where $r>=t_1>=t_2>=0$ and $n>=2$.

  #keep-next[It is also shown that]
  $
    H_(n)(t_1,t_2,t_3;r) & =product_(j=1)^3 binom(t_j+n-1, n-1) \
                         & quad-binom(n, 1)lr(
                             {binom(t_1+t_2+t_3+3n-r-4, 3n-3) \
                               &quad quad-sum_(j=1)^3 sum_(i=0)^(n-2)
                               binom(t_j+n-1, n-2-i) \
                               &quad quad quad times
                               binom(t_1+t_2+t_3-t_j+2n-r-3, 2n-1+i)}
                           ) \
                         & quad+binom(n, 2)sum_(i=0)^2
                           binom(t_1+t_2+t_3+3n-2r-7, 3n-5+i) \
                         & quad quad times lr(
                             {binom(r+3, 2-i)-sum_(j=1)^3
                               binom(r-t_j+2, 2-i)binom(n-2+i, n-2)}
                           ),
  $
  for $r>=t_1>=t_2>=t_3>=0$ and $n>=3$.

  #source(159, "147")
  a) Find generating functions for the sequences of numbers $H_(2)(t_1,t_2;r)$
  and $H_(3)(t_1,t_2,t_3;r)$.

  b) Using the results from a), formulate and prove a conjecture for the
  generating function of $H_(m)(t_1,dots,t_m;r)$ with arbitrary $m$.
] <prob:bounded-array-counts>
