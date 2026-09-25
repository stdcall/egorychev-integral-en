#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": corollary, definition, proof, remark, theorem

#source(100, "88")
#heading(level: 2)[
  Definitions. Inclusion, Inversion and Decomposition of Matrices of Type
  $F_n^q$
] <sec:matrix-inversion>

Let $q$, $m_1,dots,m_n$ and $k_1,dots,k_n$ be nonnegative integers. Suppose
$phi$, $f_1,dots,f_n$ and $psi_1,dots,psi_n$ are holomorphic in a polydisk
$U(R)$ about the origin. Integrals will be taken over the positively oriented
distinguished boundary $Gamma(rho)$ of a smaller polydisk, with $0<rho<R$. All
radii used below are chosen sufficiently small. Write $f=(f_1,dots,f_n)$,
$psi=(psi_1,dots,psi_n)$, $e=(1,dots,1)$, $m=(m_1,dots,m_n)$ and
$k=(k_1,dots,k_n)$, and let $alpha_m$ and $beta_k$ be complex numbers.

#definition[
  A pair of systems of linear relations #eq(
    $
      a_m=sum_(k>=0)c_(m k)b_k, quad
      b_m=sum_(k>=0)d_(m k)a_k, quad m>=0,
    $,
  ) <eq:inverse-matrix-pair>
  #index-mark([@eq:inverse-matrix-pair], group: [Pairs of inverse linear
    relations])[Definition]
  between sequences $a=(a_m)$ and $b=(b_k)$ is called a *pair of inverse
  relations* if $D=(d_(m k))$ is the unique inverse of $C=(c_(m k))$. The pair
  #eq(
    $
      a_m^*=sum_(k>=0)c_(k m)b_k^*, quad
      b_m^*=sum_(k>=0)d_(k m)a_k^*, quad m>=0,
    $,
  ) <eq:transposed-inverse-pair>
  is called the *adjoint* of @eq:inverse-matrix-pair. Here adjoint means
  transpose, without complex conjugation.
] <def:inverse-matrix-pair>

For the triangular matrices considered below, each row of
@eq:inverse-matrix-pair is finite, so these relations make sense for arbitrary
sequences. Their transposes act on finitely supported sequences. More general
infinite sums require convergence assumptions that justify the indicated
operations.

#definition[
  Relations @eq:matrix-transform are of type
  $F_n^q=F_n^(q)(alpha_m;beta_k;phi;f;psi)$ if their matrix entries have the
  form #eq(
    $
      c_(m k)=frac(beta_k, alpha_m)frac(1, (2pi i)^n)
      integral_(Gamma(rho))phi(z)
      product_(j=1)^n f_(j)(z)^(k_j)psi_(j)(z)^(m_j)
      z_j^(-m_j+q k_j-1) dif z,
    $,
  ) <eq:matrix-integral>
  where $m,k>=0$, and we assume that#footnote[
    The local residue hypotheses of the main theorem in
    @ch:integral-method[Chapter] may also be used, with admissible cycles and
    invertible local substitutions wherever these are required.
  ] #eq(
    $
      f_(j)(0)!=0, quad psi_(j)(0)!=0, quad phi(0)!=0,
      quad alpha_m!=0, quad beta_k!=0.
    $,
  ) <eq:matrix-nondegeneracy>
  For $q>=1$, we have $c_(m k)=0$ unless $q k<=m$. In particular, for $q=1$ the
  matrix is triangular, with nonzero diagonal. When $q=0$, the matrix entries
  are still defined by @eq:matrix-integral, but a relation between arbitrary
  sequences need not be defined; finite support or suitable convergence is then
  required.
] <def:matrix-integral>
#index-mark(
  [@def:matrix-integral],
  group: [Pairs of inverse linear relations],
  after: [Type $P(q,r,s)$],
)[Type $F_n^q$]

#source(101, "89")
For $q=1$, set $w_j=z_j/psi_(j)(z)$, and let $z=g(w)$ be the local inverse.
Write $J_(T)(z)=det(frac(partial w, partial z))$. A change of variables gives
#eq(
  $
    c_(m k) & =frac(beta_k, alpha_m)frac(1, (2pi i)^n)
              integral_(Gamma(rho))phi(z)
              product_(j=1)^n f_(j)(z)^(k_j)psi_(j)(z)^(m_j)
              z_j^(-m_j+k_j-1) dif z \
            & =frac(beta_k, alpha_m)frac(1, (2pi i)^n)
              integral_(Gamma(sigma))
              lr(
                [frac(phi(z), J_(T)(z))
                  product_(j=1)^n (z_j f_(j)(z))^(k_j)psi_(j)(z)^(-1)]
              )
              |_(z=g(w)) w^(-m-e) dif w.
  $,
) <eq:triangular-matrix-integral>
The second integral uses a sufficiently small torus in the $w$-coordinates; the
local change-of-variables theorem identifies its residue with the first.

#remark[
  The same formulas have a formal interpretation. Take $phi$, $f_j$ and $psi_j$
  to be units in the formal power-series algebra $R_0$, and replace the
  normalized integrals by $res_z$ and $res_w$, respectively. No analytic
  convergence is needed in this interpretation.

  We now study the structure of matrices of type $F_n^1$ #bib-ref(
    "Egorychev1974c",
  ).
]

#theorem(name: [inclusion])[
  The relations of polynomial type considered in §§1.5, 1.6 and 3.5 of #bib-ref(
    "Riordan1968",
  ) are of type $F_n^1$.
] <th:polynomial-matrix-inclusion>

