#import "index-style.typ": index-mark
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, res, source

#pagebreak()
#source(281, "269")
#heading(level: 1, numbering: none)[
  Table M. Integral Representations of Numbers
] <app:table-m>

Unless otherwise specified, $alpha$ is an arbitrary complex number, $m$ and $k$
are positive integers, and $n,n_1,dots,n_k$ are integers. Write
$(alpha)_n=alpha(alpha-1)dots(alpha-n+1)$ for $n>=1$, with $(alpha)_0=1$. All
circles have positive orientation. Powers and logarithms in the contour formulas
use their analytic branches at the origin, with $1^alpha=1$ and $ln 1=0$.

#heading(level: 2)[Binomial coefficients] <table:binomial>
#index-mark([@table:binomial], group: [Numbers])[Binomial and multinomial
  coefficients]

#heading(level: 3)[One variable] <table:binomial-univariate>

#keep-next[*Definition.* 1) For arbitrary $alpha$,]
$
  binom(alpha, n)=cases(
    1 & quad n=0,
    frac((alpha)_n, n!) & quad n>=1,
    0 & quad n<0.
  )
$
2) For $alpha=m$,
$
  binom(m, n)=cases(
    1 & quad n=0,
    frac(m!, n!(m-n)!) & quad 1<=n<=m,
    0 & quad n<0 " or " n>m.
  )
$
#keep-next[3) For $alpha=-m$,]
$
  binom(-m, n)=(-1)^n binom(m+n-1, n), quad n in ZZ.
$
4) For $alpha=-1/2$ and $n>=0$,
$
  (-1)^n binom(-1/2, n)=4^(-n)binom(2n, n)=frac((2n-1)!!, (2n)!!),
$
with $(-1)!! =0!! =1$.

#keep-next[*Integral representations:* $M_1=M_(1)(w)$.]


#keep-next[1) For arbitrary $alpha$,]
$
  binom(alpha, n) & =res_w (1+w)^alpha w^(-n-1) \
                  & =frac(1, 2pi i)integral_(abs(w)=rho)
                    (1+w)^alpha w^(-n-1)dif w,
                    quad 0<rho<1.
$

#source(282, "270")
2) For $alpha=m$,
$
  binom(m, n) & =res_w (1+w)^m w^(-n-1) \
              & =frac(1, 2pi i)integral_(abs(w)=rho)(1+w)^m w^(-n-1)dif w,
                quad rho>0.
$
The symmetry $binom(m, n)=binom(m, m-n)$ also gives the frequently used formula
$
  binom(m, n) & =res_w (1+w)^m w^(-m+n-1) \
              & =frac(1, 2pi i)integral_(abs(w)=rho)(1+w)^m w^(-m+n-1)dif w,
                quad rho>0.
$
3) We have
$
  binom(m+n-1, n) & =res_w (1-w)^(-m)w^(-n-1) \
                  & =frac(1, 2pi i)integral_(abs(w)=rho)(1-w)^(-m)w^(-n-1)dif w,
                    quad 0<rho<1.
$
For $n>=0$, the symmetry $binom(m+n-1, n)=binom(m+n-1, m-1)$ also yields
$
  binom(m+n-1, n) & =res_w (1-w)^(-n-1)w^(-m) \
                  & =frac(1, 2pi i)integral_(abs(w)=rho)(1-w)^(-n-1)w^(-m)dif w,
                    quad 0<rho<1.
$
4) For $n>=0$,
$
  binom(2n, n) & =res_w (1-4w)^(-1/2)w^(-n-1) \
               & =frac(1, 2pi i)integral_(abs(w)=rho)(1-4w)^(-1/2)w^(-n-1)dif w,
                 quad 0<rho<1/4.
$

#heading(level: 3)[Several variables] <table:binomial-multivariate>

Write $N=n_1+dots+n_k$.

#keep-next[*Definition.* 1) For arbitrary $alpha$,]
$
  binom(alpha, n_1, dots, n_k)=cases(
    1 & quad n_1=dots=n_k=0,
    frac((alpha)_N, n_1!dots n_k!) & quad "all " n_j>=0 " and " N>=1,
    0 & quad "otherwise."
  )
$

#source(283, "271")
2) For $alpha=m$,
$
  binom(m, n_1, dots, n_k)=cases(
    1 & quad n_1=dots=n_k=0,
    frac(m!, n_1!dots n_k!(m-N)!) & quad "all " n_j>=0 " and " 1<=N<=m,
    0 & quad "otherwise."
  )
$
#keep-next[3) For $alpha=-m$,]
$
  binom(-m, n_1, dots, n_k)=(-1)^N binom(m+N-1, n_1, dots, n_k).
