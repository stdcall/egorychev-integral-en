#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": definition, rule
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note

#heading(level: 2)[
  The concept of res and rules for operations on it
] <sec:residue-rules>

#heading(level: 3)[Multidimensional case] <sec:multivariate-residue-rules>
#index-mark([@sec:multivariate-residue-rules], group: [Series])[Power, formal]

Suppose that $w_1, dots, w_n$ are formal variables, $w = (w_1, dots, w_n)$,
$k = (k_1, dots, k_n)$ is a multi-index with integer components, and
$norm(k) = k_1 + dots + k_n$. We say that a monomial
$c_k w^k = c_(k_1 dots k_n) w_1^(k_1) dots w_n^(k_n)$ _contains negative powers_
if $k_j < 0$ for at least one $j$. The number $norm(k)$ is called the order of
the monomial $c_k w^k$. The _order of a series_
$C(w) = sum_(norm(k) >= norm(l)) c_k w^k$, whose exponents are bounded below in
each variable, is defined to be the smallest of the orders of the monomials
$c_l w^l$ appearing in it with nonzero coefficients $c_l$.

// Retain the accepted numbering of these two definitions in Section 1.2.
#definition(prefix: (1, 1))[
  The _generating function_ for an $n$-fold numerical sequence
  $lr({a_k})_(abs(k) >= 0)$ is defined to be the series #eq(
    $ A(w) = sum_(abs(k) >= 0) a_k w^k. $,
  ) <eq:generating-series>
  #index-mark([@eq:generating-series], major: true)[Generating function]
] <def:generating-series>

Two generating functions $A(w) = sum_(abs(k) >= 0) a_k w^k$ and
$B(w) = sum_(abs(k) >= 0) b_k w^k$ are assumed to be equal if and only if
$a_k = b_k$ for all $k$ with $abs(k) >= 0$.

The set of formal Laurent series in $w$ over the field $K$ of real or complex
numbers whose exponents are bounded below in each variable is denoted by $H$.
Thus each element of $H$ is an ordinary formal power series multiplied by a
Laurent monomial. As in #bib-ref("Cartan1961"), #bib-ref("Bourbaki1950") and
#bib-ref("Bochner1948"), we use #source(25, "13")the algebra of formal series in
$n$ variables $w = (w_1, dots, w_n)$,#editorial-note("laurent-algebra")[
  For formal operations and convergence in the formal topology, see #cite(
    <Flajolet2009>,
    supplement: [Appendix A.5, pp. 730–731],
  ).
] with addition and multiplication, together with composition, inversion,
differentiation and integration wherever these operations are defined.#footnote[
  It is assumed that the reader is familiar with the algebra of formal power
  series. Also, recall that the notation $abs(k)$, defined as
  $abs(k) = k_1 + dots + k_n$, always assumes that $k_1, dots, k_n >= 0$.
] The ring of power series $A(w) = sum_(abs(k) >= 1) a_k w^k$ over the field $K$
of real or complex numbers is denoted by $R$, and the set of series
$A(w) = sum_(abs(k) >= m) a_k w^k$ of order $m$, $m >= 0$, over the same field
is denoted by $R_m$. The formal power series obtained by differentiating and
integrating the series $A(w) = sum_(abs(k) >= 0) a_k w^k$ with respect to $w_i$
will be denoted by $(∂ A(w)) / (∂ w_i)$ and $integral_0^(w_i) A(w) dif w_i$,
respectively.

#definition(suffix: [], prefix: (1, 1))[
  (of res). If $C(w) in H$, then let #eq(
    $
      res C(w) = res_(w_1,dots,w_n) C(w_1, dots, w_n) = c_(-1,-1,dots,-1),
    $,
  ) <eq:formal-residue>
  #index-mark([@eq:formal-residue], group: [Methods])[$res$, definition]
  where $I = (1, dots, 1)$ and $c_(-I) = c_(-1,-1,dots,-1)$ is the coefficient
  of $(w_1 dots w_n)^(-1)$ in the series $C(w)$ under the res sign.
] <def:formal-residue>

