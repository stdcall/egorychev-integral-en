#import "index-style.typ": index-mark
#import "statements.typ": corollary, lemma, proof, remark
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(184, "172")
#heading(level: 2)[
  The splitting method as a method for computing one-dimensional and multiple
  contour integrals
] <sec:splitting-integrals>
#index-mark([@sec:splitting-integrals], group: [Methods])[Splitting]

We consider integrals of meromorphic forms over cycles, or more generally
chains. Direct computation is often difficult, except on separating cycles
(#bib-ref("Yuzhakov1975a"), p. 145). Such a cycle is a composite coboundary
about an isolated intersection of the singular hypersurfaces corresponding to
the factors in the denominator; see the Supplement, §@supp:leray-residues.
Splitting introduces additional variables with coefficient-extraction circles.
When the resulting contour is separating, the multidimensional residue formula
applies. In practice, this procedure helps find a change of variables reducing
the original integral to standard contour integrals.
#footnote[
  The main idea of the lemma also applies to integrals of other types whose
  integrands have the same structure.
]

#heading(level: 3)[The splitting lemma] <sec:splitting-lemma>

#lemma[
  Consider the form #eq(
    $
      w_(k)(z) & =psi(z)f^(k)(z)phi^(-k-1)(z)dif z \
               & =psi(z)lr(
                   (product_(j=1)^r
                     f_(j)^(k m_j)(z)phi_(j)^(-(k+1)m_j)(z))
                 )dif z,
                 quad k=0,1,2,dots,
    $,
  ) <eq:splitting-differential-form>
  where $psi,f_j,phi_j$ are holomorphic in a domain $D subset CC^n$, and
  $
    f(z)=product_(j=1)^r f_(j)^(m_j)(z), quad
    phi(z)=product_(j=1)^r phi_(j)^(m_j)(z).
  $
  The integers $m_1,dots,m_r$ are positive. Let $gamma$ be a finite, piecewise
  smooth $n$-dimensional chain in $D without {z:phi(z)=0}$.


  #source(185, "173")
  #keep-next[
    For each fixed $k>=0$, the integral $J=integral_(gamma) w_(k)(z)$ has the
    following representations:
  ]
  #eq(
    $
      J=1/(2pi i)integral_(gamma times gamma_1)
      psi(z)(phi(z)-tau f(z))^(-1)tau^(-k-1)dif z ∧ dif tau,
    $,
  ) <eq:splitting-one-parameter>
  #eq(
    $
      J & =1/(2pi i)^r integral_(gamma times gamma_2)psi(z) \
        & quad times lr(
            (product_(j=1)^r
              (phi_(j)^(m_j)(z)-t_j f_(j)^(m_j)(z))^(-1)t_j^(-k-1))
          )dif z ∧ dif t,
    $,
  ) <eq:splitting-factor-powers>
  #eq(
    $
      J & =1/(2pi i)^r integral_(gamma times gamma_2)psi(z) \
        & quad times lr(
            (product_(j=1)^r phi_(j)^(k-m_j)(z)
              (phi_(j)^(k)(z)-t_j f_(j)^(k)(z))^(-1)t_j^(-m_j-1))
          )dif z ∧ dif t,
    $,
  ) <eq:splitting-exchanged-powers>
  #eq(
    $
      J & =1/(2pi i)^r integral_(gamma times gamma_2)psi(z)phi^(-1)(z) \
        & quad times lr(
            (product_(j=1)^r phi_(j)(z)
              (phi_(j)(z)-t_j f_(j)(z))^(-1)t_j^(-k m_j-1))
          )dif z ∧ dif t,
    $,
  ) <eq:splitting-multiple-coefficients>
  #eq(
    $
      J & =(2pi i)^(-sum_j m_j)integral_(gamma times gamma_3)psi(z) \
        & quad times lr(
            (product_(j=1)^r product_(l=1)^(m_j)
              (phi_(j)(z)-s_(j l)f_(j)(z))^(-1)s_(j l)^(-k-1))
          )dif z ∧ dif s.
    $,
  ) <eq:splitting-repeated-factors>
  Here all auxiliary circles are positively oriented, and
  $
    gamma_1 & ={tau:|tau|=epsilon}, \
    gamma_2 & ={t=(t_1,dots,t_r):|t_j|=epsilon_j}, \
    gamma_3 & ={s=(s_(1 1),dots,s_(1 m_1),dots,s_(r 1),dots,s_(r m_r)):
                |s_(j l)|=epsilon_(j l)}.
  $
  Choose $epsilon>0$, $0<epsilon_j<1$, and $epsilon_(j l)>0$ small enough that,
  for all points of these contours and all $z in gamma$, #eq(
    $
                |tau f(z)| & <|phi(z)|, \
            |t_j f_(j)(z)| & <|phi_(j)(z)|, \
      |t_j f_(j)^(m_j)(z)| & <|phi_(j)^(m_j)(z)|, \
        |t_j f_(j)^(k)(z)| & <|phi_(j)^(k)(z)|, \
         |s_(j l)f_(j)(z)| & <|phi_(j)(z)|,
                             quad 1<=j<=r, quad 1<=l<=m_j.
    $,
  ) <eq:splitting-contour-bounds>
  The compact support of $gamma$ makes this simultaneous choice possible for any
  fixed $k$. The radii may depend on $k$.
] <lem:splitting-differential-form>