$

*Integral representations:* $M_1=M_(1)(w_1,dots,w_k)$.

Let $Gamma(rho)={w:abs(w_j)=rho_j, j=1,dots,k}$ be the skeleton of a polydisk,
with the product orientation, and write $dif w=dif w_1 and dots and dif w_k$.


#keep-next[1) For arbitrary $alpha$,]
$
  binom(alpha, n_1, dots, n_k)
  &=res_(w_1,dots,w_k)(1+w_1+dots+w_k)^alpha product_(j=1)^k w_j^(-n_j-1) \
  &=frac(1, (2pi i)^k)integral_(Gamma(rho))
  (1+w_1+dots+w_k)^alpha product_(j=1)^k w_j^(-n_j-1)dif w,
$
where each $rho_j>0$ and $rho_1+dots+rho_k<1$.

2) For $alpha=m$,
$
  binom(m, n_1, dots, n_k)
  &=res_(w_1,dots,w_k)(1+w_1+dots+w_k)^m product_(j=1)^k w_j^(-n_j-1) \
  &=frac(1, (2pi i)^k)integral_(Gamma(rho))
  (1+w_1+dots+w_k)^m product_(j=1)^k w_j^(-n_j-1)dif w,
$
where the radii $rho_j>0$ are arbitrary.

#keep-next[3) For $alpha=-m$,]
$
  binom(m+N-1, n_1, dots, n_k)
  &=res_(w_1,dots,w_k)(1-w_1-dots-w_k)^(-m)product_(j=1)^k w_j^(-n_j-1) \
  &=frac(1, (2pi i)^k)integral_(Gamma(rho))
  (1-w_1-dots-w_k)^(-m)product_(j=1)^k w_j^(-n_j-1)dif w,
$
where each $rho_j>0$ and $rho_1+dots+rho_k<1$.

