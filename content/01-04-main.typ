#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, dw, eq, res, source
#import "statements.typ": corollary, lemma, proof, remark, theorem
#import "book-style.typ": keep-next, keep-together
#import "editorial-notes.typ": editorial-note

#heading(level: 2)[
  The main theorem and MacMahon's master theorem
] <sec:main-residue-theorem>
#index-mark([@sec:main-residue-theorem], group: [Theorems])[MacMahon’s master
  theorem]

The theorem which MacMahon called a master theorem is as follows (#bib-ref(
  "Hall1958",
), p. 49).

#theorem[
  _If $X_1, dots, X_n$ are given by the relation
  $ (X_1, dots, X_n) = A(x_1, dots, x_n), $
  where $A=(a_(i j))$ is an $n times n$ matrix, then, for nonnegative integers
  $c_1, dots, c_n$, the coefficient of #source(
    31,
    "19",
  )$x_1^(c_1) dots x_n^(c_n)$ in the expansion of the product
  $X_1^(c_1) dots X_n^(c_n)$ is equal to the coefficient of
  $x_1^(c_1) dots x_n^(c_n)$ in the expansion of the fraction_
  #eq(
    $ 1 / abs((1-a_1 x_1)(1-a_2 x_2) dots (1-a_n x_n)), $,
  ) <eq:coefficient-majorant>
  _where the denominator is symbolic, and in its expansion the term
  $a_i a_j dots a_t$ is to be replaced by the minor of $A$ made up from the
  $i$th, $j$th, …, $t$th rows and columns._
] <th:coefficient-majorant>

We consider a more general construction which often arises in using the idea of
an integral representation.