#corollary[
  If $r=2$ and $m_1=m_2=1$, so that #eq(
    $
      phi(z)=phi_(1)(z)phi_(2)(z), quad f(z)=f_(1)(z)f_(2)(z),
    $,
  ) <eq:splitting-two-factors>
  #source(186, "174")
  #keep-next[
    with all four factors holomorphic in $D$, then under
    @eq:splitting-contour-bounds,
  ]
  #eq(
    $
      & 1/(2pi i)integral_(gamma times gamma_1)
        psi(z)(phi(z)-tau f(z))^(-1)tau^(-k-1)dif z ∧ dif tau \
      & =1/(2pi i)^2 integral_(gamma times gamma_2)psi(z)
        (phi_(1)(z)-t_1 f_(1)(z))^(-1) \
      & quad times (phi_(2)(z)-t_2 f_(2)(z))^(-1)
        (t_1 t_2)^(-k-1)dif z ∧ dif t_1 ∧ dif t_2.
    $,
  ) <eq:splitting-double-integral>

  #keep-next[In particular, for $k=0$ and $m_1=dots=m_r=1$, put]
  #eq(
    $
      J_0=integral_(gamma) psi(z)phi^(-1)(z)dif z.
    $,
  ) <eq:splitting-zero-coefficient>
  #keep-next[Then]
  #eq(
    $
      J_0=1/(2pi i)integral_(gamma times gamma_1)
      psi(z)(phi(z)-tau f(z))^(-1)tau^(-1)dif z ∧ dif tau
    $,
  ) <eq:splitting-zero-parameter>
  and #eq(
    $
      J_0 & =1/(2pi i)^r integral_(gamma times gamma_2)psi(z) \
          & times product_(j=1)^r 1/((phi_(j)(z)-t_j f_(j)(z))t_j)dif z ∧ dif t.
    $,
  ) <eq:splitting-zero-multiple-parameters>
  Here $f_1,dots,f_r$ may be arbitrary holomorphic functions in $D$, with
  $f=f_1 dots f_r$, provided that the contours satisfy
  @eq:splitting-contour-bounds.
]

#proof(title: [Proof of the splitting lemma])[
  Expand each denominator as a geometric series in its auxiliary variable. By
  @eq:splitting-contour-bounds and compactness of the contours and the support
  of $gamma$, these series converge uniformly absolutely. Termwise integration
  is therefore valid.

  In @eq:splitting-one-parameter, the coefficient of $tau^k$ is $f^k/phi^(k+1)$.
  In @eq:splitting-factor-powers, the coefficient of $t_j^k$ in the factor with
  index $j$ is $f_j^(k m_j)/phi_j^((k+1)m_j)$. In
  @eq:splitting-exchanged-powers, its coefficient of $t_j^(m_j)$ is the same,
  since
  $
    phi_j^(k-m_j) f_j^(k m_j)/phi_j^(k (m_j+1))
    =f_j^(k m_j)/phi_j^((k+1)m_j).
  $
  For @eq:splitting-multiple-coefficients, the coefficient of $t_j^(k m_j)$ in
  $phi_j/(phi_j-t_j f_j)$ is $(f_j/phi_j)^(k m_j)$; the outside factor
  $phi^(-1)$ supplies the remaining powers. Finally, each of the $m_j$
  independent variables $s_(j l)$ in @eq:splitting-repeated-factors contributes
  $f_j^k/phi_j^(k+1)$. Thus all five integrals reduce to $J$.
]

#remark[
  In practice, splitting usually consists of repeated applications of
  @eq:splitting-double-integral and @eq:splitting-one-parameter. The
  decompositions #eq(
    $
      f(z)=product_(j=1)^r f_(j)^(m_j)(z), quad
      phi(z)=product_(j=1)^r phi_(j)^(m_j)(z)
    $,
  ) <eq:splitting-power-factorization>
  need not be unique. Choose them, and a suitable representation among
  @eq:splitting-factor-powers–@eq:splitting-repeated-factors, so that the
  resulting integrals can be computed by iterated integration or an appropriate
  multidimensional residue formula. For combinatorial sums, the form of the
  resulting generating functions also matters; see the examples in this and the
  next section.
]