#source(284, "272")
#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Logarithmic coefficients] <table:logarithmic>

  *Definition and integral representation:* $M_2=M_(2)(w)$, for the function
  $-ln(1-w)$:
  $
    cases(0 & quad n=0, 1/n & quad n>=1)
    &=res_w (-ln(1-w))w^(-n-1) \
    &=-frac(1, 2pi i)integral_(abs(w)=rho)ln(1-w)w^(-n-1)dif w,
  $
  where $0<rho<1$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Exponential coefficients] <table:exponential>

  *Definition and integral representation:* $M_3=M_(3)(w)$, for the function
  $exp(alpha w)$:
  $
    frac(alpha^n, n!)&=res_w e^(alpha w)w^(-n-1) \
    &=frac(1, 2pi i)integral_(abs(w)=rho)e^(alpha w)w^(-n-1)dif w,
  $
  where $rho>0$ and $n>=0$; the coefficient at $n=0$ is $1$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Ordinary Euler numbers] <table:euler>
  #index-mark([@table:euler], group: [Numbers])[Euler]

  *Definition and integral representation:* $M_4=M_(4)(w)$:
  $
    E_n & =n!res_w frac(w^(-n-1), cosh w) \
        & =frac(n!, 2pi i)integral_(abs(w)=rho)frac(w^(-n-1), cosh w)dif w,
  $
  where $0<rho<pi/2$ and $n>=0$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Bernoulli numbers] <table:bernoulli>
  #index-mark([@table:bernoulli], group: [Numbers])[Bernoulli]

  *Definition and integral representation:* $M_5=M_(5)(w)$:
  $
    B_n & =n!res_w (e^w-1)^(-1)w^(-n) \
        & =frac(n!, 2pi i)integral_(abs(w)=rho)(e^w-1)^(-1)w^(-n)dif w,
  $
  where $0<rho<2pi$ and $n>=0$. In particular, $B_1=-1/2$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Stirling numbers of the first kind] <table:stirling-first>
  #index-mark([@table:stirling-first], group: [Numbers])[Stirling, first kind]

  *Definition:* for $m>=0$,
  $
    (w)_m=sum_(n=0)^infinity s_(1)(m,n)w^n, quad s_(1)(0,0)=1.
  $
  *Integral representation:* $M_6=M_(6)(w)$:
  $
    s_(1)(m,n)&=res_w (w)_m w^(-n-1) \
    &=frac(m!, n!)res_w [ln(1+w)]^n w^(-m-1) \
    &=frac(m!, n!)frac(1, 2pi i)integral_(abs(w)=rho)[ln(1+w)]^n w^(-m-1)dif w,
  $
  where $0<rho<1$ and $n>=0$. These are the signed Stirling numbers.

  #source(285, "273")
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Stirling numbers of the second
    kind] <table:stirling-second>
  #index-mark([@table:stirling-second], group: [Numbers])[Stirling, second kind]

  *Definition:* for $m>=0$,
  $
    w^m=sum_(n=0)^infinity s_(2)(m,n)(w)_n, quad s_(2)(0,0)=1.
  $
  *Integral representation:* $M_7=M_(7)(w)$:
  $
    s_(2)(m,n)&=frac(m!, n!)res_w (e^w-1)^n w^(-m-1) \
    &=frac(m!, n!)frac(1, 2pi i)integral_(abs(w)=rho)(e^w-1)^n w^(-m-1)dif w,
  $
  where $rho>0$ and $n>=0$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Gamma function] <table:gamma>

  *Definition and integral representation:* $M_8=M_(8)(s)$:
  $
    Gamma(z)=integral_0^infinity e^(-s)s^(z-1)dif s, quad Re z>0.
  $
  In particular,
  $
    n! =Gamma(n+1)=integral_0^infinity e^(-s)s^n dif s, quad n>=0.
  $
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Beta function] <table:beta>

  *Definition and integral representation:* $M_9=M_(9)(t)$:
  $
    B(u,v)=frac(Gamma(u)Gamma(v), Gamma(u+v))
    =integral_0^1 t^(u-1)(1-t)^(v-1)dif t,
  $
  where $Re u>0$ and $Re v>0$. In particular,
  $
    frac(n!m!, (n+m+1)!)=B(n+1,m+1)=integral_0^1 t^(n)(1-t)^m dif t,
  $
  for $n,m>=0$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Generalized Stirling numbers of the second
    kind] <table:generalized-stirling>
  #index-mark([@table:generalized-stirling], group: [Numbers], after: [Stirling,
    second kind])[Stirling, generalized second kind]

  For $m,n>=0$ and positive integer $k$, the definition and integral
  representation #bib-ref("Ivchenko1965b", "Sinha1969") are $M_10=M_(10)(w)$:
  $
    s_2^((alpha))(m,n,k) \
                         & =frac(m!, n!)res_w
                           e^(alpha w)(e^(k w)-1)^n w^(-m-1) \
                         & =frac(m!, n!)frac(1, 2pi i)integral_(abs(w)=rho)
                           e^(alpha w)(e^(k w)-1)^n w^(-m-1)dif w,
  $
  where $rho>0$.

  #source(286, "274")
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Generalized Bernoulli
    numbers] <table:generalized-bernoulli>
  #index-mark([@table:generalized-bernoulli], group: [Numbers])[Bernoulli,
    generalized]

  *Definition and integral representation* (#bib-ref("David1962"), Chapter 15):
  $M_11=M_(11)(w)$:
  $
    B_n^((m)) & =n!res_w (e^w-1)^(-m)w^(-n+m-1) \
              & =frac(n!, 2pi i)integral_(abs(w)=rho)
                (e^w-1)^(-m)w^(-n+m-1)dif w,
  $
  where $0<rho<2pi$, $m>=1$ and $n>=0$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Euler numbers of order m] <table:higher-euler>
  #index-mark([@table:higher-euler], group: [Numbers])[Euler, of higher order]

  *Definition and integral representation* #bib-ref("Carlitz1964"):
  $M_12=M_(12)(w)$:
  $
    E_n^((m)) & =n!res_w (cosh w)^(-m)w^(-n-1) \
              & =frac(n!, 2pi i)integral_(abs(w)=rho)(cosh w)^(-m)w^(-n-1)dif w,
  $
  where $0<rho<pi/2$, $m>=1$ and $n>=0$.
]

#block(breakable: false, above: 1em, below: 1em)[
  #heading(level: 2)[Eulerian numbers] <table:eulerian>
  #index-mark([@table:eulerian], group: [Numbers])[Eulerian]

  *Definition and integral representation* #bib-ref("Carlitz1972"):
  $M_13=M_(13)(w,z)$:
  $
    A(n,k) & =n!res_(w,z)frac((z-1)^(n+1), z e^(-w)-1)w^(-n-1)z^(-k-1) \
           & =frac(n!, (2pi i)^2)integral_(abs(w)=rho_1,abs(z)=rho_2)
             frac((z-1)^(n+1), (z e^(-w)-1)w^(n+1)z^(k+1))dif w and dif z,
  $
  where $n,k>=0$, $rho_1>0$ and $0<rho_2<e^(-rho_1)$. For $n>=1$, this
  convention counts permutations with $k-1$ ascents; $A(0,0)=1$ and $A(0,k)=0$
  for $k>0$.
]
