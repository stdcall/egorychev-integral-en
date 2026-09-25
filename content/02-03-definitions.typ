#import "index-style.typ": index-mark
#import "statements.typ": definition
#import "hypergeometric.typ": hyper
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(79, "67")
#heading(level: 2)[
  Hypergeometric series and the problem of computing one-dimensional sums with
  binomial coefficients
] <sec:hypergeometric-summation>

#heading(level: 3)[
  Summation problems and Bateman's idea
] <sec:bateman-idea>

Gauss's familiar summation formulas for hypergeometric series include summation
formulas with ordinary and $q$-binomial coefficients.

#source(80, "68")
The idea of using the theory of hypergeometric series to compute one-dimensional
sums with binomial coefficients was first put forward by Bateman while
systematizing formulas for special functions (see the Introductions to #bib-ref(
  "Riordan1968",
) and #bib-ref("Gould1972a")). Bateman's program had not been fully realized at
the time of writing, partly because of the scale of the problems posed.
Hypergeometric series were used in a number of subsequent publications to prove
specific identities with ordinary and $q$-binomial coefficients (see, for
example, #bib-ref("Andrews1974", "Andrews1975", "Kaucky1975")).

Andrews #bib-ref("Andrews1974") considered the general problem of classifying
and computing sums over partitions and identities with ordinary and $q$-binomial
coefficients. He proposed a simple procedure (see @th:factorial-multiplication
below) for converting one-dimensional binomial identities, when possible, into
identities for basic hypergeometric functions, and illustrated its use on
specific identities. He also used this procedure on a computer to analyze the
identities in Gould's book #bib-ref("Gould1972a"). In this approach, computing
in closed form those one-dimensional binomial sums that reduce to hypergeometric
series amounts to computing the corresponding hypergeometric series in closed
form. The latter problem had not been completely solved at the time of writing.

#heading(level: 3)[
  The main properties and summation formulas for hypergeometric series
] <sec:hypergeometric-formulas>

For the purposes of this exposition, we define hypergeometric functions by
series. Let $(a)_0=1$ and $(a)_n=a(a+1) dots (a+n-1)$ for $n=1,2,dots$.

#definition[
  The _Gauss hypergeometric function_ is defined, initially for $abs(z)<1$, by
  the series #eq(
    $
      F(a,b;c;z)=sum_(n=0)^infinity frac((a)_n (b)_n, (c)_n n!)z^n,
      quad c != 0,-1,-2,dots.
    $,
  ) <eq:gauss-series>
  If an upper parameter is a nonpositive integer, the series terminates. For
  $Re c>Re b>0$ and $abs(z)<1$, Euler's integral formula is #eq(
    $
      F(a,b;c;z)=frac(Gamma(c), Gamma(b)Gamma(c-b))
      integral_0^1 frac(t^(b-1)(1-t)^(c-b-1), (1-t z)^a)dif t.
    $,
  ) <eq:euler-integral>
  The power is taken on the branch equal to $1$ at $z=0$. In particular, #eq(
    $
      F(a,b;c;1)=frac(Gamma(c)Gamma(c-a-b), Gamma(c-a)Gamma(c-b)),
    $,
  ) <eq:gauss-summation>
  initially for $Re c>Re b>0$ and $Re(c-a-b)>0$. By continuation in the
  parameters, @eq:gauss-summation holds for $c != 0,-1,-2,dots$ and
  $Re(c-a-b)>0$; reciprocal gamma factors are interpreted by their entire
  continuations. Also, for $abs(z)<1$, #eq(
    $
      F(a,b;c;z)=(1-z)^(c-a-b)F(c-a,c-b;c;z),
    $,
  ) <eq:euler-transformation>
  with the same exclusion on $c$ and the branch equal to $1$ at $z=0$.
] <def:gauss-series>
#index-mark([@def:gauss-series], group: [Series])[Hypergeometric, Gauss]

