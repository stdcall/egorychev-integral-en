#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, res, source

#source(159, "147")
#problem[
  For nonnegative integers $r,k$, let
  $ H_(r,k)=sum_(p=0)^r G(p,k)f(p,r), $
  where
  $ G(p,k)=p! sum_(l=0)^(min(p, k)) binom(p+k-l, p-l)binom(k, l), $
  and, for $0<=p<=r$,
  $
    f(p,r)=cases(
      sum_(i=0)^(p-1) (-1)^i (p-i)^r/((p-i)!i!) & quad p>=1,
      0 & quad p=0 comma r!=0,
      1 & quad p=r=0.
    )
  $
  #keep-next[Prove that (#bib-ref("Egorychev1974c"), pp. 57–59)]
  $
     G(p,k) & =p! res_v (1+2v)^k (1+v)^p v^(-p-1), \
     f(p,r) & =r!/p! res_v (e^v-1)^p v^(-r-1), \
    H_(r,k) & =r! res_u lr({e^(u k)(2-e^u)^(-k-1)u^(-r-1)}),
  $
  #keep-next[
    and use @th:generating-function-limit to obtain, as $r -> infinity$ with $k$
    fixed,
  ]
  $ H_(r,k) ∼ (r!r^k)/(2(ln 2)^(k+r+1)k!). $
] <prob:delannoy-stirling-sum>