The order of enumeration of the variables in @eq:formal-residue under the res
sign is arbitrary, and the variables may be separated by commas, while in
practice the expression after res is sometimes included in parentheses.

If $A(w) = sum_(abs(k) >= 0) a_k w^k$ is the generating function for the
sequence of numbers $lr({a_k})_(abs(k) >= 0)$, then it follows from
@eq:formal-residue that #eq(
  $
    a_k = res_w A(w) w^(-k-I), quad abs(k) >= 0.
  $,
) <eq:residue-coefficient>

The following rules for operations on the coefficients of generating functions
of the form $A(w) = sum_(abs(k) >= 0) a_k w^k$ are consequences of the
definitions of res and the algebra $H$.

#rule(suffix: [])[
  (removal of res).
  $ res_w A(w) w^(-k-I) = res_w B(w) w^(-k-I) $
  _for all $k$ with $abs(k) >= 0$ if and only if_
  #eq($ A(w) = B(w). $) <eq:series-equality>
  #index-mark([@eq:series-equality], group: [Methods])[$res$, rules for
    operations]
] <rule:series-equality>

#rule(suffix: [])[
  (linearity). #eq(
    $
      alpha res_w A(w) w^(-k-I) + beta res_w B(w) w^(-k-I) \
      = res_w (alpha A(w) + beta B(w)) w^(-k-I).
    $,
  ) <eq:residue-linearity>
  #index-mark([@eq:residue-linearity], group: [Methods])[$res$, rules for
    operations]
] <rule:residue-linearity>

#rule(suffix: [])[
  (the substitution rule).
  _If $z = (z_1, dots, z_n)$, $z_j in R$, then_
  #eq(
    $
      sum_(abs(k) >= 0) z^k res_w A(w) w^(-k-I) = A(z).
    $,
  ) <eq:residue-substitution>
  #index-mark([@eq:residue-substitution], group: [Methods])[$res$, rules for
    operations]
  #source(26, "14")This relation remains valid also when $z_j in H$ and $A(w)$
  is a polynomial.
] <rule:residue-substitution>

#rule(suffix: [])[
  (inversion). _If $f_(j)(w) in R_0$, $j = 1, dots, n$, then_ #eq(
    $
      sum_(abs(k) >= 0) (product_(j=1)^n z_j^(k_j))
      res_(w_1 dots w_n)
      lr((A(w) (product_(j=1)^n f_j^(k_j)(w) w_j^(-k_j-1)))) \
      = lr([A(w) ((∂ z) / (∂ w) product_(j=1)^n f_(j)(w))^(-1)])
      |_(w=g(z)),
    $,
  ) <eq:lagrange-summation>
  #index-mark([@eq:lagrange-summation], group: [Methods])[$res$, rules for
    operations]
  _where $(∂ z)/(∂ w)$ is the Jacobian of the transformation
  $z_j = w_j f_j^(-1)(w)$, $j = 1, dots, n$, and_
  #eq(
    mark: "*",
    $
      g(z) = (g_(1)(z), dots, g_(n)(z)),
      quad g_(j)(z) in R, quad j = 1, dots, n,
    $,
  ) <eq:formal-inverse>
  _is the solution of the system $z_j = w_j f_j^(-1)(w) in R$, $j = 1, dots, n$,
  in the ring $R$._

  If we equate the coefficients of $z^k$ on both sides of
  @eq:lagrange-summation, we get
] <rule:lagrange-summation>

