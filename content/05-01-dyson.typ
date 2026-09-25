#import "index-style.typ": index-mark
#import "statements.typ": proof, remark, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(163, "151")
#heading(level: 3)[
  Computation of Dyson's multidimensional partition function
] <sec:dyson-function>

In #bib-ref("Dyson1962"), which develops a statistical theory of energy levels
for complex nuclear systems, Dyson states the following conjecture (part I, p.
152, Conjecture C).

#theorem[
  Let $a_1, dots, a_n$ be nonnegative integers, with $n>=1$. The constant term
  in the Laurent polynomial #eq(
    $ product_(i,j=1, i!=j)^n lr((1-z_i/z_j))^(a_j) $,
  ) <eq:dyson-product>
  #index-mark([@eq:dyson-product])[Partition function of Dyson]
  in $z_1, dots, z_n$ is #eq(
    $ (a_1+a_2+dots+a_n)!/(a_1!a_2!dots a_n!). $,
  ) <eq:dyson-constant-term>

  #keep-next[For $n=3$ this is equivalent to the general Dixon identity]
  #eq(
    $
      sum_(j in ZZ) (-1)^j binom(a+b, a+j)binom(b+c, b+j)binom(c+a, c+j)
      =(a+b+c)!/(a!b!c!).
    $,
  ) <eq:dixon-general-identity>
  Here $a,b,c>=0$ are integers, and a binomial coefficient is zero when its
  lower index is outside its counting range. For the history, special cases, and
  physical and group-theoretic proofs, see #bib-ref("Dyson1962"), part I, §§5–9
  and pp. 151–153; see also #bib-ref("Gunson1962", "Wilson1962"). Wilson
  #bib-ref(
    "Wilson1962",
  ) and Gunson #bib-ref("Gunson1962") independently proved the conjecture. We
  use the same contour-integral approach, in a form suited to the present
  method.

  #source(164, "152")
] <th:dyson-product>