#theorem(title: [Main Theorem], suffix: [])[
  #bib-ref("Egorychev1974d").
  _Let $m_1, dots, m_n$ be positive integers. Suppose that the terms of an
  $n$-fold sequence of numbers $lr({c_k})$, $abs(k) >= 0$, can be represented in
  the form_
  #eq(
    $
      c_k = 1/(2 pi i)^n integral_(Gamma(rho)) phi(z)
      lr((product_(j=1)^n (f_j^(m_j k_j)(z) z_j^(-m_(j)(k_j+1))))) dif z,
    $,
  ) <eq:residue-series-coefficients>
  _where $phi(z)$ and $f_(1)(z), dots, f_(n)(z)$ are holomorphic in a
  neighborhood of the polydisc_
  $ U(R) = {z = (z_1, dots, z_n): abs(z_j) <= R, j=1,dots,n}, $
  _$Gamma(rho) = {z: abs(z_j)=rho, j=1,dots,n}$, and $0 < rho < R$._

  _Then the series_
  $ F(t) = sum_(abs(k) >= 0) c_(k_1 dots k_n) t_1^(k_1) dots t_n^(k_n) $
  _converges absolutely in some neighborhood of the origin, and_
  #eq(
    $
      F(t) = 1/(2 pi i)^n integral_(Gamma(rho)) phi(z)
      lr((product_(j=1)^n (z_j^(m_j)-t_j f_j^(m_j)(z))^(-1))) dif z.
    $,
  ) <eq:generating-integral>

  In particular, the cases a) and b) below are possible.

  a) _If $m_1=dots=m_n=1$, then (#bib-ref("Egorychev1972b"), main lemma)_ #eq(
    $ F(t) = lr([phi(z) \/ ((∂ w)/(∂ z))])|_(z=z(t)), $,
  ) <eq:simple-root-evaluation>
  _where $w_j=z_j-t_j f_(j)(z)$, $j=1,dots,n$, and
  $z(t)=(z_(1)(t),dots,z_(n)(t))$ is the unique solution of the system
  $z_j=t_j f_(j)(z)$, $j=1,dots,n$, in $U(rho)$ for sufficiently small $t$._


  A construction equivalent to case a) but under more stringent assumptions was
  obtained by Good with the help of a change of variables in multiple contour
  integrals (#bib-ref("Good1960"), Theorem 11; #bib-ref("Good1962b")). This
  construction is introduced by other means and without a detailed proof in
  #bib-ref("Spanier1966") in connection with the derivation of MacMahon's master
  theorem.

  For $m_1=dots=m_n=1$ and $f_(1)(0)=dots=f_(n)(0)=0$ we have $z=z(t)=0$ in
  @eq:simple-root-evaluation, and, consequently, only the coefficients of the
  first powers of the #source(32, "20")variables $z_1,dots,z_n$ in the power
  series expansions of the functions $f_(1)(z),dots,f_(n)(z)$ are involved in
  @eq:residue-series-coefficients and @eq:generating-integral. Thus, under these
  conditions everything is settled by the case
  $f_(j)(z)=sum_(nu=1)^n a_(j nu) z_nu$, for which @eq:simple-root-evaluation
  gives MacMahon's master theorem as a corollary.

  #corollary(suffix: [])[
    (MacMahon's master theorem; #bib-ref("MacMahon1915"), #bib-ref(
      "Good1962b",
    ), #bib-ref("Egorychev1970b")). _If_ #eq(
      $
        F(t) = F(t_1,dots,t_n) \
        = sum_(abs(c) >= 0) lr((product_(j=1)^n t_j^(c_j)))
        res_(x_1 dots x_n) lr(
          (
            product_(j=1)^n lr(
              (
                (sum_(nu=1)^n a_(j nu) x_nu)^(c_j) x_j^(-c_j-1)
              )
            )
          )
        ),
      $,
    ) <eq:macmahon-series>
    _then_
    #eq($ F(t)=Delta^(-1)(t_1,dots,t_n), $) <eq:macmahon-theorem>
    #keep-next[
      _where the Jacobian is_
    ]
    #eq(
      $
        Delta(t_1, dots, t_n) = mat(
          delim: "|",
          1-a_(11)t_1, -a_(12)t_1, dots.h, -a_(1n)t_1;
          -a_(21)t_2, 1-a_(22)t_2, dots.h, -a_(2n)t_2;
          dots.v, dots.v, dots.down, dots.v;
          -a_(n 1)t_n, -a_(n 2)t_n, dots.h, 1-a_(n n)t_n;
        ).
      $,
    ) <eq:macmahon-determinant>
  ]

  We now proceed with the second case of our Main Theorem.

  b) _If $f_(j)(0) != 0$ for $j=1,dots,n$, then, for sufficiently small
  parameters satisfying $t_j != 0$ for all $j$,_ #eq(
    $
      F(t) = sum_(z(t) in cal(E))
      lr([phi(z) \/ ((∂ w)/(∂ z))])|_(z=z(t)),
    $,
  ) <eq:root-sum-evaluation>
  _where_
  #eq($ w_j=z_j^(m_j)-t_j f_j^(m_j)(z), quad j=1,dots,n, $) <eq:root-system>
  _and $cal(E)$ is the set of zeros $z(t)=(z_(1)(t),dots,z_(n)(t))$ of this
  system in $U(rho)$. Values with some $t_j=0$ are obtained by holomorphic
  continuation of the whole sum in #ref(<eq:root-sum-evaluation>)._
] <th:residue-series-coefficients>
#index-mark([@th:residue-series-coefficients], group: [Theorems])[Main theorem]

#remark[
  Formulas @eq:simple-root-evaluation, @eq:macmahon-theorem, and
  @eq:root-sum-evaluation express the integral @eq:generating-integral in terms
  of multidimensional residues for these cases. If $m_j>1$ and $f_(j)(0)=0$,
  $j=1,dots,n$, then the zeros of @eq:root-system in a neighborhood of the
  origin may not be simple, and the simple-zero residue formula cannot be
  applied in general. However, in concrete cases the computation of the integral
  @eq:generating-integral does not cause any fundamental difficulties. In
  particular, it can be computed by iterated integration or with the help of the
  splitting lemma in §@sec:splitting-integrals.
]

