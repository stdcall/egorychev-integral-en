#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": proof, theorem

#heading(level: 2)[
  Inversion and Classification of One-Dimensional Relations in Combinatorial
  Analysis
] <sec:univariate-inversion>
#heading(level: 3)[
  A problem of Liskovets. An identity for the DeMorgan numbers
] <sec:liskovets-problem>

In the course of enumerating graphs with labelled vertices, it was conjectured
in #bib-ref("Liskovets1969") that there exist polynomials $f_(k)(t)$ of degree
$k$ with #source(103, "91")integer coefficients such that #eq(
  $
    sum_(t=1)^n binom(n-1, t-1)n^(n-t)f_(k)(t)(t+k)!
    =(2k)!n^(n+k), quad k>=0, quad n>=1.
  $,
) <eq:liskovets-system>
The system had been solved for $k=0,1,2,3,4$, but the general form of $f_k$ was
unknown.

#theorem(suffix: [])[
  #bib-ref("Egorychev1974c"). The system @eq:liskovets-system has a unique
  solution, given by #eq(
    $
      f_(k)(t)=Delta^t 0^(t+k)frac((2k)!, (t+k)!),
      quad t>=1, quad k>=0,
    $,
  ) <eq:liskovets-solution>
  #index-mark([@eq:liskovets-solution], group: [Numbers])[DeMorgan]
  where $Delta^n 0^r=n!s_(2)(r,n)$ is the DeMorgan number counting arrangements
  of $r$ distinct objects in $n$ distinct cells with no cell empty. For each
  $k$, this solution is a polynomial in $t$ of degree $k$ with integer
  coefficients.
] <th:liskovets-solution>

#block(breakable: false)[
  Substitution into @eq:liskovets-system gives the identity#footnote[
    The author first obtained this identity by the analytic method given here
    and reported it at a seminar on graph and hypergraph theory in Odessa in
    September 1973, asking participants for a combinatorial interpretation.
    Section @sec:identity-interpretations presents an interpretation due to V.
    A. Liskovets. Later in the same seminar, L. M. Koganov suggested a simpler
    combinatorial interpretation.
  ] #eq(
    $
      sum_(t=1)^n binom(n-1, t-1)n^(n-t)Delta^t 0^(t+k)
      =n^(n+k), quad k>=0, quad n>=1.
    $,
  ) <eq:liskovets-identity>

]

#proof[
  For fixed $k$, the coefficient of $f_(k)(n)$ in @eq:liskovets-system is
  $(n+k)!$, so the system determines at most one sequence. Define #eq(
    $
      overline(f)_(k)(t)=f_(k)(t)frac((t+k)!, (t-1)!(2k)!), quad
      overline(F)_(k)(v)=sum_(t=1)^infinity overline(f)_(k)(t)v^t.
    $,
  ) <eq:liskovets-normalization>
  Then @eq:liskovets-system is equivalent to #eq(
    $
      sum_(t=1)^n frac(n^(n-t), (n-t)!)overline(f)_(k)(t)
      =frac(n^(n+k), (n-1)!).
    $,
  ) <eq:liskovets-normalized-system>
  #block(sticky: true)[By Rules @rule:residue-substitution-univariate[] and
    @rule:residue-change-variables-univariate[], the left side is]
  $
    S_(n,k) & =sum_(t=0)^infinity res_u e^(n u)u^(-n+t-1)
              res_v overline(F)_(k)(v)v^(-t-1) \
            & =res_u e^(n u)overline(F)_(k)(u)u^(-n-1) \
            & =res_x lr([frac(overline(F)_(k)(u(x)), 1-u(x))x^(-n-1)]),
  $
  where $u(x)$ is the local inverse of $x=u e^(-u)$, with $u(0)=0$.
  Consequently,
  #source(104, "92")
  $
    overline(F)_(k)(u) & =(1-u)lr([sum_(n=1)^infinity frac(n^(n+k), (n-1)!)x^n])
    |_(x=u e^(-u)) \
    & =(1-u)sum_(n=1)^infinity frac(n^(n+k), (n-1)!)u^n e^(-n u).
  $
  These substitutions are valid for formal series. Extracting the coefficient of
  $u^t$ gives #eq(
    $
      overline(f)_(k)(t) & =sum_(n=1)^infinity frac(n^(n+k), (n-1)!)
                           res_u (1-u)e^(-n u)u^(-t+n-1) \
                         & =sum_(n=1)^t frac(n^(n+k), (n-1)!)(-1)^(t-n)
                           frac(t n^(t-n-1), (t-n)!).
    $,
  ) <eq:liskovets-inversion>
  #block(sticky: true)[
    Using @eq:liskovets-normalization and the substitution rule, we obtain
  ]
  $
    frac(f_(k)(t), (2k)!)
    &=(-1)^t sum_(n=1)^t (-1)^n binom(t, n)frac(n^(k+t), (k+t)!) \
    &=(-1)^t sum_(n=0)^t
    res_u (1-u)^t u^(-n-1)res_v e^(n v)v^(-t-k-1) \
    &=(-1)^t res_v v^(-t-k-1)
    lr((sum_(n=0)^t e^(n v)res_u (1-u)^t u^(-n-1))) \
    &=(-1)^t res_v (1-e^v)^t v^(-t-k-1).
  $
  Thus #eq($ f_(k)(t)=(2k)!res_v (e^v-1)^t v^(-t-k-1), $) <eq:liskovets-residue>
  which agrees with @eq:liskovets-solution by the generating function for the
  DeMorgan numbers (#bib-ref("Riordan1958"), p. 100). Reversing the formal steps
  also proves existence.

  It remains to check the polynomial assertion. Since
  $(e^v-1)/v=1+sum_(r>=1)v^r/(r+1)!$, formula @eq:liskovets-residue yields
  $
    f_(k)(t)=sum_(sum_(r=1)^k r m_r=k)
    frac((2k)!, product_(r=1)^k m_r!((r+1)!)^(m_r))
    t_(underline(M)), quad M=sum_(r=1)^k m_r,
  $
  where all $m_r$ are nonnegative integers and
  $t_(underline(M))=t(t-1)dots(t-M+1)$. Put $L=k+M<=2k$. The displayed
  coefficient is an integer: it is $binom(2k, L)(2k-L)!$ times the number of
  partitions of $L$ labelled objects into $m_r$ blocks of size $r+1$, for each
  $r$. Hence $f_k$ has integer coefficients in the falling-factorial basis, and
  therefore also in the monomial basis. Its leading coefficient is
  $(2k)!/(2^k k!)$, obtained from $m_1=k$; this is nonzero. For $k=0$, the
  formula gives $f_(0)(t)=1$.
]
