#import "main-defs.typ": bib-ref, eq, source
#import "statements.typ": remark, theorem
#import "book-style.typ": keep-next

#source(85, "73")
In particular, for the sum in @ex:dougall-summation, #eq(
  $
    S_(n,m)=cases(
      (-1)^n n!(1+a)_n & "if" m=n,
      0 & "if" m<n.
    )
  $,
) <eq:andrews-sum-value>

The next theorem gives a procedure for converting one-dimensional identities
with binomial coefficients into identities for hypergeometric series.

#theorem(suffix: [])[
  (#bib-ref("Andrews1974"), Theorem 5.1).
  _Let $A,B,C,D,n$ be nonnegative integers, with $A>C>=0$. Then_
  #eq(
    $
      (A n+D A+C)! =(D A+C)!A^(A n)
      product_(j=1)^A lr((D+frac(C+j, A)))_n,
    $,
  ) <eq:factorial-multiplication>
  #eq(
    $
      (B-A n)! =frac(
        (-1)^(A n)B!,
        A^(A n)product_(j=0)^(A-1)lr((frac(-B+j, A)))_n
      ),
    $,
  ) <eq:factorial-reflection>
  _where @eq:factorial-reflection requires $A n<=B$. For $0<abs(q)<1$, we also
  have_
  #eq(
    $
      [q]_(A n+D A+C)=[q]_(D A+C)
      product_(j=1)^A [q^(D A+C+j);q^A]_n,
    $,
  ) <eq:q-factorial-multiplication>
  #eq(
    $
      [q]_(B-A n)=frac(
        q^(-B A n+A n(A n-1)/2)(-1)^(A n)[q]_B,
        product_(j=0)^(A-1)[q^(-B+j);q^A]_n
      ),
    $,
  ) <eq:q-factorial-reflection>
  _with $A n<=B$ in #ref(<eq:q-factorial-reflection>)._
] <th:factorial-multiplication>

To verify the increasing-index formulas, split the $A n$ factors after the
initial factorial or $q$-factorial into their $A$ residue classes. For the
decreasing-index formulas, reverse the $A n$ factors removed from $B!$ or
$[q]_B$ before splitting them in the same way. In the latter case, each factor
uses $1-q^r=-q^r (1-q^(-r))$, giving the exponent and sign in
@eq:q-factorial-reflection.

The conversion procedure in @th:factorial-multiplication is compatible with
changing the summation index from $n$ to $-n$ or $n+k$, where $k$ is a fixed
integer, provided the summation range and parameters are changed accordingly.

#theorem[
  _For the bilateral series @eq:bilateral-hypergeometric-series and
  @eq:bilateral-basic-series, the Saalschütz, well-poised, and nearly-poised
  parameter conditions are preserved when the summation index is replaced by its
  negative or by an integer translate. The transformations are taken where the
  terms are defined and reindexing is valid._
] <th:parameter-shift-invariance>

For @eq:bilateral-hypergeometric-series, translation adds $k$ to every upper and
lower parameter; reversal replaces $(a_i,b_i,z)$ by $(1-b_i,1-a_i,z^(-1))$. Thus
the difference between the lower and upper parameter sums is unchanged, while
each paired sum $a_i+b_i$ becomes either $a_i+b_i+2k$ or $2-a_i-b_i$.

For @eq:bilateral-basic-series, translation multiplies every parameter by $q^k$.
Reversal replaces $(alpha_i,beta_i)$ by $(q/beta_i,q/alpha_i)$ and $t$ by
$beta_1 dots beta_n/(alpha_1 dots alpha_n t)$. The ratio of the products of
lower and upper parameters is unchanged, while paired products are multiplied by
$q^(2k)$ or replaced by their reciprocals times $q^2$. These operations preserve
all three parameter patterns.

The statements are verified algebraically in this way; Andrews gives
@th:parameter-shift-invariance for the bilateral functions in
@eq:bilateral-hypergeometric-series and @eq:bilateral-basic-series.

#remark[
  Only three identities in Slater's table of hypergeometric sums in #bib-ref(
    "Slater1966",
  ), Appendix III, fall outside the types in @th:parameter-shift-invariance:
  (III.23), (III.24), and (III.28), on p. 245. All summation formulas in the
  table in Appendix IV of the same reference involve just two types of basic
  hypergeometric series: Saalschütz and well-poised series.
]