#source(81, "69")
There are other integral representations of $F(a,b;c;z)$ besides
@eq:euler-integral (see #bib-ref("Erdelyi1953"), §2.1.3, formula (13)).

#definition[
  A _generalized hypergeometric series_ is defined by (#bib-ref("Erdelyi1953"),
  §4.1) #eq(
    $
      #hyper($F$, $p$, $q$, $alpha_1,dots,alpha_p$, $rho_1,dots,rho_q$, $z$)
      &=attach(F, bl: p, b: q)(alpha_r;rho_t;z) \
      &=sum_(n=0)^infinity
      frac((alpha_1)_n dots (alpha_p)_n, (rho_1)_n dots (rho_q)_n n!)z^n.
    $,
  ) <eq:hypergeometric-series>
  We exclude nonpositive integers among the lower parameters $rho_1,dots,rho_q$.
  A nonpositive integer upper parameter makes the series terminate. Otherwise,
  the series converges for every finite $z$ if $p<=q$, converges for $abs(z)<1$
  if $p=q+1$, and diverges for every $z != 0$ if $p>q+1$. In this notation,
  $
    F(a,b;c;z)=attach(F, bl: 2, b: 1)(a,b;c;z)
    =#hyper($F$, 2, 1, $a,b$, $c$, $z$).
  $
] <def:hypergeometric-series>
#index-mark([@def:hypergeometric-series], group: [Series])[Hypergeometric,
  generalized]

We also consider the bilateral hypergeometric series (#bib-ref("Andrews1974"),
p. 474) #eq(
  $
    #hyper($H$, $n$, $n$, $a_1,dots,a_n$, $b_1,dots,b_n$, $z$)
    =sum_(m=-infinity)^infinity
    frac((a_1)_m dots (a_n)_m, (b_1)_m dots (b_n)_m)z^m,
  $,
) <eq:bilateral-hypergeometric-series>
#index-mark(
  [@eq:bilateral-hypergeometric-series],
  group: [Series],
  after: [Hypergeometric, generalized],
)[Hypergeometric, bilateral $attach(H, bl: n, b: n)$]
where $(a)_(-m)=(-1)^m/(1-a)_m$ for positive integers $m$, wherever defined.
Both tails of a bilateral series must converge. Setting $b_1=1$, with the other
parameters generic and reciprocal denominator factors interpreted by
continuation, makes the negative-index terms vanish and reduces
@eq:bilateral-hypergeometric-series to $attach(F, bl: n, b: n-1)$.

#definition(suffix: [])[
  (#bib-ref("Erdelyi1953"), §4.4; #bib-ref("Andrews1974"), p. 475). We call
  @eq:bilateral-hypergeometric-series a _Saalschütz series_ if
  $a_1+a_2+dots+a_n+2=b_1+b_2+dots+b_n$; _well-poised_ if
  $a_1+b_1=a_2+b_2=dots=a_n+b_n$; and _nearly-poised_ if only some $n-2$ of the
  latter equalities hold.
] <def:bilateral-parameter-conditions>
#index-mark(
  [@def:bilateral-parameter-conditions],
  group: [Series],
)[Hypergeometric, nearly-poised]
#index-mark(
  [@def:bilateral-parameter-conditions],
  group: [Series],
)[Hypergeometric, well-poised]
#index-mark(
  [@def:bilateral-parameter-conditions],
  group: [Series],
  after: [Hypergeometric, well-poised],
)[Hypergeometric, Saalschütz form]