#rule(suffix: [])[
  (change of variables under the res sign).
  _If $f_(j)(w) in R_0$, $j = 1, dots, n$, then_
  #eq(
    $
      res_(w_1 dots w_n)
      lr((A(w) product_(j=1)^n f_j^(k_j)(w) w_j^(-k_j-1))) \
      = res_(z_1 dots z_n) lr(
        {lr([A(w) ((∂ z)/(∂ w) product_(j=1)^n f_(j)(w))^(-1)])
          |_(w=g(z)) (product_(j=1)^n z_j^(-k_j-1))}
      ),
    $,
  ) <eq:residue-change-variables>
  #index-mark([@eq:residue-change-variables], group: [Methods])[$res$, rules for
    operations]
  _where $g(z) = (g_(1)(z), dots, g_(n)(z))$ is the (unique) solution of #ref(
    <eq:formal-inverse>,
  )._

  #keep-next[
    Formulas of the form
  ]
  #eq(
    $
      res_(w_1 dots w_n)
      lr((A(w_1, dots, w_n) product_(j=1)^n w_j^(-k_j-1))) \
      = res_(vec(delim: #none, z_1 dots z_m, w_1 dots w_n)) lr(
        (A(alpha w_1^beta product_(j=1)^m z_j^(beta_j), w_2, dots, w_n) \
          times (product_(j=2)^n w_j^(-k_j-1))
          (alpha w_1^beta product_(j=1)^m z_j^(beta_j))^(-k_1)
          (w_1 z_1 dots z_m)^(-1))
      )
    $,
  ) <eq:residue-dimension-increase>
  #index-mark([@eq:residue-dimension-increase], group: [Methods])[$res$, rules
    for operations]
  are useful in computations, where $alpha$ is a nonzero constant,
  $beta_1, dots, beta_m, beta$ are integers, $beta != 0$, and the variables
  $z_1, dots, z_m$ are independent of $w_1, dots, w_n$. Here res extracts the
  indicated coefficient directly from the substituted formal expansion.
  Analogous formulas permit variables to be identified if the resulting monomial
  substitution is injective on exponent vectors; the coefficient is then
  extracted once in each distinct variable, with one factor $u^(-1)$ for each
  such variable $u$.

  For example, it is not uncommon to use the substitution $w_1 = z_1/z_3$,
  $w_2 = z_2/z_3$ when $n = 2$.

  #source(27, "15")
  With $B(w) = A(w) ((∂ g)/(∂ w) product_(j=1)^n f_(j)(w))^(-1)$, formula
  @eq:lagrange-summation, applied to the map $g$ and its inverse $h$ below,
  gives us
] <rule:residue-change-variables>

#rule(suffix: [])[
  (expansion in a Bürmann–Lagrange series).
  _If $phi_j in R_0$, $j = 1, dots, n$, then_
  #eq(
    $
      B(z)|_(z_j=h_(j)(w))
      = sum_(abs(k) >= 0) w_1^(k_1) dots w_n^(k_n) \
      times res_(w_1 dots w_n) lr(
        (B(w) (∂ g)/(∂ w)
          product_(j=1)^n (f_(j)(w) w_j^(-1))^(k_j+1))
      ),
    $,
  ) <eq:inverse-substitution>
  #index-mark([@eq:inverse-substitution], group: [Methods])[$res$, rules for
    operations]
  _where $w = g(z) = (g_(1)(z), dots, g_(n)(z))$, $g_(j)(z) = z_j f_j^(-1)(z)$,
  $f_(j)(0) != 0$, is a solution of the system
  $z_j = h_(j)(w) = w_j phi_(j)(w) in R$, $j = 1, dots, n$, in the ring $R$._
] <rule:inverse-substitution>

#rule(suffix: [])[
  (differentiation). #eq(
    $
      k_j res_w A(w) w^(-k-I)
      = res_w lr((w_j (∂ A(w))/(∂ w_j) w^(-k-I))),
      quad abs(k) >= 0.
    $,
  ) <eq:residue-differentiation>
] <rule:residue-differentiation>

#rule(suffix: [])[
  (integration). #eq(
    $
      1/(k_j+1) res_w A(w) w^(-k-I) \
      = res_w lr({(integral_0^(w_j) A(w) dif w_j) w^(-k-I)/w_j}),
      quad abs(k) >= 0.
    $,
  ) <eq:residue-integration>
] <rule:residue-integration>

#heading(level: 3)[One-dimensional case] <sec:univariate-residue-rules>

Since the one-dimensional case is of interest both in itself and for the
computation of a multiple integral (res) in terms of a repeated integral, we
present a table of operations on res for it.