#proof(title: [Proof of the main theorem])[
  #enum(
    numbering: "1.",
    [
      Convergence of the series $F(t)$ can be proved along with
      @eq:generating-integral by termwise integration of the following multiple
      geometric series:
      $
        phi(z) product_(j=1)^n (z_j^(m_j)-t_j f_j^(m_j)(z))^(-1) \
        = sum_(abs(k) >= 0) phi(z)
        lr((product_(j=1)^n f_j^(m_j k_j)(z) t_j^(k_j) z_j^(-m_(j)(k_j+1)))),
      $
      #source(33, "21")which for any $t in U(epsilon)$ converges absolutely and
      uniformly with respect to $z in Gamma_rho$ if we set #eq(
        $
          0 < epsilon < (rho/M_j)^(m_j), quad
          M_j = max_(z in Gamma_rho) abs(f_(j)(z)), quad j=1,dots,n.
        $,
      ) <eq:root-radius-bound>
      If $M_j=0$, that index imposes no restriction on $epsilon$.
    ],
    [#lemma[
        _Suppose that the functions $f_(j)(z)$, $j=1,dots,n$, are holomorphic in
        a neighborhood of the closed polydisc_
        $ overline(U)(rho) = {z=(z_1,dots,z_n): abs(z_j)<=rho, j=1,dots,n}. $
        _Then there is an $epsilon>0$ such that for any
        $tau=(tau_1,dots,tau_n) in U(epsilon)$ the system of equations
        $z_j-tau_j f_(j)(z)=0$, $j=1,dots,n$, has a unique solution
        $z=z(tau)=(z_(1)(tau),dots,z_(n)(tau))$ in $U(rho)$. Moreover, the
        Jacobian $(∂ w)/(∂ z)$ does not vanish in $U(rho)$, where
        $w_j=z_j-tau_j f_(j)(z)$, $j=1,dots,n$._
      ] <lem:polydisc-majorant>

      The first part of the lemma can be proved either by the Rouché principle
      (see, for example, #bib-ref("Shabat1969") and #bib-ref("Milnor1968")) or
      by the method of successive approximations (#bib-ref("Narasimhan1968"),
      proof of Theorem 1.3.2). For the second part, the Jacobian equals 1 at
      $tau=0$; continuity on the compact closed polydisc gives a uniform
      sufficiently small choice of $epsilon$.
    ],
    [Let
      $ A={b=(b_1,dots,b_n): b_j=1,dots,m_j, j=1,dots,n}, $
      and let $epsilon_(j nu)=exp(i 2 pi nu/m_j)$, $nu=1,dots,m_j$. In case b)
      choose $rho>0$ in @eq:residue-series-coefficients so that every $f_(j)(z)$
      is nonzero in a neighborhood of $U(rho)$. Under this condition and because
      of the expansion #eq(
        $
          w_j = w_(j)(z) = z_j^(m_j)-t_j [f_(j)(z)]^(m_j) \
          = product_(nu=1)^(m_j)
          lr([z_j-epsilon_(j nu) t_j^(1\/m_j) f_(j)(z)])
        $,
      ) <eq:root-factorization>
      it follows from @lem:polydisc-majorant that for $0<abs(t_j)<epsilon$,
      $j=1,dots,n$, where $epsilon$ is sufficiently small, the system
      @eq:root-system has $m_1 times dots times m_n$ distinct zeros in $U(rho)$,
      and at each zero $z^((alpha))(t)$, $alpha in A$, the Jacobian
      $(∂ w)/(∂ z)$ is nonzero (this means that all the zeros are simple; see,
      for example, #bib-ref(
        "Milnor1968",
      ), Lemma B.1). For each fixed nonzero $t_j$, any one choice of
      $t_j^(1\/m_j)$ may be used; all roots of unity are included.

      Let us consider case a). For $abs(t_j)<epsilon$, $j=1,dots,n$, where
      $epsilon$ is sufficiently small, the system $w_j=z_j-t_j f_(j)(z)$,
      $j=1,dots,n$, has one simple zero in $U(rho)$.
    ],
    [Let $norm(z)=(sum_(j=1)^n abs(z_j)^2)^(1/2)$. Choose $epsilon>0$ satisfying
      the requirements of parts 1 and 3, and fix admissible $t=(t_1,dots,t_n)$.
      Choose $delta>0$ so that for every $z^((alpha))(t) in cal(E)$ the closed
      balls
      $
        overline(V)_alpha = {z: norm(z-z^((alpha))(t)) <= delta}
        subset U(rho)
      $
      are disjoint and the mapping @eq:root-system is biholomorphic in a
      neighborhood of each ball. This choice is possible because
      $lr([(∂ w)/(∂ z)])|_(z=z^((alpha))(t)) != 0$. There are then positive
      numbers $delta_j$, $j=1,dots,n$, such that each connected component
      $F_alpha$ of $F={z in U(rho): abs(w_(j)(z))<=delta_j, j=1,dots,n}$
      satisfies #eq(
        $ z^((alpha))(t) in F_alpha subset overline(V)_alpha. $,
      ) <eq:root-localization>

      Impose on $delta_1,dots,delta_n$ the following additional requirements in
      constructing the $n$-dimensional cycles $gamma_p$, $p=0,1,dots,n$.
      #source(
        34,
        "22",
      )Set $gamma_0=Gamma_rho=Gamma(rho)$ and define successively
      $
        gamma_p = lr(
          {z in overline(U)(rho):
            abs(w_(j)(z))=delta_j, j=1,dots,p,
            abs(z_(p+1))=dots=abs(z_n)=rho}
        ),
      $
      for $p=1,dots,n$, choosing regular levels sufficiently small that
      @eq:root-localization holds and
      $ 0<delta_p<min_(z in gamma_(p-1)) abs(w_(p)(z)). $

      For the small parameters chosen in part 1, $w_(p)(z) != 0$ when
      $abs(z_p)=rho$ in $overline(U)(rho)$, and hence on $gamma_(p-1)$. The
      orientation of $gamma_p$ is given by the order of the arguments
      $psi_1,dots,psi_p, phi_(p+1),dots,phi_n$, where
      $w_(j)(z)=delta_j e^(i psi_j)$, $j=1,dots,p$, and $z_nu=rho e^(i phi_nu)$,
      $nu=p+1,dots,n$. The cycles $gamma_0=Gamma_rho$, $gamma_1,dots,gamma_n$
      are mutually homologous,
      $Gamma_rho tilde gamma_1 tilde dots tilde gamma_n$, in the domain
      $ U(R) without union_(j=1)^n {z: w_(j)(z)=0}, $
      where the integrand form in @eq:generating-integral is regular.

      Indeed, $gamma_(p-1)-gamma_p=(-1)^(p-1) ∂ B_p$, where $B_p$ is the
      oriented closure of
      $
        lr(
          {z in overline(U)(rho):
            abs(w_(j)(z))=delta_j, j=1,dots,p-1, \
            abs(w_(p)(z))>delta_p, abs(z_p)<rho,
            abs(z_(p+1))=dots=abs(z_n)=rho}
        ).
      $
      This chain lies in $U(R) without union_(j=1)^n {z:w_(j)(z)=0}$. On regular
      coordinate patches its orientation is given by
      $psi_1,dots,psi_(p-1),r_p,phi_p,phi_(p+1),dots,phi_n$, where
      $w_(j)(z)=delta_j e^(i psi_j)$ for $j<p$, $z_p=r_p e^(i phi_p)$, and
      $z_nu=rho e^(i phi_nu)$ for $nu>p$.

      Near $gamma_p$, the parameters
      $psi_1,dots,psi_(p-1),tilde(r)_p,psi_p,phi_(p+1),dots,phi_n$
      give the same orientation. Here $w_(p)(z)=tilde(r)_p e^(i psi_p)$. With
      $w_1,dots,w_(p-1)$ and $z_(p+1),dots,z_n$ held fixed, let $D_p w_p$ denote
      the derivative of $w_p$ in the remaining local complex coordinate $z_p$.
      The change of polar coordinates has positive Jacobian:
      $
        (∂(tilde(r)_p,psi_p))/(∂(r_p,phi_p))
        = (∂(tilde(r)_p,psi_p))/(∂(u_p,v_p))
        (∂(u_p,v_p))/(∂(x_p,y_p))
        (∂(x_p,y_p))/(∂(r_p,phi_p)) \
        = 1/tilde(r)_p abs(D_p w_p)^2 r_p > 0,
      $
      where $w_p=u_p+i v_p$, $z_p=x_p+i y_p$, and the derivatives are taken on
      these patches.

      The cycle
      $gamma_n={z in overline(U)(rho):abs(w_(j)(z))=delta_j,j=1,dots,n}$ breaks
      up into $m_1 times dots times m_n$ connected components $Gamma_alpha$ in
      case b), and one component in case a), where
      $ Gamma_alpha={z in overline(V)_alpha:abs(w_(j)(z))=delta_j,j=1,dots,n}. $
      By the Cauchy–Poincaré theorem (#bib-ref("Shabat1969"), p. 335) and the
      relation
      $ Gamma_rho tilde gamma_n=sum_(alpha in A) Gamma_alpha, $
      we then have #eq(
        $
          F(t) = 1/(2 pi i)^n integral_(Gamma_rho) phi(z)
          lr((product_(j=1)^n w_j^(-1)(z))) dif z \
          = 1/(2 pi i)^n integral_(gamma_n) phi(z)
          lr((product_(j=1)^n w_j^(-1)(z))) dif z \
          = sum_(alpha in A) 1/(2 pi i)^n integral_(Gamma_alpha) phi(z)
          lr((product_(j=1)^n w_j^(-1)(z))) dif z.
        $,
      ) <eq:contour-deformation>

      #source(35, "23")The mapping @eq:root-system in case b), or
      $w_j=z_j-t_j f_(j)(z)$ in case a), is biholomorphic near
      $overline(V)_alpha supset Gamma_alpha$. Consequently, #eq(
        $
          1/(2 pi i)^n integral_(Gamma_alpha) phi(z)
          lr((product_(j=1)^n w_j^(-1)(z))) dif z \
          = 1/(2 pi i)^n integral_(abs(w_1)=delta_1) dots
          integral_(abs(w_n)=delta_n) phi(z(w)) (∂ z)/(∂ w)
          dw/(w_1 dots w_n) \
          = lr([phi(z(w)) (∂ z)/(∂ w)])|_(w=0)
          = lr([phi(z) \/ ((∂ w)/(∂ z))])|_(z=z^((alpha))(t)).
        $,
      ) <eq:local-change-variables>
      Substituting @eq:local-change-variables#editorial-note(
        "local-homology",
      )[
        For the cohomological interpretation of the local residue integral, see
        #cite(
          <Vidras2023>,
          supplement: [Proposition 2.14, pp. 70–71],
        ).
      ] into @eq:contour-deformation gives both @eq:root-sum-evaluation and
      @eq:simple-root-evaluation.
    ],
  )
]