#definition(suffix: [])[
  (#bib-ref("Andrews1974"), p. 441). A _basic hypergeometric series_ is defined
  by #eq(
    $
      #hyper($Phi$, $m$, $n$, $a_1,dots,a_m$, $b_1,dots,b_n$, $q,z$)
      =sum_(j>=0)frac([a_1]_j dots [a_m]_j, [b_1]_j dots [b_n]_j [q]_j)z^j,
    $,
  ) <eq:basic-hypergeometric-series>
  where
  $
    [a]_r=[a;q]_r=product_(h=0)^(r-1)(1-a q^h), quad [a]_0=1.
  $
  Here $abs(z)<1$, $0<abs(q)<1$, and $b_i != q^(-ell)$ for $ell=0,1,2,dots$ and
  $i=1,dots,n$.#editorial-note("basic-normalization")[
    In the modern convention, the $j$th summand has the additional factor
    $[(-1)^j q^(j(j-1)\/2)]^(1+n-m)$. The conventions agree for $m=n+1$; see
    #cite(<Gasper2004>, supplement: [§1.2, pp. 4–5]).
  ]
] <def:basic-hypergeometric-series>
#index-mark(
  [@def:basic-hypergeometric-series],
  group: [Series],
  after: [Hypergeometric, Saalschütz form],
)[Basic hypergeometric]

As in @eq:bilateral-hypergeometric-series, we consider the bilateral series #eq(
  $
    #hyper($Psi$, $n$, $n$, $alpha_1,dots,alpha_n$, $beta_1,dots,beta_n$, $q,t$)
    =sum_(m=-infinity)^infinity
    frac([alpha_1]_m dots [alpha_n]_m, [beta_1]_m dots [beta_n]_m)t^m.
  $,
) <eq:bilateral-basic-series>
#index-mark([@eq:bilateral-basic-series], group: [Series], after: [Basic
  hypergeometric])[Basic hypergeometric, bilateral $attach(Psi, bl: n, b: n)$]
For negative indices we use $[a]_(-m)=1/product_(s=1)^m (1-a q^(-s))$, wherever
defined. For generic nonzero parameters and $0<abs(q)<1$, the convergence
annulus is
$
  abs(frac(beta_1 dots beta_n, alpha_1 dots alpha_n))<abs(t)<1.
$
Setting $beta_1=q$, with the other parameters generic, makes the negative-index
terms vanish by the same reciprocal-factor convention and reduces the series to
$attach(Phi, bl: n, b: n-1)$.

#definition(suffix: [])[
  (#bib-ref("Andrews1974"), p. 475). We say that @eq:bilateral-basic-series is a
  _Saalschütz form series_ if
  $alpha_1 alpha_2 dots alpha_n q^2=beta_1 beta_2 dots beta_n$; _well-poised_ if
  $alpha_1 beta_1=alpha_2 beta_2=dots=alpha_n beta_n$; and _nearly-poised_ if
  some $n-2$ of the latter equalities hold.
] <def:basic-bilateral-parameter-conditions>
#index-mark(
  [@def:basic-bilateral-parameter-conditions],
  group: [Series],
  after: [Basic hypergeometric],
)[Basic hypergeometric, nearly-poised]
#index-mark(
  [@def:basic-bilateral-parameter-conditions],
  group: [Series],
  after: [Basic hypergeometric],
)[Basic hypergeometric, well-poised]
#index-mark(
  [@def:basic-bilateral-parameter-conditions],
  group: [Series],
  after: [Basic hypergeometric, well-poised],
)[Basic hypergeometric, Saalschütz form]

Hypergeometric series form a well-studied area of mathematics with a vast
literature. The reader can find the required elementary relations for
#source(82, "70")
$F(a,b;c;z)$ in, for example, #bib-ref("Erdelyi1953"), §2.8, formulas (18)–(45).
In the same reference, see §4.3 for identities and recurrence relations; §2.5.2
for products of hypergeometric series; §2.8, formulas (46)–(56), for special
values of $z$; and §4.8, formulas (11) and (12), and their consequences. Tables
of linear, quadratic, and higher-degree transformations are given in §2.9,
formulas (1)–(44), and §2.11, formulas (1)–(47). Chapters 4–6 discuss various
generalizations of $F(a,b;c;z)$ and formulas for them. Lists of summation
formulas for hypergeometric series are given, for example, in #bib-ref(
  "Mathai1973",
), pp. 109–116 and 117–126, and in #bib-ref("Bailey1935") and #bib-ref(
  "Slater1966",
), Appendices III and IV.