Let $A(w)$ and $B(w)$ be the generating functions for sequences $lr({a_k})$ and
$lr({b_k})$, $k = 0, 1, dots$, of numbers. For $n = 1$, $R$ denotes the ring of
formal power series $C(w) = sum_(k=1)^infinity c_k w^k$ with zero constant term
over $K$, with the usual Cauchy operations. The series in $R$ with $c_1 != 0$
are precisely those with a compositional inverse.#footnote[
  _Translator's note._ The reader will note that the set of power series with
  nonzero first coefficients does not form a ring.
] The set of series of the form $C(w) = c_0 + sum_(k=1)^infinity c_k w^k$,
$c_0 != 0$, over the same field is denoted by $R_0$ (see, for example, #bib-ref(
  "Cartan1961",
), Chapter 1).

#rule(suffix: [])[
  (removal of res).
  $ res_w A(w) w^(-k-1) = res_w B(w) w^(-k-1), quad k = 0, 1, dots, $
  _if and only if_
  #eq(
    variant: <eq:series-equality>,
    $ A(w) = B(w). $,
  ) <eq:series-equality-univariate>
] <rule:series-equality-univariate>

#rule(suffix: [])[
  (linearity). #eq(
    variant: <eq:residue-linearity>,
    $
      alpha res_w A(w) w^(-k-1) + beta res_w B(w) w^(-k-1) \
      = res_w (alpha A(w) + beta B(w)) w^(-k-1).
    $,
  ) <eq:residue-linearity-univariate>
] <rule:residue-linearity-univariate>

#rule(suffix: [])[
  (substitution). _If $z in R$, then_ #eq(
    variant: <eq:residue-substitution>,
    $
      sum_(k=0)^infinity z^k res_w A(w) w^(-k-1) = A(z).
    $,
  ) <eq:residue-substitution-univariate>
  This relation remains valid, for example, also in the case where $A(w)$ is a
  polynomial and $z = sum_(k=-m)^infinity a_k w^k$, $a_(-m) != 0$, where $m$ is
  a positive integer.

  #source(28, "16")
] <rule:residue-substitution-univariate>

#rule(suffix: [])[
  (inversion). _If $f(w) in R_0$, then_ #eq(
    variant: <eq:lagrange-summation>,
    $
      sum_(k=0)^infinity z^k res_w A(w) f^(k)(w) w^(-k-1) \
      = lr([A(w) (f(w) h'(w))^(-1)])|_(w=g(z)),
    $,
  ) <eq:lagrange-summation-univariate>
  _where $h(w) = w f^(-1)(w)$, and $g(z) in R$ is the compositional inverse of
  the series $z = h(w) in R$._
] <rule:lagrange-summation-univariate>

#rule(suffix: [])[
  (change of variables under the res sign). _If $f(z) in R_0$, then_ #eq(
    variant: <eq:residue-change-variables>,
    $
      res_w (A(w) f^(k)(w) w^(-k-1)) \
      = res_z lr([A(w) (f(w) h'(w))^(-1)])|_(w=g(z)) z^(-k-1),
      quad k = 0, 1, dots,
    $,
  ) <eq:residue-change-variables-univariate>
  _where $h(w) = w f^(-1)(w)$, and $g(z) in R$ is the compositional inverse of
  the series $z = h(w) in R$._
] <rule:residue-change-variables-univariate>

#rule(suffix: [])[
  (expansion in a Bürmann–Lagrange series).#editorial-note(
    "lagrange-inversion",
  )[
    For the coefficient form of Lagrange inversion and an algebraic proof, see
    #cite(<Stanley2024>, supplement: [Theorem 5.4.2, pp. 39–40]).
  ]
  _If $g(w) in R$, and $h(z) = z f^(-1)(z) in R$ is the compositional inverse of
  the series $g(w)$, then_
  #eq(
    variant: <eq:inverse-substitution>,
    $
      B(z)|_(z=g(w)) =
      sum_(k=0)^infinity w^k res_w B(w) h'(w) f^(k+1)(w) w^(-k-1).
    $,
  ) <eq:inverse-substitution-univariate>
] <rule:inverse-substitution-univariate>