#theorem(name: [inversion])[
  Relations of type $F_n^1$ are equivalent to the following functional relation
  between the generating functions $A(w)=sum_(m>=0)alpha_m a_m w^m$ and
  $B(w)=sum_(k>=0)beta_k b_k w^k$: #eq(
    $ A(T(w))J_(T)(w)product_(j=1)^n psi_(j)(w)=phi(w)B(S(w)), $,
  ) <eq:matrix-generating-relation>
  where $T_(j)(w)=w_j/psi_(j)(w)$, $S_(j)(w)=w_j f_(j)(w)$, and
  $J_(T)(w)=det(frac(partial T, partial w))$. The identity may be read formally,
  or analytically when the generating series converge near the origin.
] <th:matrix-generating-relation>

#corollary[
  The inverse $D$ of a matrix $C$ of type $F_n^1$ exists and is of the same
  type. If $W$ is the local inverse of $S$, its entries are #eq(
    $
      d_(m k) & =frac(alpha_k, beta_m)frac(1, (2pi i)^n)
                integral_(Gamma(sigma)) t^(-m-e) \
              & quad times lr(
                  [phi(w)^(-1)J_(T)(w)
                    product_(j=1)^n w_j^(k_j)psi_(j)(w)^(-k_j+1)]
                )
                |_(w=W(t)) dif t
    $,
  ) <eq:inverse-matrix-implicit-integral>
  #block(sticky: true)[and, equivalently,]
  #eq(
    $
      d_(m k) & =frac(alpha_k, beta_m)frac(1, (2pi i)^n)
                integral_(Gamma(rho))phi(w)^(-1)J_(T)(w)J_(S)(w) \
              & quad times product_(j=1)^n psi_(j)(w)^(-k_j+1)f_(j)(w)^(-m_j-1)
                w_j^(-m_j+k_j-1) dif w,
    $,
  ) <eq:inverse-matrix-integral>
  #source(102, "90")
  where $J_(S)(w)=det(frac(partial S, partial w))$ and each integration torus is
  chosen in the corresponding local coordinate neighbourhood.
]

#theorem(name: [decomposition])[
  A matrix of type $F_n^(q)(alpha_m;beta_k;phi;f;psi)$ is a product, in the
  indicated order, of matrices of the following types:
  $
    F_n^(1)(alpha_m;1;1;e;psi), quad
    F_n^(1)(1;1;phi;e;e), quad
    F_n^(q)(1;beta_k;1;f;e).
  $
] <th:matrix-decomposition>

#proof(title: [Proofs])[
  The inclusion theorem follows by comparing the polynomial relations with
  @eq:matrix-integral. See, for example, the systems in Problem
  @prob:functional-pair-equivalence[]. For its binomial relation, take
  $alpha_m=beta_k=1$, $phi=1$, $psi_j=1+z_j$ and $f_j=-1$. For the two-index
  Chebyshev relation take $phi=1$, $f=e$ and $psi_j=1+z_j^2$. The mixed relation
  combines these choices, and the first-difference relation uses
  $phi=(1-z_1)(1-z_2)$ and $f=psi=e$.

  To prove @th:matrix-generating-relation, sum @eq:triangular-matrix-integral
  after multiplication by $alpha_m b_k w^m$. Coefficient extraction gives
  $
    A(w)=lr([frac(phi(z)B(S(z)), J_(T)(z)product_(j=1)^n psi_(j)(z))])
    |_(z=g(w)).
  $
  Substitution of $w=T(z)$ proves @eq:matrix-generating-relation. Both $T$ and
  $S$ have invertible diagonal linear parts, and the multiplying series has
  nonzero constant term. Thus the relation is invertible. Solving for $B$ and
  extracting coefficients proves @eq:inverse-matrix-implicit-integral. The
  substitution $t=S(w)$ gives @eq:inverse-matrix-integral. In particular, the
  inverse has parameters
  $
    tilde(alpha)_m=beta_m, quad tilde(beta)_k=alpha_k, quad
    tilde(f)_j=psi_j^(-1), quad tilde(psi)_j=f_j^(-1),
  $
  $
    tilde(phi)=phi^(-1)J_T J_S product_(j=1)^n psi_j/f_j.
  $
  Its constant term is $phi(0)^(-1)$, so the nonvanishing conditions hold.

  #block(sticky: true)[
    For @th:matrix-decomposition, multiply the three indicated matrices. Their
    general product entry is
  ]
  #eq(
    $
      c_(m k) & =sum_(r>=0)sum_(s>=0)
                frac(1, alpha_m)res_w
                product_(j=1)^n psi_(j)(w)^(m_j)w_j^(-m_j+r_j-1) \
              & quad times res_v phi(v)product_(j=1)^n v_j^(-r_j+s_j-1)
                times beta_k res_u product_(j=1)^n
                f_(j)(u)^(k_j)u_j^(-s_j+q k_j-1).
    $,
  ) <eq:matrix-factorization>
  For fixed $m,k$, only $0<=s<=r<=m$ contribute, even when $q=0$. Summing first
  over $s$ extracts the Taylor series of
  $h_(k)(v)=product_(j=1)^n f_(j)(v)^(k_j)v_j^(q k_j)$. Summing over $r$ then
  gives $phi(w)h_(k)(w)$. Hence @eq:matrix-factorization reduces to
  @eq:matrix-integral, as required. In integral notation these two summations
  are applications of Cauchy's formula on nested tori with
  $0<rho_1<rho_2<rho_3<R$; the two inner differentials are $dif v$ and $dif u$.
]
