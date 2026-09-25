#import "main-defs.typ": bib-ref, source
#import "statements.typ": problem
#import "book-style.typ": keep-next

#source(157, "145")
#heading(level: 2)[Problems] <sec:interpretation-problems>

#problem[
  In a way similar to the considerations in @sec:other-interpretations, use
  graph theory to find generalizations of the identities in
  @prob:graph-identities and then analytic proofs for them. Do the same for two
  or three arbitrarily selected identities in §@sec:univariate-problems.
] <prob:graph-generalizations>

#problem[
  Let $n>=1$ and $0<=q<=2n$ be integers, and put
  $
    F(q,2n) & =sum_(i=0)^(2n-1) frac((-1)^(i+q/2-1), i-q)
              binom(2n-1, i)binom(n-1, q/2-1) \
            & quad+sum_(r=0)^(n-1)frac((-1)^(r+q+1), q-2r-2)
              binom(2n-1, q)binom(n-1, r),
  $
  omitting $i=q$ and $r=q/2-1$. The first sum is defined to be zero when $q$ is
  odd, in accordance with the convention $binom(n-1, q/2-1)=0$ for odd $q$.


  #keep-next[Combinatorial means are used in #bib-ref("Consul1970") to prove the
    formula]
  $ F(q,2n)=(-1)^(n-1)F(2n-q,2n). $
  Prove the same formula by analytic means.

  #source(158, "146")
] <prob:symmetric-binomial-sum>

#problem[
  Let $A(n)$ count arrangements of $n$ nonattacking rooks on an $n times n$
  chessboard, with arrangements identified under rotations and reflections of
  the board. The formula in #bib-ref("Holt1974") is
  $ A(n)=frac(n!+f(n)+2g(n)+2h(n), 8), quad n>=2, $
  with $A(0)=A(1)=1$, where
  $
    f(n)=cases(
      n(n-2) dots 2=(n/2)!2^(n/2) & quad n " even",
      (n-1)(n-3) dots 2=((n-1)/2)!2^((n-1)/2) & quad n " odd",
    ),
  $
  $
    g(n)=cases(
      (n-2)(n-6) dots 2 & quad n equiv 0 mod 4,
      (n-3)(n-7) dots 2 & quad n equiv 1 mod 4,
      0 & quad "otherwise",
    ),
  $
  and $h(n)$ is defined by the recurrence
  $ h(n)=(n-1)h(n-2)+h(n-1), quad h(1)=1, quad h(2)=2. $
  Empty products are $1$; take $h(0)=1$.

  Find a generating function for the sequence $lr({A(n)})_(n=0)^infinity$, and
  then the asymptotic behavior of $A(n)$ as $n arrow.r infinity$.
] <prob:rook-symmetry-orbits>
