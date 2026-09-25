#import "index-style.typ": index-mark
#import "statements.typ": example
#import "hypergeometric.typ": hyper
#import "q-binomial.typ": qbinom
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(87, "75")
#example(title: [], suffix: [*. Proof of the q-analogues of the Moriarty
identities.*])[
  Write
  $
    #qbinom($a$, $b$, $q$)=frac([q]_a, [q]_b [q]_(a-b))
    quad (0<=b<=a)
  $
  for the Gaussian binomial coefficient. For integers $n>=p>=0$ and
  $0<abs(q)<1$, the identities are #eq(
    $
      sum_(k=0)^(n-p)
      #qbinom($2n+1$, $2p+2k+1$, $q$)
      #qbinom($p+k$, $k$, $q^2$)q^(k(2p+2k+1)) \
      =#qbinom($2n-p$, $p$, $q^2$) [-q]_(2n-2p),
    $,
  ) <eq:q-moriarty-odd>
  #index-mark([@eq:q-moriarty-odd], group: [Identities])[Moriarty,
    $q$-analogues]
  and, for $n>=1$, #eq(
    $
      sum_(k=0)^(n-p)
      #qbinom($2n$, $2p+2k$, $q$)
      #qbinom($p+k$, $k$, $q^2$)q^(k(2p+2k-1)) \
      =#qbinom($2n-p$, $p$, $q^2$) [-q]_(2n-2p)
      frac(1-q^(2n), 1-q^(4n-2p)).
    $,
  ) <eq:q-moriarty-even>
  #index-mark([@eq:q-moriarty-even], group: [Identities])[Moriarty,
    $q$-analogues]
  Again, both sums are $1$ when $n=p=0$.

  We use the terminating $q$-analogue of Gauss's theorem (#bib-ref(
    "Slater1966",
  ), IV.2 or IV.3). Put $Q=q^2$ and $N=n-p$. Denoting the first sum by $S$,
  @th:factorial-multiplication gives
  $
    S=#qbinom($2n+1$, $2p+1$, $q$)sum_(k=0)^N
    frac(
      q^(4N k-k(2k-1))[q^(-2N)]_(2k)[q^(2p+2);Q]_k
      q^(k(2p+2k+1)),
      [q^(2p+2)]_(2k)[Q;Q]_k
    ).
  $
  Splitting the products into even and odd factors, we obtain
  $
    S & =#qbinom($2n+1$, $2p+1$, $q$)sum_(k=0)^N
        frac(
          [q^(-2N);Q]_k [q^(1-2N);Q]_k [q^(2p+2);Q]_k
          q^((4n-2p+2)k),
          [q^(2p+2);Q]_k [q^(2p+3);Q]_k [Q;Q]_k
        ) \
      & =#qbinom($2n+1$, $2p+1$, $q$)
        #hyper($Phi$, 2, 1, $q^(-2N),q^(1-2N)$, $q^(2p+3)$, $Q,q^(4n-2p+2)$) \
      & =#qbinom($2n+1$, $2p+1$, $q$)
        frac([q^(2n+2);Q]_N, [q^(2p+3);Q]_N).
  $
  The last equality is the terminating $q$-Gauss formula. Since
  $[q]_(2r+1)=[q;Q]_(r+1)[Q;Q]_r$ and $[Q;Q]_r=[q]_r [-q]_r$, cancellation gives
  $
    S=frac([Q;Q]_(2n-p), [Q;Q]_p [q]_(2N))
    =#qbinom($2n-p$, $p$, $Q$) [-q]_(2N).
  $

  #source(88, "76")
  For the second sum the same calculation gives
  $
    S=#qbinom($2n$, $2p$, $q$)sum_(k=0)^N
    frac(
      q^(4N k-k(2k-1))[q^(-2N)]_(2k)[q^(2p+2);Q]_k
      q^(k(2p+2k-1)),
      [q^(2p+1)]_(2k)[Q;Q]_k
    ).
  $
  After splitting and cancelling factors, this becomes
  $
    S & =#qbinom($2n$, $2p$, $q$)sum_(k=0)^N
        frac(
          [q^(1-2N);Q]_k [q^(-2N);Q]_k q^((4n-2p)k),
          [Q;Q]_k [q^(2p+1);Q]_k
        ) \
      & =#qbinom($2n$, $2p$, $q$)
        #hyper($Phi$, 2, 1, $q^(1-2N),q^(-2N)$, $q^(2p+1)$, $Q,q^(4n-2p)$) \
      & =#qbinom($2n$, $2p$, $q$)
        frac([q^(2n);Q]_N, [q^(2p+1);Q]_N) \
      & =frac((1-Q^n)[Q;Q]_(2n-p-1), [Q;Q]_p [q]_(2N)) \
      & =#qbinom($2n-p$, $p$, $Q$) [-q]_(2N)
        frac(1-q^(2n), 1-q^(4n-2p)).
  $
] <ex:q-moriarty-odd>
