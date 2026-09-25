#import "index-style.typ": index-mark
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, res, source

#source(48, "36")
#heading(level: 2)[Historical information] <sec:historical-notes>

In the author's opinion, the main task of enumerative combinatorial analysis is
to establish a correspondence between the set-theoretic operations used to
construct the objects being counted and operations on generating functions of
the required type. Success in establishing this correspondence depends directly
on the development of computational methods.

In particular, the successes and failures of generating functions in
combinatorial analysis over the last two centuries have depended, in our view,
primarily on whether the enumeration problems posed could be solved by formal
power series. #source(49, "37")Repeated attempts to avoid modern analytic
methods in favour of formal series have inevitably restricted both the range of
applications and the computational possibilities of the method. At various
stages in the development of combinatorial analysis, investigators have remarked
on the limited computational power and cumbersome symbolism of the
generating-function method.

For example, Hindenburg and his successors in the German school of
mathematicians in the eighteenth and early nineteenth centuries tried to
construct a formal theory of all combinatorial operations. They did not take
into account questions of representing functions by series or of convergence
(#bib-ref("Kutlumuratov1964") and #bib-ref("Rybnikov1972"), pp. 246–248).

Hall (#bib-ref("Hall1958"), p. 40), describing the nineteenth-century school of
English mathematicians, remarks: “…\[this school\] went to great lengths to use
generating functions and operators to obtain formal algebraic and analytic
expressions for combinatorial quantities. Although this approach has great
generality, it cannot be regarded as effective except in certain special cases.
If a generating function turns out to be an elementary function or, as in the
case of the partition function, turns out to belong to a well-known class of
transcendental functions, much may be done. But in many cases a direct pursuit
of the formalism is more tedious than a direct enumeration.” (See also #bib-ref(
  "Hall1958",
), pp. 49–51, and #bib-ref("Hardy1949").)

These statements remain timely.

Berge (#bib-ref("Berge1968"), p. 10), assessing the state of the
generating-function method in combinatorial analysis, comments: #text(
  lang: "fr",
)[“… nous avons évité systématiquement l’emploi des calculs symboliques, qui
  sont parfois des outils commodes pour manipuler des formules trop compliquées,
  mais qui sont en général utilisés sans justification suffisante. On admet
  qu’une propriété qui se traduit par une égalité $abs(A)=abs(B)$ est mieux
  explicitée lorsque l’on construit une bijection entre deux ensembles $A$ et
  $B$, plutôt qu’en calculant les coefficients d’un polynôme dont les variables
  n’ont pas de significations particulières. La méthode des fonctions
  génératrices, qui a exercé ses ravages pendant un siècle, est tombée en
  désuétude pour cette raison; en tout cas, il ne saurait être question de
  l’exposer en dehors du cadre des anneaux de séries formelles…”]#footnote[
  The last sentence is a footnote in Berge's original.
] And Feller: “In the theory of probability generating functions have been used
since DeMoivre and Laplace, but the power and the possibilities of the method
are rarely fully utilized” (#bib-ref("Feller1968"), p. 264).

#source(50, "38")
Indeed, although combinatorialists from MacMahon #bib-ref("MacMahon1915")
onwards have used many types of generating functions, they have largely confined
themselves to formal power series, with various symbolic modifications and
numerous artificial devices.

On this point Riordan remarks (#bib-ref("Riordan1958"), pp. 19, 20): “… the
variable $t$ of the generating function has not been defined; the natural
tendency of the classical analyst, and the pioneers of the subject, to take it
as a real or complex number need not be followed. If it is, the question of the
existence of the generating function for a given infinite sequence arises at
once and, of course, must be answered, that is, the convergence of the sum
defining the generating function must be established… On the other hand, when
the variable $t$ is taken as an abstract mark or indeterminate, the function of
which is to keep distinct through its powers the elements of the sequence united
in the sum defining the generating function, the latter becomes a tool in an
algebra of these sequences. Formal operations on generating functions, such as
addition, multiplication, differentiation, and integration with respect to $t$,
serve to express definitions and relations in this algebra, in particular by
equating coefficients of $t^k$ after completing these operations. From this
point of view, convergence of the sum is irrelevant.

“… formal operations are used freely in an heuristic manner with verifications
by independent arguments wherever possible within space limits.”

This statement (see also the survey #bib-ref("Niven1969") and the Introduction)
shows that many specialists in discrete analysis restrict themselves to the
algebra of formal power series even for such technical problems as computing
finite sums and solving systems of recurrence relations.#footnote[
  Although these traditions have by now lost their significance, it seems
  difficult for many to relinquish them.
]

At the same time, combinatorial analysis has produced a wide variety of
generating functions (see, for example, the survey #bib-ref("Sachkov1973")). The
work of Rota and his school on the foundations of combinatorial analysis has
clarified the origins of the generating-function idea and revealed deep
relationships among the general algebraic structures describing basic
combinatorial objects.

The following statement by Feller is also apt (#bib-ref("Feller1968"), p. 264):
“… the powerful method of generating functions \[is\] a special case of the
method of characteristic functions on which the theory of probability depends to
a large extent. More generally, the subject of generating functions belongs to
the #source(51, "39")domain of operational methods which are widely used in the
theory of differential and integral equations.”

In the author's opinion, we should use the rich resources of contemporary
mathematical analysis to establish the correspondence between set-theoretic
constructions and operations on generating functions described above, rather
than confining ourselves to formal power series.

#keep-next[
  Coefficient identities obtained by formal power series admit a
  function-theoretic interpretation, one coefficient at a time. To make this
  precise, consider ordinary formal power series in $d$ variables over $K=RR$ or
  $CC$, viewed as elements of $H$. Write
]
$
  A(w)=sum_(abs(k)>=r) a_k w^k, quad
  k in ZZ_(>=0)^d, quad abs(k)=k_1+dots+k_d,
$
#keep-next[
  where $r$ is a nonnegative integer and coefficients of degree less than $r$
  vanish. For each $N>=r$, define the polynomial
]
$
  P_(N)(A)(w)=sum_(r<=abs(k)<=N) a_k w^k.
$
For a fixed coefficient with $abs(n)=N$, this finite polynomial suffices.
Addition and multiplication through total degree $N$ take place in the truncated
algebra $K[w_1,dots,w_d] \/ (w_1,dots,w_d)^(N+1)$: terms of higher degree are
discarded after multiplication. Other operations require their own hypotheses
and sufficient input degrees; for example, differentiation through degree $N$
requires the input through degree $N+1$. No convergence of the original infinite
series is asserted. A Laurent series in $H$ can first be reduced to an ordinary
power series by factoring out a common lower monomial.

Indeed, equality of two formal series
$
  A(w)=sum_(abs(k)>=r) a_k w^k, quad
  B(w)=sum_(abs(k)>=r) b_k w^k
$
is equivalent, by definition, to $a_n=b_n$ for every $n in ZZ_(>=0)^d$ with
$abs(n)>=r$. Let $I=(1,dots,1)$ and $N=abs(n)$. By the definition of $res$, #eq(
  mark: "*",
  $
    a_n & = res_w A(w)w^(-n-I) \
        & = res_w (sum_(abs(k)>=r) a_k w^k)w^(-n-I) \
        & = res_w P_(N)(A)(w)w^(-n-I) \
        & = frac(1, (2 pi i)^d) integral_gamma
          P_(N)(A)(w)w^(-n-I) dif w,
  $,
) <eq:truncation-coefficient>
where
$
  gamma=lr({w=(w_1,dots,w_d): abs(w_j)=rho, j=1,dots,d}),
  quad 0<rho<infinity,
$
#keep-next[
  with the product of the positive circle orientations. Here
]
$ dif w=dif w_1 ∧ dif w_2 ∧ dots ∧ dif w_d. $
#keep-next[
  Thus $A(w)=B(w)$ is equivalent to the family of equalities
]
#eq(
  mark: "**",
  $
    frac(1, (2 pi i)^d) integral_gamma P_(N)(A)(w)w^(-n-I) dif w \
    = frac(1, (2 pi i)^d) integral_gamma P_(N)(B)(w)w^(-n-I) dif w,
    quad N=abs(n)>=r.
  $,
) <eq:truncation-equality>

