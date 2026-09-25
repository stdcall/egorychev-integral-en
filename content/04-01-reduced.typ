#import "index-style.typ": index-mark
#import "statements.typ": example, proposition, theorem
#import "main-defs.typ": source

#let sim = $∼$

#let incidence(a, b, c) = $lr([vec(delim: #none, #a, #b comma #c)])$

#source(126, "114")
#heading(level: 3)[Reduced incidence algebras] <sec:reduced-incidence-algebra>

Enumeration problems often lead to subalgebras of the incidence algebra. A
natural way to obtain them is to put an equivalence relation on the intervals of
$P$ and consider functions that take the same value on equivalent intervals.

Let $S(P)$ be the set of intervals of $P$, and let $sim$ be an equivalence
relation on $S(P)$. Denote by $A_(sim)$ the vector space of functions
$f in I(P)$ satisfying $f(x,y)=f(u,v)$ whenever $[x,y]sim[u,v]$. The relation is
*compatible with the order* if $A_(sim)$ is a subalgebra of $I(P)$. Not every
equivalence relation has this property. The *standard* relation, which
identifies two intervals exactly when they are isomorphic as ordered sets, is
compatible. Here an order isomorphism is a bijection $phi$ such that $x<=y$ if
and only if $phi(x)<=phi(y)$.

#proposition[
  The compatible equivalence relations form a complete lattice, ordered by
  refinement.
] <prop:compatible-equivalence-lattice>

All equivalence relations on intervals considered below are assumed to be
compatible with the order on $P$.

#source(127, "115")
Let $tilde(P)$ be the set of equivalence classes, called *types*. Each
$f in A_(sim)$ determines a function on $tilde(P)$ by $tilde(f)(alpha)=f(x,y)$
for $[x,y]in alpha$.

For $alpha,beta,gamma in tilde(P)$, the *incidence coefficient*
$incidence(alpha, beta, gamma)$ is the number of $z in [x,y]$ such that
$[x,z]in beta$ and $[z,y]in gamma$, where $[x,y]in alpha$. To see that this does
not depend on the representative interval, put
$
  delta_(alpha)(x,y)=cases(
    1 & quad "if" [x,y]in alpha,
    0 & quad "otherwise".
  )
$
Then $delta_alpha in A_(sim)$, and
$
  (delta_beta ast delta_gamma)(x,y)=incidence(alpha, beta, gamma).
$
Compatibility makes this convolution constant on each type $alpha$.

Incidence multiplication therefore induces multiplication on
$tilde(A)={tilde(f):f in A_(sim)}$. If $h=f ast g$, then
$
  tilde(h)(alpha)=sum_(beta,gamma in tilde(P))
  incidence(alpha, beta, gamma)tilde(f)(beta)tilde(g)(gamma).
$
For each $alpha$ only finitely many summands are nonzero. This algebra is called
the *incidence algebra of $P$ reduced by $sim$*, or the *reduced incidence
algebra*, and is denoted by $R(P,sim)$. We identify it with the corresponding
subalgebra of $I(P)$.

The *Schur product* of $f,g in I(P)$ is their pointwise product,
$h(x,y)=f(x,y)g(x,y)$. The following criterion characterizes reduced algebras.

#theorem[
  Let $A$ be a subalgebra of $I(P)$ with the same identity. Then $A$ is a
  reduced incidence algebra if and only if it contains $zeta$, is closed under
  Schur multiplication, and is closed in the topology of pointwise convergence.
] <th:reduced-algebra-characterization>

Every reduced algebra contains $delta$ and the diagonal functions that are
constant on each type of singleton interval. If $f in R(P,sim)$ is invertible in
$I(P)$, its inverse also belongs to $R(P,sim)$.

For the standard relation, $[a,b]sim[c,d]$ means that the two intervals are
isomorphic as ordered sets. The resulting algebra is called the *standard
reduced algebra*.

The incidence coefficients are generalized binomial coefficients. The algebra
$R(P,sim)$ is commutative if and only if
$
  incidence(alpha, beta, gamma)=incidence(alpha, gamma, beta)
  quad "for all" alpha,beta,gamma in tilde(P).
$

#metadata((kind: "index-anchor")) <idx:series-formal>
#index-mark([@idx:series-formal], group: [Series])[Power, formal]
#example(name: [formal power series])[
  Let $P$ be the nonnegative integers with their usual order. Its incidence
  algebra is the algebra of infinite upper triangular matrices. For the standard
  relation, the type of an interval is its length, so $tilde(P)$ is the set of
  nonnegative integers.
  #source(128, "116")
  Each $f in R(P,sim)$ is determined by a sequence $(a_n)_(n>=0)$ in $K$, with
  $f(i,j)=a_(j-i)$ for $i<=j$. The incidence coefficients are
  $
    incidence(n, p, q)=cases(1 &quad "if" n=p+q, 0 &quad "otherwise".).
  $
  #block(sticky: true)[Consequently,]
  $
    h(i,j) & =(f ast g)(i,j)=sum_(i<=k<=j)f(i,k)g(k,j) \
           & =sum_(i<=k<=j)a_(k-i)b_(j-k).
  $
  Writing $r=k-i$ and $n=j-i$, we obtain
  $ h(i,j)=sum_(r=0)^n a_r b_(n-r)=c_n. $
  Thus multiplication is convolution of sequences, and the map
  $
    R(P,sim)∋ f |-> F(w)=sum_(n=0)^infinity f(0,n)w^n
  $
  is an isomorphism onto the algebra of formal power series. Under this map,
  $delta$ corresponds to $1$, $zeta$ to $sum_(n=0)^infinity w^n=(1-w)^(-1)$, and
  $mu$ to $1-w$.

  Recall that $n=zeta-delta$, whose convolution powers count strict chains. The
  function counting all chains between two endpoints is
  $
    c(x,y)=sum_(k=0)^infinity n^(k)(x,y)
    =(delta-(zeta-delta))^(-1)(x,y)=(2delta-zeta)^(-1)(x,y).
  $
  In this example its generating function is
  $
    C(w)=lr((2-frac(1, 1-w)))^(-1)
    =frac(1-w, 1-2w)=1+sum_(n=1)^infinity 2^(n-1)w^n.
  $

  #metadata((kind: "index-anchor")) <idx:series-exponential>
  #index-mark([@idx:series-exponential], group: [Series], after: [Power,
    formal])[Power, exponential type]
] <ex:chain-incidence-algebra>