#proof(title-format: emph, suffix: [.])[
  For $n=1$ both sides are $1$, so assume $n>=2$. The desired constant term is
  the coefficient of $t_1^(a_1) dots t_n^(a_n)$ in #eq(
    $
      G(t)=1/(2pi i)^n integral_(Gamma(rho))
      product_(j=1)^n lr((1-t_j product_(i!=j) lr((1-z_i/z_j))))^(-1)
      (dif z)/(z_1 dots z_n).
    $,
  ) <eq:dyson-generating-integral>
  The positively oriented torus $Gamma(rho)$ is given by $|z_j|=rho_j$, where
  the positive radii are pairwise distinct. Choose $epsilon>0$ sufficiently
  small that, for $max_j |t_j|<=epsilon$, #eq(
    $
      lr(|t_j product_(i!=j) lr((1-z_i/z_j))|)<1,
      quad j=1,dots,n,
    $,
  ) <eq:dyson-convergence-bound>
  uniformly on $Gamma(rho)$. This justifies the geometric expansions and
  termwise integration in @eq:dyson-generating-integral.

  Write $Z=z_1 dots z_n$ and put
  $
    Delta_(n)(z)=product_(i<j)(z_i-z_j)=det(z_i^(n-j)),
    quad Delta_(n-1,j)(z)=product_(i<k, i!=j, k!=j)(z_i-z_k).
  $
  In particular, $product_j Delta_(n-1,j)=Delta_n^(n-2)$, since each pair occurs
  in exactly $n-2$ of the minors. Thus @eq:dyson-generating-integral becomes
  #eq(
    $
      G(t)=1/(2pi i)^n integral_(Gamma(rho))
      (Z^(n-2) dif z)/
      (product_(j=1)^n lr((z_j^(n-1)-t_j product_(i!=j)(z_j-z_i))))
    $,
  ) <eq:dyson-cleared-integral>
  and hence #eq(
    $
      G(t)=1/(2pi i)^n integral_(Gamma(rho))
      ((Z Delta_n)^(n-2) dif z)/
      (product_(j=1)^n lr(
        (z_j^(n-1)Delta_(n-1,j)
          -(-1)^(j-1)t_j Delta_n)
      )).
    $,
  ) <eq:dyson-vandermonde-integral>
  #keep-next[Expansion of the Vandermonde determinant gives]
  #eq(
    $
      sum_(j=1)^n (-1)^(j-1)z_j^(n-1)Delta_(n-1,j)&=Delta_n, \
      product_(j=1)^n (-1)^(j-1)z_j^(n-1)Delta_(n-1,j)
      &=(-1)^(n(n-1)/2)Z^(n-1)Delta_n^(n-2).
    $,
  ) <eq:vandermonde-identities>

  For sufficiently small $t$, the system #eq(
    $
      z_j^(n-1)-t_j product_(i!=j)(z_j-z_i)=0,
      quad j=1,dots,n,
    $,
  ) <eq:dyson-root-system>
  has only the zero $z=0$. Indeed, if $M=max_i |z_i|>0$ and $|z_j|=M$, the $j$th
  equation would imply $M^(n-1)<=|t_j|(2M)^(n-1)$, which is impossible when
  $max_j |t_j|<2^(1-n)$.

  To evaluate the integral, use the polynomial map #eq(
    $
      w_j=f_(j)(z)=(-1)^(j-1)z_j^(n-1)Delta_(n-1,j)(z),
      quad j=1,dots,n.
    $,
  ) <eq:dyson-substitution>
  #source(165, "153")
  Its coordinates satisfy #eq(
    $
        F_(1)(w,z) & =sum_(j=1)^n w_j-Delta_(n)(z)=0, \
      F_(r+1)(w,z) & =sum_(j=1)^n w_j/z_j^r=0,
                     quad r=1,dots,n-1.
    $,
  ) <eq:dyson-implicit-system>
  The first equality is @eq:vandermonde-identities. The others expand
  determinants with two equal columns. Set $d=n(n-1)/2$ and $C_n=d(n-1)!$. The
  Jacobian is
  $
    J(z)=det((partial w)/(partial z))
    =(-1)^n (det F_z)/(det F_w)
    =(-1)^d C_n (Z Delta_n)^(n-2).
  $
  To compute it, regard $w$ and $z$ as independent in $F$ and then set $w=f(z)$.
  The Vandermonde formula gives $det F_w=Delta_n/Z^(n-1)$. Euler's identity and
  @eq:dyson-implicit-system give $F_z z=(-d Delta_n,0,dots,0)^T$. Replacing the
  first column of $F_z$ by this column vector and expanding the remaining minor
  yields
  $
    det F_z=(-1)^n d(n-1)!
    (Delta_n Delta_(n-1,1) product_(j=2)^n w_j)/
    (z_1 product_(j=2)^n z_j^n).
  $
  Substitution of @eq:vandermonde-identities gives the stated $J$. This
  calculation holds for distinct nonzero $z_j$, and the resulting polynomial
  identity extends everywhere. In particular, $J$ does not vanish on
  $Gamma(rho)$.

  Let $Sigma=f_*Gamma(rho)$ denote the image cycle, with its multiplicities and
  orientation. The denominator factors in @eq:dyson-vandermonde-integral equal
  $(-1)^(j-1)(w_j-t_j sum_i w_i)$. Their product sign cancels the sign in $J$,
  so the change of variables gives
  $
    G(t)=1/C_n dot 1/(2pi i)^n integral_Sigma
    (dif w)/(product_(j=1)^n lr((w_j-t_j sum_i w_i))).
  $
  It remains to identify the cycle in the complement of these linear
  hyperplanes. Write $L_(t)(w)=w-t sum_i w_i$. For small $t$, this linear map is
  invertible. By @eq:dyson-convergence-bound, the homotopy $L_(s t)(Sigma)$,
  $0<=s<=1$, never meets a coordinate hyperplane. Its class in
  $H_(n)((CC without {0})^n;ZZ)=ZZ$ is therefore independent of $t$.

  Choose a fixed standard positively oriented torus $gamma(r)$, given by
  $|w_j|=r_j>0$. After decreasing $epsilon$ if necessary, the same homotopy
  argument applies to $L_(s t)(gamma(r))$, whose class is the positive
  generator. Consequently, in the complement of the hyperplanes
  $w_j-t_j sum_i w_i=0$, we have $Sigma ∼ N gamma(r)$ with the same integer $N$
  for every sufficiently small $t$. Hence #eq(
    $
      G(t)=N/C_n dot 1/(2pi i)^n integral_(gamma(r))
      (dif w)/(product_(j=1)^n lr((w_j-t_j (w_1+dots+w_n)))).
    $,
  ) <eq:dyson-covering-integral>
  At $t=0$, @eq:dyson-generating-integral gives $G(0)=1$, and the last
  normalized torus integral is $1$. Thus $N=C_n$ and #eq(
    $
      G(t)=1/(2pi i)^n integral_(gamma(r))
      (dif w)/(product_(j=1)^n lr((w_j-t_j (w_1+dots+w_n)))).
    $,
  ) <eq:dyson-linear-integral>
  Finally, make the linear substitution #eq(
    $ v_j=w_j-t_j (w_1+dots+w_n), quad j=1,dots,n. $,
  ) <eq:dyson-linear-substitution>
  Its determinant is $1-sum_j t_j$, and its image cycle represents the positive
  generator in the complement of the coordinate hyperplanes. We obtain #eq(
    $ G(t)=(1-t_1-t_2-dots-t_n)^(-1). $,
  ) <eq:dyson-generating-function>
  The multinomial expansion proves @eq:dyson-constant-term.
]

#remark(title-format: emph, suffix: [.])[
  This example gives a nontrivial closed-form evaluation of a multiple contour
  integral involving specific symmetric functions. MacMahon emphasized the role
  of symmetric functions in combinatorial enumeration #bib-ref(
    "MacMahon1915",
  ) (see also #bib-ref("Rota1969", "Doubilet1972a")). In our view, further
  #source(166, "154")development and application of these results is largely
  hampered by computational difficulties. Multiple contour integrals of
  symmetric functions also arise when the splitting procedure in
  @sec:splitting-method and @sec:splitting-integrals passes from a contour
  integral to a standard integral of higher dimension.
]
