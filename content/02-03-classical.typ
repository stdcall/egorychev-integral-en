#import "index-style.typ": index-mark
#import "statements.typ": example
#import "hypergeometric.typ": hyper
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(82, "70")
#heading(level: 3)[
  Computation of sums with ordinary and q-binomial coefficients. Results of
  Andrews
] <sec:andrews-method>

Closed forms for sums with ordinary and $q$-binomial coefficients can be
obtained using linear, quadratic, and certain other transformations of
hypergeometric series, especially their summation formulas. Bateman and Erdélyi
(#bib-ref("Erdelyi1953"), §2.5.3) describe three ways of using $F(a,b;c;z)$ for
this purpose: assigning special values to $z$; choosing negative integers for
upper parameters; and comparing coefficients of like powers of $z$ in different
expressions for a hypergeometric series.

For example, @eq:gauss-summation gives $F(m,-m;1;1)=0$ for a positive integer
$m$. Expanding the terminating series gives (#bib-ref("Erdelyi1953"), §2.5.3)
#eq(
  $
    sum_(n=1)^m frac((-1)^(n-1)(m+n-1)!, n! n! (m-n)!)=frac(1, m).
  $,
) <eq:alternating-factorial-sum>
The following three examples are taken from #bib-ref("Erdelyi1953").

#example(title: [], suffix: [*. Lerch's theorem*])[
  (#bib-ref("Erdelyi1953"), §2.5.3). The definition gives
  $
    F(1,-u;-v;z)=sum_(n=0)^infinity frac(binom(u, n), binom(v, n))z^n.
  $
  For the nonterminating sums below, assume $v != 0,1,2,dots$ and $Re(u-v)>1$.
  By @eq:gauss-summation, #eq(
    $
      sum_(n=0)^infinity frac(binom(u, n), binom(v, n))
      =frac(Gamma(-v)Gamma(u-v-1), Gamma(-v-1)Gamma(u-v))
      =1+frac(u, v-u+1).
    $,
  ) <eq:binomial-ratio-sum>
  #index-mark([@eq:binomial-ratio-sum], group: [Theorems])[Lerch]
  For a nonnegative integer $m$, the identity
  $
    binom(u, n+m)=binom(u, m)binom(u-m, n)frac(n!m!, (n+m)!)
  $
  also gives #eq(
    $
      sum_(n=0)^infinity frac(binom(u, n+m), binom(v, n+m))
      &=frac(binom(u, m), binom(v, m))
      sum_(n=0)^infinity frac(binom(u-m, n), binom(v-m, n)) \
      &=frac(v-m+1, v-u+1)frac(binom(u, m), binom(v, m)).
    $,
  ) <eq:binomial-ratio-tail>
  #index-mark([@eq:binomial-ratio-tail], group: [Theorems])[Lerch]
  #source(83, "71")
  Subtracting this tail from @eq:binomial-ratio-sum yields #eq(
    $
      sum_(n=0)^(m-1)frac(binom(u, n), binom(v, n))
      =frac(v+1, v-u+1)
      lr((1-frac(binom(u, m), binom(v+1, m)))),
    $,
  ) <eq:binomial-ratio-partial-sum>
  #index-mark([@eq:binomial-ratio-partial-sum], group: [Theorems])[Lerch]
  which, together with @eq:binomial-ratio-tail, is called _Lerch's theorem_. The
  finite identity @eq:binomial-ratio-partial-sum extends as a rational identity
  in $u,v$, wherever its displayed denominators are nonzero; it does not require
  the convergence condition on the infinite sums.
] <ex:binomial-ratio-sum>

#example(title: [], suffix: [*. The Saalschütz formula*])[
  #bib-ref("Erdelyi1953"). Write @eq:euler-transformation as
  $
    (1-z)^(a+b-c)F(a,b;c;z)=F(c-a,c-b;c;z),
  $
  expand both sides in powers of $z$, and compare the coefficients of $z^n$:
  $
    sum_(r=0)^n frac((a)_r (b)_r, (c)_r r!)
    frac((c-a-b)_(n-r), (n-r)!)
    =frac((c-a)_n (c-b)_n, (c)_n n!).
  $
  Using $(d)_(n-r)=(d)_n (-1)^r/(1-d-n)_r$ gives #eq(
    $
      sum_(r=0)^n frac(
        (a)_r (b)_r (-n)_r,
        (c)_r (1+a+b-c-n)_r r!
      )
      =frac((c-a)_n (c-b)_n, (c)_n (c-a-b)_n).
    $,
  ) <eq:saalschutz-summation>
  #index-mark([@eq:saalschutz-summation], group: [Formulas])[Saalschütz]
  #index-mark([@eq:saalschutz-summation], group: [Theorems])[Saalschütz]
  This is the _Saalschütz formula_, for $n=0,1,2,dots$, with the displayed
  denominators nonzero, or by continuation when the singularities are removable.
] <ex:saalschutz-summation>

