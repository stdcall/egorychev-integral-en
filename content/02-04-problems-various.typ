#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "book-style.typ": keep-next, keep-together
#import "main-defs.typ": bib-ref, res, source

#source(94, "82")
#problem[
  _Prove:_

  #metadata((kind: "index-anchor")) <idx:feller>
  #index-mark([@idx:feller], group: [Identities])[Feller]
  #metadata((kind: "index-anchor")) <idx:gould-problem>
  #index-mark([@idx:gould-problem], group: [Identities])[Gould]
  #metadata((kind: "index-anchor")) <idx:rosenbaum>
  #index-mark([@idx:rosenbaum], group: [Identities])[Rosenbaum]
  #metadata((kind: "index-anchor")) <idx:sitgreaves>
  #index-mark([@idx:sitgreaves], group: [Identities])[Sitgreaves]
  #metadata((kind: "index-anchor")) <idx:hietala>
  #index-mark([@idx:hietala], group: [Identities])[Hietala and Winter]
  #keep-next[a) the identity (#bib-ref("Kaucky1975"), p. 364)]
  $
    sum_(r=0)^n sum_(i=0)^r (-1)^i binom(r, i)(i+1)^n=0,
    quad n=1,2,3,dots;
  $
  #keep-next[b) the identity (#bib-ref("Kaucky1975"), p. 463, (20)), for
    $0<=m<=n+1$,]
  $
    frac(m!, n!)sum_(i=0)^n (-1)^i binom(n, i)binom(x+m+n-i, m)
    =cases(
      (n+1)(x+n+1) & "if" m=n+1,
      1 & "if" m=n,
      0 & "if" m<n,
    ).
  $
  #keep-next[c) the identity (#bib-ref("Kaucky1975"), p. 458, (13))]
  $
    sum_(k=0)^n binom(z+1, 2k+1)binom(z-2k, n-k)2^(2k+1)
    =binom(2z+2, 2n+1);
  $
  #keep-next[d) the identity #bib-ref("Bajsanski1954"), for $0<=m<=n$,]
  $
    sum_(i=0)^(n-m) (-2)^(-i)binom(n, m+i)binom(m+n+i, i)
    =cases(
      0 & "if" n-m "is odd,",
      (-1)^k 2^(-2k)binom(n, k) & "if" n-m=2k,
    ).
  $
  #source(95, "83")
  #keep-next[e) the identity of Hietala and Winter #bib-ref("Hietala1965")]
  $
    sum_(j=1)^n binom(n, j)frac((-1)^(j+1), j)
    =sum_(j=1)^n frac(1, j);
  $
  #keep-next[f) the identity #bib-ref("Gould1972b")]
  $
    sum_(k=0)^infinity sum_(j=0)^k frac((-1)^j, k+1)binom(k, j)j^n=B_n;
  $
  #keep-next[g) the identity of Sitgreaves #bib-ref("Sitgreaves1970")]
  $
    sum_(j=0)^r binom(r+k, j)(-1)^j s_(2)(r-j+k,r-j)=0,
    quad k>=0, quad r>k;
  $
  #keep-next[h) Rosenbaum's identities #bib-ref("Gould1969")]
  $
    sum_(i=0)^m (-1)^i binom(i+n-1, i)binom(n, m-i)=0,
    quad n>=m>=2,
  $
  $
    sum_(i=0)^m (-1)^i binom(i+n-1, m-1)binom(m, i)=0,
    quad n>=2, quad 1<=m<n;
  $
  #keep-together[
    i) the identities (_Kvant_,#footnote[
      _Original editor's note (1984)._ Kvant (Russian for Quantum) is a monthly
      journal on mathematics and physics for high-school students. Published
      since 1970 jointly by the Academy of Sciences of the USSR and the Academy
      of Pedagogical Sciences of the USSR, both in Moscow, it has an editorial
      board headed by I. K. Kikoin (physics) and A. N. Kolmogorov (mathematics),
      both full members of the Academy of Sciences. It is a respected journal
      with a circulation of over 300,000.
    ] 1973, no. 4, pp. 43–44, Problem M199)
    $
      sum_(i=0)^(floor(n/2)) (-4)^(-i)binom(n-i, i)=(n+1)2^(-n),
    $
  ]
  $
    sum_(i=0)^(floor(n/2))binom(n-i, i)(-p q)^i
    =frac(p^(n+1)-q^(n+1), p-q), \
    p>=0, quad q>=0, quad p!=1/2, quad p+q=1;
  $
  #keep-next[j) Gould's identity #bib-ref("Gould1956")]
  $
    sum_(j=0)^n frac(1, m j+1)binom(m j+1, j)
    frac(1, m n-m j+1)binom(m n-m j+1, n-j) \
    =frac(2, 2+m n)binom(2+m n, n);
  $
  #source(96, "84")
  #keep-next[
    k) Feller's formula (#bib-ref("Feller1957"), Chapter 3, §6, formula (6.4),
    and the remark in Chapter 11, §3a), for $p,q>0$ and integers $n>=x>=1$,
  ]
  $
    res_s lr((frac(1-sqrt(1-4p q s^2), 2q s)))^x s^(-n-1) \
    =lr((2^(-n)binom(n, k)-2^(-n+1)binom(n-1, k)))
    (4p q)^(n/2)(p/q)^(x/2), quad n+x=2k.
  $
  The square root has constant term $1$ at $s=0$.

  #metadata((kind: "index-anchor")) <idx:cvetkovic>
  #index-mark([@idx:cvetkovic], group: [Identities])[Cvetković and Simić]
  #metadata((kind: "index-anchor")) <idx:ascher>
  #index-mark([@idx:ascher], group: [Identities])[Ascher]
  #keep-next[l) the identity (#bib-ref("Knuth1969"), §1.2.6, (34))]
  $
    sum_(k=0)^r binom(r, k)binom(k, n)(-1)^k=(-1)^r delta_(n r);
  $
  #keep-next[m) Ascher's identity #bib-ref("Ascher1974"), for
    $0<=k<=floor(n/2)$,]
  $
    2^n sum_(i=k)^(floor(n/2)) (-1)^i binom(n-i, i)binom(i, k)2^(-2i)
    =(-1)^k binom(n+1, 2k+1);
  $
  #keep-next[n) the identity (cf. #bib-ref("Srivastava1972"))]
  $
    sum_(ell=0)^p (-1)^ell binom(p, ell)binom(ell+nu, ell+s)
    =(-1)^p res_w (1+w)^nu w^(-s-p-1);
  $
  #keep-next[
    o) the identity of Cvetković and Simić #bib-ref("Cvetkovic1973"), for
    nonnegative integers $j,k,ell$ with $j<=2ell+k$,
  ]
  $
    sum_(s=0)^(min(floor(j/2), ell)) (-1)^s binom(j-s, s)
    lr((binom(2(ell-s)+k, ell-s)-binom(2(ell-s)+k, ell-s-1))) \
    =binom(2ell+k-j, ell)-binom(2ell+k-j, ell+k+1).
  $
] <prob:various-binomial-identities>
