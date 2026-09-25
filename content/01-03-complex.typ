#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, dw, eq, res, source

#heading(level: 2)[
  Connection with the theory of functions of one and several complex variables
] <sec:complex-analysis-connection>

In this section we dwell on the important connection between the concepts
introduced above and the theory of functions of complex variables.

If a formal power series $C(w)$ in $H$ with finitely many terms of negative
degree converges in a product of punctured discs about zero, then our definition
of $res_w C(w)$ coincides with the usual definition of the residue
$op("Res")_(w=0) C(w)$ used in the theory of analytic functions. It is this
connection that permitted us to deduce the properties of res in
§@sec:residue-rules from the theory of residues.

As before, suppose that $A(w)$ and $B(w)$ are the generating functions for
sequences $lr({a_m})$ and $lr({b_m})$, $abs(m) >= 0$. If the series $A(w)$ is
the expansion of some analytic function $f(w)$ in a neighborhood of zero, then
we identify $A(w)$ and $f(w)$ (respectively, $(∂ A(w))/(∂ w_i)$ and
$(∂ f(w))/(∂ w_i)$, and $integral_0^(w_i) A(w) dif w_i$ and
$integral_0^(w_i) f(w) dif w_i$, #source(30, "18")where $(∂ f(w))/(∂ w_i)$ and
$integral_0^(w_i) f(w) dif w_i$ are understood in the usual sense). In this case
the formula $a_k = res_w A(w) w^(-k-I)$ is the formal series analogue of the
Cauchy integral representation for the expansion coefficients of an analytic
function $A(w)$ in a neighborhood of zero: #eq(
  $
    a_k = 1/(2 pi i)^n integral_(Gamma(rho)) A(w) w^(-k-I) dw,
  $,
) <eq:cauchy-coefficient>
#index-mark([@eq:cauchy-coefficient])[Polydisk (polycylinder)]
#index-mark([@eq:cauchy-coefficient])[Skeleton of a polycylinder (polydisk)]
where $rho$ is sufficiently small and
$ Gamma(rho) = {w = (w_1, dots, w_n): abs(w_j)=rho, j=1,dots,n}. $
The cycle $Gamma(rho)$ is the skeleton of the polycylinder
$ U(rho) = {w: abs(w_j) <= rho, j=1,dots,n}. $
Correspondingly, @eq:residue-substitution is the analogue of the Cauchy integral
formula for a polycylinder (#bib-ref("Shabat1969"), pp. 42–43). Indeed, if
$z in U(rho_1)$, $rho_1 < rho$, then #eq(
  $
    sum_(abs(k) >= 0) z^k 1/(2 pi i)^n
    integral_(Gamma(rho)) A(w) w^(-k-I) dw \
    = 1/(2 pi i)^n integral_(Gamma(rho)) A(w)
    (sum_(abs(k) >= 0) z^k w^(-k-I)) dw \
    = 1/(2 pi i)^n integral_(Gamma(rho)) A(w)/(w-z)^I dw = A(z).
  $,
) <eq:cauchy-series-substitution>

In exactly the same way, @eq:lagrange-summation is a simple analogue of the
theorem on the multiple logarithmic residue (see the proof of the main theorem
in §@sec:main-residue-theorem, and §@supp:logarithmic-residue of the
Supplement).

The connection between the remaining properties of res and the properties of the
residue is obvious.

If only the properties of res are used in computations for a specific case, the
calculations are correct in the algebra of formal power series. In this case the
method of integral representation of sums, like the tool of generating functions
in probability theory (see #bib-ref("Feller1957"), p. 212), can be interpreted
as a method of operational calculus. But if it is necessary to use the concept
of convergence in calculations, then we should pass, according to
@eq:cauchy-coefficient, from res to the use of contour integrals and their
properties (see, for example, §@sec:enumeration-integrals).
