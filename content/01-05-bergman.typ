#import "index-style.typ": index-mark
#import "statements.typ": proof, theorem
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, source

#source(41, "29")
#heading(level: 3)[
  Computation of a Bergman kernel
] <sec:bergman-kernel>
#index-mark([@sec:bergman-kernel], group: [Kernels])[Bergman]

We use the algorithm of §@sec:computation-algorithm to obtain an integral
representation and a closed formula for the Bergman kernel $K(x)=K(x_1,x_2,x_3)$
of the 3-circular domain #eq(
  $
    D={z=(z_1,z_2,z_3) in CC^3:
      (abs(z_1)^2+abs(z_2)^2)^(1/q)+abs(z_3)^2<1},
  $,
) <eq:bergman-domain>
where $q$ is a positive integer. Integration is with respect to volume.
#footnote[See §@sec:unbounded-szego-kernels on Bergman kernels.]

#theorem[
  _Let $K(x)=K(x_1,x_2,x_3)$ be the Bergman kernel of the domain
  @eq:bergman-domain, with integration over its volume. In a neighborhood of the
  origin, $K(x)$ has the following representations:_
  #footnote[
    Compare #bib-ref("Chalmers1968"), where the same kernel is expressed using
    operators.
  ]
  #eq(
    $
      K(x)=pi^(-3) sum_(k_1=0)^infinity sum_(k_2=0)^infinity
      sum_(k_3=0)^infinity \
      quad frac(
        (q(k_1+k_2+2)+k_3+1)! (k_1+k_2+2)!,
        k_1! k_2! k_3! (q(k_1+k_2+2))!,
      )
      x_1^(k_1) x_2^(k_2) x_3^(k_3),
    $,
  ) <eq:bergman-series>
  #eq(
    $
      K(x)=2/(pi^3 (2 pi i)^4) integral_(Gamma(rho))
      frac(
        (1+u_3+u_4)^(2q+1) (1+u_1+u_2)^2,
        u_4^2 (u_1-x_(1)(1+u_1+u_2)(1+u_3+u_4)^q),
      ) \
      quad times frac(
        dif u_1 ∧ dif u_2 ∧ dif u_3 ∧ dif u_4,
        (u_2-x_(2)(1+u_1+u_2)(1+u_3+u_4)^q)
        (u_3-x_(3)(1+u_3+u_4)),
      ),
    $,
  ) <eq:bergman-integral>
  #source(42, "30")
  _where_
  $
    Gamma(rho)={u=(u_1,u_2,u_3,u_4):abs(u_j)=rho, j=1,2,3,4}
  $
  _is the skeleton of a sufficiently small polycylinder $U(rho)$; and_
  #eq(
    $
      K(x)=2 pi^(-3) (1-x_3)^(q-2)
      ((1-x_3)^q-(x_1+x_2))^(-4) \
      quad times ((2q+1)(1-x_3)^q+(q-1)(x_1+x_2)).
    $,
  ) <eq:bergman-closed-form>
] <th:bergman-series>

#proof[
  Formula @eq:bergman-series follows immediately from the results of
  §@sec:bounded-kernels. We use it to prove @eq:bergman-integral and
  @eq:bergman-closed-form.

  #keep-next[
    First, express the coefficients in @eq:bergman-series as products of
    multinomial coefficients:
  ]
  #eq(
    $
      K(x)=2 pi^(-3) sum_(k>=0)
      binom(k_1+k_2+2, k_1, k_2)
      binom(q(k_1+k_2+2)+k_3+1, k_3, 1) \
      quad times x_1^(k_1) x_2^(k_2) x_3^(k_3).
    $,
  ) <eq:bergman-multinomial-series>
  #keep-next[
    Apply the formula $M_(1)(u_1,u_2)$ to the first coefficient and
    $M_(1)(u_3,u_4)$ to the second:
  ]
  #eq(
    $
      binom(k_1+k_2+2, k_1, k_2)
      =1/(2 pi i)^2 integral_(abs(u_1)=rho,abs(u_2)=rho)
      (1+u_1+u_2)^(k_1+k_2+2) /
      (u_1^(k_1+1) u_2^(k_2+1)) dif u_1 ∧ dif u_2, \
      binom(q(k_1+k_2+2)+k_3+1, k_3, 1) \
      quad =1/(2 pi i)^2 integral_(abs(u_3)=rho,abs(u_4)=rho)
      (1+u_3+u_4)^(q(k_1+k_2+2)+k_3+1) /
      (u_3^(k_3+1) u_4^2) dif u_3 ∧ dif u_4.
    $,
  ) <eq:bergman-coefficient-integrals>
  Combining these integrals and taking the sum under the integral sign gives,
  for all $abs(x_j)<=epsilon$, #eq(
    $
      K(x)=2 pi^(-3)/(2 pi i)^4 integral_(Gamma(rho))
      frac(
        (1+u_3+u_4)^(2q+1) (1+u_1+u_2)^2,
        u_1 u_2 u_3 u_4^2,
      ) \
      quad times lr(
        {sum_(k>=0)
          (frac(x_(1)(1+u_1+u_2)(1+u_3+u_4)^q, u_1))^(k_1) \
          quad times (frac(x_(2)(1+u_1+u_2)(1+u_3+u_4)^q, u_2))^(k_2)
          (frac(x_(3)(1+u_3+u_4), u_3))^(k_3)}
      ) dif u,
    $,
  ) <eq:bergman-summed-integral>
  where $dif u=dif u_1 ∧ dif u_2 ∧ dif u_3 ∧ dif u_4$. #source(
    43,
    "31",
  )Choose $epsilon>0$ small enough that each of the three geometric ratios has
  modulus less than 1 on $Gamma(rho)$. Summing the geometric series in
  @eq:bergman-summed-integral then gives @eq:bergman-integral.

  To derive @eq:bergman-closed-form, make the following change of variables in
  @eq:bergman-integral, leaving $u_4$ fixed (see the Supplement): #eq(
    $
      v_1=u_1-x_(1)(1+u_1+u_2)(1+u_3+u_4)^q, \
      v_2=u_2-x_(2)(1+u_1+u_2)(1+u_3+u_4)^q, \
      v_3=u_3-x_(3)(1+u_3+u_4).
    $,
  ) <eq:bergman-substitution>
  #block(breakable: false)[
    For sufficiently small $epsilon$, whenever $abs(x_j)<=epsilon$, $j=1,2,3$,
    the first term on each right-hand side dominates the second in modulus on
    $Gamma(rho)$. Evaluating the residues in the first three variables gives
    #eq(
      $
        K(x)=2 pi^(-3)/(1-x_3)^(2-q) 1/(2 pi i)
        integral_(abs(u_4)=rho)
        frac(
          (1+u_4)^(2q+1) dif u_4,
          ((1-x_3)^q-(x_1+x_2)(1+u_4)^q)^3 u_4^2,
        ) \
        =2 pi^(-3) (1-x_3)^(q-2)
        lr(
          [partial/(partial u_4)
            (1+u_4)^(2q+1) /
            ((1-x_3)^q-(x_1+x_2)(1+u_4)^q)^3]
        )_(u_4=0),
      $,
    ) <eq:bergman-final-residue>
    which yields @eq:bergman-closed-form.
  ]
]