#example(name: [exponential power series])[
  Let $P$ be the finite subsets of a countably infinite set $S$, ordered by
  inclusion. For the standard relation, the type of $[x,y]$ is the nonnegative
  integer $v(x,y)=|y without x|$. We have
  $
    incidence(n, p, q)=cases(
      binom(n, p) & quad "if" n=p+q,
      0 & quad "otherwise".
    )
  $
  Every function $f in R(P,sim)$ is determined by a sequence $(a_n)_(n>=0)$,
  with $f(x,y)=a_(v(x,y))$.
  #source(129, "117")
  The correspondence
  $ f |-> F(w)=sum_(n=0)^infinity frac(a_n, n!)w^n $
  is an isomorphism with the algebra of exponential power series: multiplication
  of series corresponds to binomial convolution of their coefficient sequences.
  #block(sticky: true)[
    The zeta and Möbius functions correspond to $e^w$ and $e^(-w)$,
    respectively, while the chain-counting function corresponds to
  ]
  $ C(w)=frac(1, 2-e^w)=sum_(n=0)^infinity frac(f_n, n!)w^n. $
  Here $f_n$ counts ordered partitions of an $n$-element set into nonempty
  blocks, with one empty partition when $n=0$.

  #metadata((kind: "index-anchor")) <idx:series-dirichlet>
  #index-mark([@idx:series-dirichlet], group: [Series])[Dirichlet]
] <ex:subset-incidence-algebra>

#example(name: [formal Dirichlet series])[
  Let $G=bb(Q)/bb(Z)$ be the additive group of rational numbers modulo $1$, and
  let $L(G)$ be the lattice of its finite subgroups, ordered by inclusion. Every
  finite subgroup is cyclic, and there is a unique subgroup of each positive
  order. Thus $L(G)$ is isomorphic to the positive integers ordered by
  divisibility.

  Define $[x,y]sim_1[u,v]$ when the quotient groups $y/x$ and $v/u$ are
  isomorphic. The type of $[x,y]$ is then the order of $y/x$. This relation is
  finer than the standard relation on intervals. Its incidence coefficients are
  $
    incidence(n, p, q)=cases(1 &quad "if" n=p q, 0 &quad "otherwise".).
  $
  Multiplication in $R(L(G),sim_1)$ is Dirichlet convolution,
  $ c_n=sum_(i j=n)a_i b_j, $
  and the map
  $ f |-> F(s)=sum_(n=1)^infinity frac(a_n, n^s) $
  identifies this algebra with formal Dirichlet series. The incidence zeta
  function corresponds to the formal Riemann zeta series
  $zeta(s)=sum_(n=1)^infinity n^(-s)$, and the chain-counting function to
  $ C(s)=frac(1, 2-zeta(s)). $
] <ex:rational-subgroup-incidence>

#example[
  Let $P$ be the positive integers ordered by divisibility. For the standard
  relation, $[a,b]sim[c,d]$ if and only if $b/a$ and $d/c$ have the same
  multiset of exponents in their prime factorizations. The finer relation
  $sim_1$ identifies intervals with the same ratio $b/a$.
  #source(130, "118")
  Then $R(P,sim)$ is a subalgebra of $R(P,sim_1)$, the formal Dirichlet algebra.
  Under this identification, a series $sum_(n=1)^infinity f(n)n^(-s)$ belongs to
  $R(P,sim)$ precisely when $f(n_1)=f(n_2)$ whenever $n_1$ and $n_2$ have the
  same multiset of prime exponents. The chain-counting function has coefficients
  $f(n)$ equal to the number of ordered factorizations of $n=y/x$ into factors
  greater than $1$; the empty factorization gives $f(1)=1$.

  #metadata((kind: "index-anchor")) <idx:series-euler>
  #index-mark([@idx:series-euler], group: [Series], after: [Power, exponential
    type])[Power, Euler type]
] <ex:divisibility-incidence-algebra>

#example(name: [Euler power series])[
  Let $V$ be a vector space of countably infinite dimension over the finite
  field $op("GF")(q)$, where $q$ is a prime power. Let $L(V)$ be the lattice of
  finite-dimensional subspaces, and use the standard interval relation. The type
  of $[x,y]$ is $dim(y/x)$, and
  $
    incidence(n, p, r)=cases(
      frac(
        (1-q^n)dots(1-q),
        (1-q^p)dots(1-q)(1-q^r)dots(1-q)
      ) & quad "if" n=p+r,
      0 & quad "otherwise".
    )
  $
  Empty products are $1$. The corresponding reduced algebra is isomorphic to the
  algebra of Euler power series under
  $
    f |-> sum_(n=0)^infinity frac(f(n), (1-q)dots(1-q^n))x^n.
  $
] <ex:subspace-incidence-algebra>