#rule(suffix: [])[
  (differentiation). #eq(
    variant: <eq:residue-differentiation>,
    $
      k res_w A(w) w^(-k-1) = res_w A'(w) w^(-k),
      quad k = 0, 1, dots.
    $,
  ) <eq:residue-differentiation-univariate>
] <rule:residue-differentiation-univariate>

#rule(suffix: [])[
  (integration). #eq(
    variant: <eq:residue-integration>,
    $
      1/(k+1) res_w A(w) w^(-k-1) \
      = res_w (integral_0^w A(w) dif w) w^(-k-2), quad k = 0, 1, dots.
    $,
  ) <eq:residue-integration-univariate>
] <rule:residue-integration-univariate>

#heading(level: 3)[Proofs] <sec:residue-rule-proofs>

Formulas @eq:series-equality, @eq:residue-linearity, @eq:residue-substitution,
@eq:residue-dimension-increase, @eq:residue-differentiation, and
@eq:residue-integration are obvious if, corresponding to
@eq:residue-coefficient, we set $res_w A(w) w^(-k-I) = a_k$, $abs(k) >= 0$,
everywhere in them.

Formula @eq:residue-change-variables, and with it (by @rule:series-equality)
@eq:lagrange-summation and @eq:inverse-substitution, is most easily proved with
the help of the following argument (for a combinatorial proof, see, for example,
#bib-ref("Tutte1975")), which enables us to reduce the proof of
@eq:residue-change-variables for formal power series to the formula for change
of variables under the sign of a multidimensional contour integral. Indeed, note
that if the generating function $A(w) = sum_(abs(k) >= 0) a_k w^k$ is obtained
from the generating functions $B(w) = sum_(abs(k) >= 0) b_k w^k$ and
$C(w) = sum_(abs(k) >= 0) c_k w^k$, … by means of addition, multiplication,
composition with zero-constant-term series, and the appropriate formal
inversions, then a coefficient of total degree $N$ depends only on the input
coefficients of degree at most $N$.

By assumption, $f_(j)(0) != 0$, $j = 1, dots, n$. Consequently, the residues in
@eq:residue-change-variables for a fixed $k$ depend only on the coefficients of
$A$ and the $f_j$ through total degree $abs(k)$. We may therefore replace $A$
and $f_j$ by their polynomial truncations $overline(A)$ and $overline(f)_j$
through that degree. Set $overline(z)_j = w_j / (overline(f)_(j)(w))$, let
$(∂ overline(z))/(∂ w)$ be the Jacobian of this map, and let $overline(g)$ be
its local inverse. The Jacobian at zero is nonsingular, so this inverse is
analytic near zero. With these definitions, @eq:residue-change-variables reduces
to
#source(29, "17")
#eq(
  $
    res_(w_1 dots w_n) lr(
      (overline(A)(w)
        (product_(j=1)^n overline(f)_j^(k_j)(w) w_j^(-k_j-1)))
    ) \
    = res_(z_1 dots z_n) lr(
      {lr(
          [overline(A)(w)
            ((∂ overline(z))/(∂ w)
              product_(j=1)^n overline(f)_(j)(w))^(-1)]
        )|_(w=overline(g)(z)) (product_(j=1)^n z_j^(-k_j-1))}
    ).
  $,
) <eq:truncated-change-variables>
The functions in this identity are convergent near zero after the displayed
coordinate powers have been removed. We can replace $res_w$ and $res_z$ by
normalized contour integrals over
$
  gamma = {w = (w_1, dots, w_n) : abs(w_j) = rho, j = 1, dots, n},
  quad 0 < rho < rho_0,
$
for sufficiently small $rho_0$, and over its image
$ Gamma = {z = overline(z)(w) : w in gamma}. $
The image cycle is homologous to a sufficiently small positively oriented
product torus in a punctured polydisc where the transformed integrand has no
singularities except on the coordinate hyperplanes. Thus the normalized
integrals compute the respective residues. The identity follows by change of
variables under the integral sign (see the #link(<supplement>)[Supplement]).
