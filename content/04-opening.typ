#import "statements.typ": proof, proposition
#import "main-defs.typ": bib-ref, source

#source(123, "111")
#heading(level: 1)[
  Combinatorial Interpretation, Integral Representation, and Estimation of
  Certain Sums in Combinatorial Analysis
] <ch:combinatorial-interpretation>
#heading(
  level: 2,
  numbering: none,
)[Introduction] <sec:interpretation-introduction>

This chapter considers the idea of a generating function from Rota's point of
view, together with aspects of the combinatorial approach to summation. We use
integral representations to evaluate the solutions of enumeration problems and
obtain asymptotic estimates for them. The formal framework of #bib-ref(
  "Rota1964",
  "Doubilet1972b",
), presented in @sec:rota-generating-functions, explains the origin of
generating functions not only of power-series type, as considered in this book,
but also of Dirichlet series, Euler series and other types. The open problems in
@ch:open-problems[Chapter] include the possibility of extending the theory
developed here to generating functions other than power series.

In @sec:identity-interpretations we give combinatorial proofs of several
summation formulas, using familiar enumeration models. In
@sec:stirling-tree-proof, written jointly with B. I. Selivanov, we generalize
two combinatorial identities by combinatorial means. This section illustrates
how purely combinatorial arguments can establish quite complicated summation
formulas, both new and known.

In @sec:enumeration-integrals the method of integral representation is used to
evaluate complicated expressions arising as solutions of enumeration problems.
The results also illustrate the role of “secondary” enumeration methods,
including analytic methods for obtaining and simplifying the desired formula.

In @sec:asymptotic-estimates we show how integral representations can yield
asymptotic formulas for solutions of enumeration problems. We confine ourselves
to theorems of Tauberian type concerning coefficients of generating functions
#source(124, "112")
in one or several variables. The works of Soviet authors in #bib-ref(
  "Ivchenko1965a",
  "Ivchenko1965b",
  "Sevastyanov1964",
  "Kolchin1966",
  "Viktorova1965",
  "Kolchin1976",
  "Malyshev1973",
) give striking applications of these asymptotic methods to combinatorial and
probabilistic problems.

In @sec:interpretation-problems we formulate several research problems in
combinatorics for which the methods of @sec:enumeration-integrals and
@sec:asymptotic-estimates may be useful.

#heading(level: 2)[
  The Idea of a Generating Function (According to Rota)
] <sec:rota-generating-functions>
#heading(level: 3)[Notation and terminology] <sec:poset-terminology>

We introduce notation and recall the main concepts of the theory of ordered
sets. The letters $P,Q,dots$ denote partially ordered sets, with order relation
$<=$. Throughout, these sets are *locally finite*: every interval
$[x,y]={z in P:x<=z<=y}$ is finite.

If $P$ has a least element, we denote it by $0$; if it has a greatest element,
we denote it by $1$. A subset $Z subset.eq P$ is an *order ideal* if $x in Z$
and $y<=x$ imply $y in Z$.

An element $p$ *covers* an element $q$ if $[q,p]$ contains exactly two elements.
A *chain* is an ordered set in which every two elements are comparable. A
maximal chain in $[x,y]$ is a sequence $x_0,x_1,dots,x_n$ such that $x_0=x$,
$x_n=y$, and $x_(i+1)$ covers $x_i$ for $0<=i<n$.

Let $M subset.eq P$. An element $x in P$ is an *upper bound* of $M$ if $y<=x$
for every $y in M$, and a *lower bound* if $x<=y$ for every $y in M$. If the
upper bounds have a least element, it is the *supremum* of $M$; if the lower
bounds have a greatest element, it is the *infimum* of $M$.

A *lattice* is an ordered set in which every pair $x,y$ has an infimum $x and y$
and a supremum $x or y$. A lattice is *distributive* if
$
  (x and y)or z & =(x or z)and(y or z), \
  (x or y)and z & =(x and z)or(y and z)
$
for every $x,y,z in P$. A typical example is the set of all subsets of a set,
ordered by inclusion.