#example(title: [], suffix: [*. Kummer's formula and its corollaries*])[
  (#bib-ref("Erdelyi1953"), §§2.1.5 and 2.5.3). We first prove Kummer's
  quadratic transformation (#bib-ref(
    "Erdelyi1953",
  ), §2.1.5, formula (25)): #eq(
    $
      F(a,b;1+a-b;z) \
      =(1-z)^(-a)
      F lr(
        [frac(a, 2),frac(a, 2)+frac(1, 2)-b;1+a-b;
          frac(-4z, (1-z)^2)]
      ).
    $,
  ) <eq:kummer-transformation>
  #index-mark([@eq:kummer-transformation], group: [Formulas])[Kummer]
  Initially $z$ is near zero, $1+a-b != 0,-1,-2,dots$, and the branch of the
  power equals $1$ at zero. The right-hand side expands as
  $
    sum_(r=0)^infinity
    frac((a/2)_r (a/2+1/2-b)_r, r!(1+a-b)_r)
    (-4z)^r (1-z)^(-a-2r),
  $
  so its coefficient of $z^n$ is
  $
    sum_(r=0)^n
    frac(
      (a/2)_r (a/2+1/2-b)_r (-4)^r (a+2r)_(n-r),
      (1+a-b)_r r!(n-r)!
    ).
  $
  Use the identities
  $
    4^r (a/2)_r (a/2+1/2)_r & =(a)_(2r), \
       (-1)^r (-n)_r (n-r)! & =n!, \
               (a+2r)_(n-r) & =frac((a+n)_r (a)_n, (a)_(2r)).
  $
  #source(84, "72")
  The coefficient becomes, by @eq:saalschutz-summation,
  $
    frac((a)_n, n!)sum_(r=0)^n
    frac(
      (a/2+1/2-b)_r (a+n)_r (-n)_r,
      (1+a-b)_r (a/2+1/2)_r r!
    )
    =frac((a)_n (b)_n, n!(1+a-b)_n).
  $
  This proves @eq:kummer-transformation, first for generic parameters and then
  by continuation wherever both sides are defined.

  Taking $z$ to $-1$ along the real interval and using @eq:gauss-summation gives
  #eq(
    $
      F(a,b;1+a-b;-1) & =frac(
                          2^(-a)Gamma(1+a-b)Gamma(1/2),
                          Gamma(1-b+a/2)Gamma(1/2+a/2)
                        ) \
                      & =sum_(n=0)^infinity
                        frac(binom(-a, n)binom(-b, n), binom(b-a-1, n)).
    $,
  ) <eq:kummer-summation>
  The nonterminating series in @eq:kummer-summation converges for $Re b<1$; the
  gamma quotient also represents the continued function. If $a=-m$, with $m$ a
  nonnegative integer, and $b=-u$, the terminating specialization is #eq(
    $
      sum_(n=0)^m frac(binom(m, n)binom(u, n), binom(m-u-1, n))
      =frac(
        2^m Gamma(1-m+u)sqrt(pi),
        Gamma(1+u-m/2)Gamma(1/2-m/2)
      ).
    $,
  ) <eq:kummer-terminating-sum>
  As usual, denominator factors in the finite sum must be nonzero, and removable
  singularities in the gamma expression are interpreted by limits.

  The next example illustrates a typical use of hypergeometric summation
  formulas for combinatorial sums.

  #metadata((kind: "index-anchor")) <idx:kaucky>
  #index-mark([@idx:kaucky], group: [Identities])[Kaucký]
] <ex:kummer-transformation>

#example(title: [], suffix: [*. Compute the sum*])[
  (#bib-ref("Kaucky1975"), p. 271), for nonnegative integers $n,m$,
  $
    S_(n,m)=sum_(i=0)^n
    frac((a)_i (a/2+1)_i (-n)_i, i!(a/2)_i (a+n+1)_i)
    (i+1)_m (a-m+i)_m.
  $
  Take $a$ generic initially. Since
  $
      (i+1)_m & =frac((i+m)!, i!)=frac(m!(m+1)_i, (1)_i), \
    (a-m+i)_m & =frac((a-m)_m (a)_i, (a-m)_i),
  $
  we obtain
  $
    S_(n,m) & =m!(a-m)_m
              #hyper($F$, 5, 4, $a,a/2+1,a,m+1,-n$, $a/2,1,a-m,a+n+1$, $1$) \
            & =(-1)^n m!(1+a)_n binom(m, n)frac((a-m)_m, (a-m)_n).
  $
  Here the last step uses the terminating form of Dougall's first theorem. The
  corresponding nonterminating theorem (see #bib-ref("Bailey1935"), p. 25, and
  #bib-ref("Mathai1973"), p. 113, formula (4.1.20)) is #eq(
    $
      #hyper($F$, 5, 4, $a,1+a/2,c,d,e$, $a/2,1+a-c,1+a-d,1+a-e$, $1$) \
      =frac(
        Gamma(1+a-c)Gamma(1+a-d)Gamma(1+a-e)
        Gamma(1+a-c-d-e),
        Gamma(1+a)Gamma(1+a-d-e)Gamma(1+a-c-e)
        Gamma(1+a-c-d)
      ),
    $,
  ) <eq:dougall-summation>
  #index-mark([@eq:dougall-summation], group: [Theorems])[Dougall]
  where $Re(1+a-c-d-e)>0$ and no lower parameter is a nonpositive integer. Its
  terminating form is
  $
    #hyper($F$, 5, 4, $a,1+a/2,c,d,-n$, $a/2,1+a-c,1+a-d,1+a+n$, $1$)
    =frac((1+a)_n (1+a-c-d)_n, (1+a-c)_n (1+a-d)_n).
  $
  This follows by taking $e$ to $-n$ first in the convergence region of
  @eq:dougall-summation, and then continuing the resulting rational identity in
  the remaining parameters. Set $c=a$ and $d=m+1$ in this finite formula and use
  $(-m)_n=(-1)^n n!binom(m, n)$. This order of specialization also covers
  $n<=m$, where direct substitution in the nonterminating gamma quotient can
  give an indeterminate expression.
] <ex:dougall-summation>
