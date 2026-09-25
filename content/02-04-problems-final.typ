#import "main-defs.typ": bib-ref, source
#import "statements.typ": problem
#import "book-style.typ": keep-next

#source(96, "84")
#problem[
  _Prove:_

  #keep-next[a) the identity, for $k>=1$,]
  $
    sum_(j=0)^n binom(n, j)s_(1)(n-j,k-1)j!(-1)^j=s_(1)(n+1,k);
  $
  #keep-next[b) the identity #bib-ref("Sinha1969"), for a positive integer $r$,]
  $
    sum_(i=0)^n binom(n, i)s_(2)^((alpha))(i,k,r)
    =s_(2)^((alpha+1))(n,k,r);
  $
  #keep-next[c) the identities #bib-ref("Gould1972b")]
  $
    sum_(j=2)^(2n+1) (-1)^(j-1)binom(2n+1, j)
    frac(1, j)sum_(k=1)^(j-1) k^(2n)=B_(2n), quad n>=1,
  $
  $
    sum_(k=0)^n sum_(j=0)^k frac((-1)^(k+j), k+1)binom(k, j)(k-j)^n=B_n;
  $
  #source(97, "85")
  d) Entringer's identity #bib-ref("Entringer1966"). In this part, $A(N,k)$
  denotes the number of permutations of $1,dots,N$ that start with $k$ and
  alternate as $a_1<a_2>a_3<dots$; set $A(1,1)=1$. Then
  $
    sum_(j=0)^n (-1)^(n-j)binom(k-1, 2n-2j)A(2j+1,1)
    =A(2n+1,k), quad 1<=k<=2n-1;
  $
  #keep-next[e) the identity #bib-ref("Sitgreaves1970")]
  $
    sum_(k=m-r)^(n-r) binom(n, k)s_(2)(n-k,r)s_(2)(k,m-r)
    =binom(m, r)s_(2)(n,m), quad r<=m<=n;
  $
  #keep-next[f) the identity #bib-ref("Egorychev1974c"), for $0<=q<=n$,]
  $
    sum_(m=0)^(n-q) (-1)^m D((n-m)\/q)(2^q-q-1)^m binom(n, m)
    =s_(2)(n,q),
  $
  where $D(k\/q)$ is defined in @ex:stirling-weighted-sum in
  §@sec:sum-computation.
] <prob:stirling-identities>

#problem[
  After proving the identities in each problem of this chapter, formulate some
  new identities of the same type.
] <prob:new-univariate-identities>

#problem[
  Prove the identities in the table in §@sec:binomial-sum-classification, and
  formulate some new ones.
] <prob:binomial-table-identities>