We therefore regard multidimensional complex analysis as a natural setting for
studying these coefficient identities and the problem of evaluating sums in
closed form #source(52, "40") (see, for example, §§@sec:residue-rules and
@sec:complex-analysis-connection). Deep results and methods of complex analysis
are used extensively in both probability theory and analytic number theory. In
particular, all specialists in discrete analysis turn to estimates of contour
integrals to obtain the most significant asymptotic results.

Many specialists in combinatorial analysis have long used multidimensional
integrals #bib-ref("Polya1937"). In #bib-ref("Good1961a"), #bib-ref(
  "Good1962b",
), #bib-ref("Good1962a") and #bib-ref("Dyson1962"), generating functions are
used to compute contour integrals representing combinatorial sums. Yet these and
other investigations almost entirely lack a _method of passing from a sum to its
integral representation_. This step is essential in practice, both for
evaluating sums and for obtaining their asymptotic forms. Investigators make do
with a collection of artificial devices. One reason, in our view, is that most
investigators, when computing or estimating complicated expressions arising in
combinatorics, aim to use or compile the largest possible collection of
summation formulas, whether they work with formal series or with residues. This
step plays a less important role in analytic number theory, where finding an
integral representation of a sum is often straightforward and the main effort
goes into estimating the resulting integral asymptotically.