#remark[
  The Alexander–Pontryagin duality viewpoint interprets the local cycles
  $Gamma_alpha$ as residue cycles about the simple zeros. The relation
  $Gamma_rho tilde sum_(alpha in A) Gamma_alpha$ gives coefficient 1 at each
  such zero. Thus the main theorem on residues also gives
  @eq:root-sum-evaluation (see the Supplement, §@supp:residue-theory).

  Using the formula for expanding a rational function of one variable into
  partial fractions, we indicate another derivation of @eq:root-sum-evaluation
  and give another representation of it. In case b), write
  $
    w_j^(-1)(z)=product_(nu=1)^(m_j) w_(j nu)^(-1)(z) \
    = sum_(nu=1)^(m_j) epsilon_(j nu)
    lr({m_j [t_j^(1\/m_j) f_(j)(z)]^(m_j-1) w_(j nu)(z)})^(-1),
  $
  where
  $
    w_(j nu)(z)=z_j-epsilon_(j nu) t_j^(1\/m_j) f_(j)(z), quad
    epsilon_(j nu)=e^(i 2 pi nu/m_j).
  $
  Then #eq(
    $
      F(t)=1/(2 pi i)^n integral_(Gamma_rho) phi(z)
      lr((product_(j=1)^n w_j^(-1)(z))) dif z \
      = sum_(alpha in A) 1/(2 pi i)^n integral_(Gamma_rho) phi(z) \
      quad times lr(
        {product_(j=1)^n epsilon_(j alpha_j)
          lr(
            {m_j (t_j^(1\/m_j) f_(j)(z))^(m_j-1)
              w_(j alpha_j)(z)}
          )^(-1)}
      ) dif z.
    $,
  ) <eq:partial-fractions-integral>

  Choose $eta$ with $rho<eta<R$ so that all $f_j$ remain nonzero on $U(eta)$.
  After decreasing the parameter bound further, the local component of each
  level set
  $
    Gamma_(alpha)(theta) = lr(
      {z in U(eta):
        abs(z_j-theta epsilon_(j alpha_j) t_j^(1\/m_j) f_(j)(z))=rho,
        j=1,dots,n}
    ),
  $
  for $0<=theta<=1$, gives a continuous deformation of $Gamma_rho$ to
  $ Gamma'_alpha={z in U(eta):abs(w_(j alpha_j)(z))=rho,j=1,dots,n}. $
  These cycles avoid both the zeros of $w_(j alpha_j)$ and the zeros of $f_j$.
  Their endpoints are $Gamma_(alpha)(0)=Gamma_rho$ and
  $Gamma_(alpha)(1)=Gamma'_alpha$. By the Cauchy–Poincaré theorem, $Gamma_rho$
  can therefore be #source(36, "24")replaced by $Gamma'_alpha$ in the $alpha$th
  term of @eq:partial-fractions-integral. Making the substitution
  $w_j=w_(j alpha_j)(z)$, $j=1,dots,n$, we get, as in
  @eq:simple-root-evaluation,
  $
    1/(2 pi i)^n integral_(Gamma_rho) phi(z)
    lr(
      {product_(j=1)^n epsilon_(j alpha_j)
        lr(
          {m_j [t_j^(1\/m_j) f_(j)(z)]^(m_j-1)
            w_(j alpha_j)(z)}
        )^(-1)}
    ) dif z \
    = lr(
      {
        (phi(z) product_(j=1)^n epsilon_(j alpha_j)
        lr({m_j [t_j^(1\/m_j) f_(j)(z)]^(m_j-1)})^(-1)) /
        ((∂(w_(1 alpha_1),dots,w_(n alpha_n)))/(∂(z_1,dots,z_n)))
      }
    )|_(z=z^((alpha))(t)),
  $
  which coincides with
  $ lr([phi(z) \/ ((∂ w)/(∂ z))])|_(z=z^((alpha))(t)) $
  in @eq:root-sum-evaluation. Thus, #eq(
    $
      F(t)=sum_(z^((alpha))(t) in cal(E))
      lr([phi(z) \/ ((∂ w)/(∂ z))])|_(z=z^((alpha))(t)) \
      = sum_(alpha in A) lr(
        [
          (phi(z) product_(j=1)^n epsilon_(j alpha_j)
          lr({m_j [t_j^(1\/m_j) f_(j)(z)]^(m_j-1)})^(-1)) /
          det[delta_(j nu)
            - epsilon_(j alpha_j) t_j^(1\/m_j) (∂ f_j)/(∂ z_nu)]
        ]
      )|_(z=z^((alpha))(t)).
    $,
  ) <eq:explicit-root-sum>
]

#remark[
  The main theorem can also be obtained expeditiously with the help of the
  theorem on the multiple logarithmic residue (see §@supp:logarithmic-residue in
  the Supplement). In §@sec:splitting-integrals we present a scheme for this
  proof while obtaining a result more general than the main theorem.
]
