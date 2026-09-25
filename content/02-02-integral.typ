#import "index-style.typ": index-mark
#import "statements.typ": definition, proof, remark, theorem
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(71, "59")
#heading(level: 2)[
  Integral representation, classification, and computation in closed form of
  certain types of sums with binomial coefficients
] <sec:binomial-sum-classification>

The goal of this section is to obtain integral representations for certain types
of combinatorial sums with binomial coefficients that depend on several real
parameters, and to investigate their computation in closed form. The practical
difficulty of such computations is determined by the nature of the singularities
of the integrands in these representations.

In @th:binomial-parameter-sum and @th:binomial-product-sum we obtain integral
representations for two types of sums that include more than 200 identities in
#bib-ref("Gould1972a").
#source(72, "60")
In @th:binomial-sum-classification we study the computation in closed form of
the first type, which includes about 70 of the first sums in #bib-ref(
  "Gould1972a",
). This is possible in the cases considered for either of the following reasons:

+ The integrand has no pole at the origin or has no pole at infinity.
+ The integrand has a suitable symmetry with respect to its singular points.

Starting from the integral representation, we give a new identity of this type
for combinations of the free parameters not considered in #bib-ref(
  "Gould1972a",
). Under additional assumptions, @th:saddle-equation gives asymptotic estimates
for sums of the first type.

#definition[
  A finite or infinite sum $S_n=sum_(k=0)^(f(n))a(k)$ _can be computed in closed
  form_ (is _computable_) if it can be expressed using arithmetic operations on
  the numbers in #link(<app:table-m>)[Table M], together with the functions
  $x mapsto x^r$ ($r$ an integer), $x mapsto sin x$, $x mapsto e^x$,
  $x mapsto ln x$, and $x mapsto arcsin x$, with a finite total number of
  operations independent of $n$.
] <def:closed-form-computability>
#index-mark([@def:closed-form-computability], group: [Sums])[Closed-form
  evaluation, definition]

Let $n$ be a nonnegative integer, $x$ a complex number, $a_1$ real, and
$a_2,dots,a_6$ integers. When finite, $m=m(a,n)$ is a nonnegative integer-valued
function of the parameters, linear in $n$; we also allow $m=infinity$. Write
$
  N_1=a_1 n+a_3, quad N_2=a_4 n+a_6.
$
The binomial coefficient with an integer lower index $j<0$ is taken as zero.

#theorem[
  _The sum_
  #eq(
    $
      S(a,n,x)=sum_(k=0)^m binom(a_1 n+a_2 k+a_3, a_4 n+a_5 k+a_6)x^k
    $,
  ) <eq:binomial-parameter-sum>
  _has the following integral representations:_
  #eq(
    $
      S(a,n,x) & =frac(1, 2pi i)integral_Gamma
                 frac((1+w)^(N_1), w^(N_2+1))
                 lr((1-x frac((1+w)^(a_2), w^(a_5))))^(-1)dif w \
               & quad -frac(x^(m+1), 2pi i)integral_Gamma
                 frac((1+w)^(N_1+a_(2)(m+1)), w^(N_2+a_(5)(m+1)+1))
                 lr((1-x frac((1+w)^(a_2), w^(a_5))))^(-1)dif w,
                 quad m<infinity;
    $,
  ) <eq:binomial-finite-integral>
  #block(sticky: true)[_For $m=infinity$,_]
  #eq(
    $
      S(a,n,x)=frac(1, 2pi i)integral_Gamma
      frac((1+w)^(N_1), w^(N_2+1))
      lr((1-x frac((1+w)^(a_2), w^(a_5))))^(-1)dif w.
    $,
  ) <eq:binomial-infinite-integral>
] <th:binomial-parameter-sum>

Here $Gamma$ is a positively oriented simple closed contour enclosing zero. All
powers $(1+w)^(N_1+a_2 k)$ occurring in the sum must be analytic on and inside
$Gamma$, with their branches continued from the value $1$ at zero. A circle
$abs(w)=rho$ with $0<rho<1$ meets this requirement. Larger circles are allowed
when the relevant powers are polynomials. Avoid $w=-1$ on the contour and any
zero of the denominator in the separate integrals.

#block(sticky: true)[_For $m=infinity$, also assume that, on $Gamma$,_]
#eq(
  $
    abs(w^(a_5))>abs(x(1+w)^(a_2)).
  $,
) <eq:binomial-contour-bound>
For finite $m$, the difference in @eq:binomial-finite-integral is interpreted by
continuous extension when the separate integrals are undefined. Equivalently,
use the finite geometric sum in the proof below; its apparent denominator
singularities are removable.

#proof[
  Cauchy's coefficient formula gives
  $
    binom(a_1 n+a_2 k+a_3, a_4 n+a_5 k+a_6)
    =frac(1, 2pi i)integral_Gamma
    frac((1+w)^(N_1+a_2 k), w^(N_2+a_5 k+1))dif w.
  $
  #source(73, "61")
  Put $R(w)=x(1+w)^(a_2)w^(-a_5)$. For finite $m$, interchange the finite sum
  and integral and use
  $
    sum_(k=0)^m R^k=frac(1-R^(m+1), 1-R),
  $
  where the quotient has value $m+1$ at $R=1$. This gives
  @eq:binomial-finite-integral. For $m=infinity$, continuity on the compact
  contour and @eq:binomial-contour-bound give $max_(w in Gamma)abs(R(w))<1$. The
  geometric series therefore converges uniformly and absolutely there. Termwise
  integration gives @eq:binomial-infinite-integral.
]

#remark[
  For $m=infinity$, the existence of an admissible contour satisfying
  @eq:binomial-contour-bound is sufficient for convergence of
  @eq:binomial-parameter-sum. It is not necessary in general. If $N_1$ is a
  nonnegative integer, $a_2>=0$, and $a_5>a_2$, such a contour exists: take a
  sufficiently large circle. For nonintegral upper parameters, the analytic
  branch requirements must also be respected.
]
