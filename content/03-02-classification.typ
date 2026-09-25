#import "statements.typ": theorem
#import "main-defs.typ": bib-ref

#heading(level: 3)[
  An inclusion theorem and the classification problem
] <sec:inverse-pair-classification>

Combining the corollary to @th:classical-inverse-pairs with the problems in
§@sec:inversion-problems gives an answer to Riordan's question about classifying
known pairs of inverse relations (#bib-ref("Riordan1968"), pp. viii–ix).

#theorem(suffix: [])[
  #bib-ref("Egorychev1974a", "Egorychev1973a"). The inverse pairs of the
  following types in #bib-ref("Riordan1968") belong to
  $F_1^q=F_1^(q)(alpha_m;beta_k;phi;f;psi)$, or are adjoints of pairs of this
  type:


  - simplest type (Table 2.1);
  - Gould type (Table 2.2);
  - Chebyshev type (Tables 2.3 and 2.4);
  - Legendre type (Table 2.5);
  - Legendre–Chebyshev type (Table 2.6);
  - Abel type (Table 3.1);
  - ordinary and exponential types (Tables 3.2 and 3.3);
  - Lagrange type (Chapter 4, §5).
] <th:inverse-pair-classification>

These pairs can therefore be classified by the form of the weights
$alpha_m,beta_k$ and the functions $phi(w),f(w),psi(w)$. The results of
§@sec:matrix-inversion give these parameters a simple interpretation: $alpha_m$
and $beta_k$ weight the coefficients $a_m$ and $b_k$; $f$ specifies a
composition, $phi$ a multiplication, and $psi$ an inverse substitution, with the
corresponding Jacobian factor, in the Cauchy algebra of ordinary power series.

When the series are probability generating functions, multiplication describes
the sum of independent random variables, and composition describes an
independent random sum (see #bib-ref("Feller1957"), Chapters XI and XII). These
interpretations require nonnegative, normalized coefficients; general weights
and inverse substitutions need not preserve them.