A subset $Q$ of a lattice $P$ is a *sublattice* if $x and y$ and $x or y$ belong
to $Q$ whenever $x,y in Q$. A subset with the induced order may itself be a
lattice without being a sublattice of $P$. Every sublattice of a distributive
lattice is distributive.

The next subsection is a survey, and proofs are generally omitted. The algebraic
and topological concepts used may be found, for example, in #bib-ref(
  "Naimark1956",
).

#source(125, "113")
#block(breakable: false)[
  #heading(level: 3)[
    The incidence algebra and the Möbius function
  ] <sec:incidence-algebra>

  Let $P$ be a locally finite ordered set, and let $K$ be a field of
  characteristic $0$. Write $I(P,K)$ for the vector space of functions
  $f:P times P->K$ such that $f(x,y)=0$ unless $x<=y$. Define multiplication by
  $
    (f ast g)(x,y)=sum_(z in P)f(x,z)g(z,y)
    =sum_(z in [x,y])f(x,z)g(z,y).
  $
]
These sums are finite. The resulting algebra, generally noncommutative, is
called the *incidence algebra*. Its identity is the Kronecker delta:
$ delta(x, y)=cases(1 &quad "if" x=y, 0 &quad "if" x!=y). $
We shall write $I(P)$ for $I(P,K)$, with the field $K$ fixed.

The *zeta function* $zeta$ of $P$ is the characteristic function of its order
relation: $zeta(x, y)=1$ if $x<=y$, and $zeta(x, y)=0$ otherwise.

#proposition[
  The zeta function is invertible in the incidence algebra.
] <prop:zeta-invertibility>

Its inverse is called the *Möbius function* of $P$, denoted by $mu$. It can also
be defined recursively:
$
  mu(x, x) & =1, quad x in P, \
  mu(x, y) & =-sum_(x<=z<y)mu(x, z), quad x<y, \
  mu(x, y) & =0, quad x lt.eq.not y.
$
For the ordered set ${0,1}$ with $0<1$, we have $mu(0, 0)=mu(1, 1)=1$,
$mu(1, 0)=0$, and $mu(0, 1)=-1$.

#proposition(name: [Möbius inversion formula])[
  Suppose $f:P->K$ and there is a $p in P$ such that $f(x)=0$ unless $p<=x$. If
  $ g(x)=sum_(y<=x)f(y), $
  then
  $ f(x)=sum_(y<=x)g(y)mu(y, x). $
] <prop:mobius-inversion>

#source(126, "114")
#proof[
  For an incidence function $h$, define its right action by
  $(f ast h)(x)=sum_(y<=x)f(y)h(y,x)$. The support assumption and local
  finiteness make these sums finite. Since $g=f ast zeta$, associativity gives
  $
    g ast mu=(f ast zeta)ast mu=f ast(zeta ast mu)=f ast delta=f.
  $
]

#proposition[
  The Möbius function of an interval $[x,y]$ in $P$ is the restriction of the
  Möbius function of $P$ to pairs of elements of that interval.
] <prop:interval-restriction>

#proposition(name: [inclusion–exclusion principle])[
  Let $P$ be the Boolean algebra of all subsets of an $n$-element set $M$. For
  $x<=y$,
  $ mu(x, y)=(-1)^(n(y)-n(x)), $
  where $n(x)$ denotes the number of elements of $x$.
] <prop:boolean-mobius-function>

Put $n(x,y)=zeta(x, y)-delta(x, y)$. This incidence function has a simple
combinatorial interpretation: its convolution power $n^(k)(x,y)$ counts strict
chains $x=x_0<x_1<dots<x_k=y$. The zeroth power is $delta$. Moreover,
$ mu(x, y)=sum_(i=0)^infinity (-1)^i n^(i)(x,y). $
For each fixed interval, only finitely many terms are nonzero.

Give $K$ the discrete topology and $I(P)$ the topology of pointwise convergence.
Thus a net $(f_alpha)$ converges to $f$ if, for each fixed $(x,y)$, its value
$f_(alpha)(x,y)$ eventually equals $f(x,y)$. For nets, see #bib-ref(
  "Kelley1955",
), Chapter 2, “Directed sets and nets”.