Our approach retains the convenience of formal power-series operations. We use
the concept and properties of $res$ (§@sec:residue-rules), whose connection with
residues was examined in §@sec:complex-analysis-connection.

The concept of $res_w A(w)$, $A(w) in H$, and its elementary properties have
long been used in mathematical analysis. For example, in his work on inverting
power series #bib-ref("Cayley1856"), Cayley uses the notation $[A(w)]_w^(-1)$,
equivalent to $res_w A(w)$. The connection with residues is generally easy to
trace in this work. Other authors, including those working in probability theory
and combinatorial analysis (#bib-ref("Schwatt1924"), #bib-ref("Percus1971"),
#bib-ref("Sheehan1970"), #bib-ref("Kolchin1976") and #bib-ref("Selivanov1972")),
use the generating-function notion of $op("Coef")$: the coefficient of $w^n$ in
$A(w)=sum_(abs(n)>=0) a_n w^n$. Their expressions include “the coefficient of
the nth monomial power in the series $A(w)=sum_(abs(n)>=0) a_n w^n$”, “the Coef
of $w_1^(k_1) dots w_d^(k_d)$ in the function $A(w_1,dots,w_d)$”,
“$((x^n))f(x)$”, and “$op("Coef")_(w^n) A(w)$”. They use coefficient rules
analogous to @eq:residue-linearity, @eq:residue-change-variables and #source(
  53,
  "41",
)@eq:inverse-substitution, but do not systematically investigate the connection
with residue theory.

#block(sticky: true)[Schwatt #bib-ref("Schwatt1924") uses the notation]
#eq($ ((x^n))f(x) $) <eq:coefficient-notation>
#keep-next[
  when evaluating one-dimensional finite sums of binomial coefficients by formal
  power series, together with operational transformations such as
]
#eq(
  $
    sum_(k=0)^n ((x^k))f(x) ((x^(n-k)))g(x)
    = ((x^n))(f(x)g(x)),
  $,
) <eq:schwatt-convolution>
#index-mark([@eq:schwatt-convolution], group: [Formulas])[Schwatt]
#eq(
  $
    sum_(k=0)^n ((x^m))h^(k)(x)
    = ((x^m))frac(1-h^(n+1)(x), 1-h(x)),
  $,
) <eq:schwatt-geometric-sum>
#index-mark([@eq:schwatt-geometric-sum], group: [Formulas])[Schwatt]
where $m,n$ are positive integers and $f(x)$, $g(x)$ and $h(x)$ are binomial
series. The quotient in @eq:schwatt-geometric-sum denotes the finite geometric
polynomial $1+h(x)+dots+h^(n)(x)$, so it is meaningful even when $1-h(x)$ has
zero constant term, or $h(x)=1$. Notation @eq:coefficient-notation means
$op("Coef")_(x^n) f(x)$.

Transformation @eq:schwatt-convolution extracts
$
  op("Coef")_(x^n)(f(x)g(x)),
$
while @eq:schwatt-geometric-sum applies the finite geometric-sum formula under
the $op("Coef")$ sign.

The chief limitation of $op("Coef")_(w^n) A(w)$, in our view, is that it
specifies the coefficient $a_n$ by fixing the monomial $w^n$ in the operator's
notation. We find $res_w A(w)w^(-n-1)$, with $A(w)=sum_(n=0)^infinity a_n w^n$,
more flexible: the extracting monomial participates directly in operations on
formal Laurent series under the $res$ sign. The direct connection between
$res_w A(w)$ and residues gives access to residue theory when seeking and
justifying an efficient computational algorithm, passing to contour integrals
when appropriate, and studying generating functions and other analytic methods
that use formal series. In particular, the rules of §@sec:residue-rules are
modelled on residue calculus. Finally, whereas the $op("Coef")$ notation is
oriented towards formal power series, the concept and notation $res_w A(w)$ may
prove useful, both theoretically and practically, in extending the integral
representation of sums to certain kinds of functions other than power series
(see the problems in @ch:open-problems[Chapter]).
