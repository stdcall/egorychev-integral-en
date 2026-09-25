#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source

#source(136, "124")
*Generalization of Rényi's identity of Abel type.* The following identity is
well known in the theory of trees #bib-ref("Renyi1959"): #eq(
  $
    sum_(j=1)^n binom(n, j)j^(j-1)(n-j+1)^(n-j-1)
    =2n(n+1)^(n-2), quad n>=1.
  $,
) <eq:rooted-tree-convolution>
#index-mark([@eq:rooted-tree-convolution], group: [Identities])[Rényi]
We prove a generalization by using $m$-trees (#bib-ref("Selivanov1972"), p. 63).
Here an $m$-tree is a hypergraph with labelled vertices and unlabelled edges,
each containing $m$ vertices, whose incidence graph is a tree. It has $(m-1)r+1$
vertices when it has $r$ edges. The identity is #eq(
  $
    m[(m-1)r+1]^(r-2) \
    =sum_(r_1+dots+r_m=r-1)frac((r-1)!, product_(i=1)^m r_i!)
    product_(i=1)^m [(m-1)r_i+1]^(r_i-1),
  $,
) <eq:hypertree-convolution>
where $r>=1$ and $m>=2$ are integers and all $r_i>=0$.

#source(137, "125")
*Combinatorial proof.* Let $t_r^((m))$ be the number of $m$-trees on a fixed
labelled vertex set with $r$ edges. According to #bib-ref("Selivanov1972"), #eq(
  $
    t_r^((m))=frac([(m-1)r]![(m-1)r+1]^(r-1), r![(m-1)!]^r).
  $,
) <eq:hypertree-count>
This includes $t_0^((m))=1$, the tree consisting of a single vertex. The same
reference gives #eq(
  $
    r t_r^((m)) & =binom((m-1)r+1, m)
                  sum_(r_1+dots+r_m=r-1) \
                & quad times frac([(m-1)(r-1)]!, product_(i=1)^m [(m-1)r_i]!)
                  product_(i=1)^m t_(r_i)^((m)), quad r>=1,
  $,
) <eq:hypertree-recurrence>
where again all $r_i>=0$.

Here is the argument. Removing an edge $E={x_1,dots,x_m}$ from an $m$-tree
splits it into $m$ connected components $H_1,dots,H_m$. Component $H_i$ contains
$x_i$ and $r_i>=0$ edges, with $r_1+dots+r_m=r-1$; it is a single vertex when
$r_i=0$. We can therefore construct every tree with a distinguished edge as
follows:

a) Choose the $m$ vertices of that edge from the $(m-1)r+1$ labelled vertices,
in $binom((m-1)r+1, m)$ ways. List them as $x_1,dots,x_m$ in a fixed order of
their labels.

b) Choose an ordered tuple $(r_1,dots,r_m)$ of nonnegative integers with sum
$r-1$.

c) Divide the remaining $(m-1)(r-1)$ vertices into disjoint subsets
$X_1,dots,X_m$, where $|X_i|=(m-1)r_i$. The number of choices is
$ frac([(m-1)(r-1)]!, product_(i=1)^m [(m-1)r_i]!). $

d) For each $i$, choose one of the $t_(r_i)^((m))$ trees on $X_i union {x_i}$.

Each resulting $m$-tree is counted exactly $r$ times, once for each possible
distinguished edge. This proves @eq:hypertree-recurrence. Substituting
@eq:hypertree-count for the tree counts and cancelling the factorials gives
@eq:hypertree-convolution.

#source(138, "126")
For $m=2$, take $r=n$ and $j=r_1+1$ in @eq:hypertree-convolution and multiply by
$n$. Using $n binom(n-1, j-1)=j binom(n, j)$ gives @eq:rooted-tree-convolution.

*Analytic proof.* Denote the right side of @eq:hypertree-convolution by $S$, and
put $a=m-1$. For $j>=1$,
$
  frac((a j+1)^(j-1), j!)
  =frac((a j+1)^j, j!)-a frac((a j+1)^(j-1), (j-1)!).
$
Consequently, for every $j>=0$ and every positively oriented circle of radius
$rho>0$,
$
  frac((a j+1)^(j-1), j!)
  =frac(1, 2pi i)integral_(|z|=rho)
  frac((1-a z)e^((a j+1)z), z^(j+1))dif z.
$
The case $j=0$ follows directly from the residue and has value $1$.

Introduce $tau$ to impose the condition $r_1+dots+r_m=r-1$. Scaling the
numerator in each coefficient formula gives
$
  S & =(r-1)!res_tau frac(1, tau^r)
      sum_(r_1=0)^infinity dots sum_(r_m=0)^infinity \
    & quad times product_(i=1)^m frac(1, 2pi i)integral_(|z_i|=rho)
      frac((1-a tau z_i)e^((a r_i+1)tau z_i), z_i^(r_i+1))dif z_i.
$
For summation under these integrals, fix $rho>1$ and restrict $tau$ to a small
neighborhood of zero such that $e^(a|tau|rho)<rho$. The geometric series then
converge uniformly on the circles. Their sum is
$
  S=(r-1)!res_tau frac(1, tau^r)
  lr(
    [frac(1, 2pi i)integral_(|z|=rho)
      frac(e^(tau z)(1-a tau z), z-e^(a tau z))dif z]
  )^m.
$
By Rouché's theorem, the denominator has exactly one zero inside the circle,
near $z=1$. At that zero its derivative is $1-a tau z$, which cancels the
corresponding factor in the numerator. Let $w(tau)$ be $tau$ times this zero. It
is the local solution of $tau=w e^(-a w)$ with $w(0)=0$. Evaluating the integral
by its residue gives #eq(
  $ S=(r-1)!res_tau frac(e^(m w(tau)), tau^r). $,
) <eq:hypertree-residue>
The inversion formula gives
$
  e^(m w(tau))=1+sum_(n=1)^infinity
  frac(m(m+a n)^(n-1), n!)tau^n.
$
For $r>=2$, extracting the coefficient in @eq:hypertree-residue yields
$
  S=m(m+a(r-1))^(r-2)=m[(m-1)r+1]^(r-2).
$
For $r=1$, the constant coefficient gives $S=1$, which is the same value. This
proves @eq:hypertree-convolution.
