#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": example, remark, solution
#import "book-style.typ": keep-next

#source(188, "176")
#heading(level: 3)[Computation of sums] <sec:splitting-sums>

The splitting lemma suggests the following practical scheme (compare the order
of steps in @sec:splitting-method). First find an integral representation of the
sum $S(k)$. Use the splitting lemma, if necessary, to replace it by another
integral $R(k)$ with the same value. If the latter can be evaluated as $R'(k)$,
the resulting identity is $S(k)=R'(k)$.

#source(189, "177")
#example(numbered: false)[
  Compute the MacMahon sum #eq(
    $
      S(n)=sum_(k=0)^n binom(n, k)^3 x^k y^(n-k), quad n=0,1,2,dots.
    $,
  ) <eq:weighted-cubic-binomial-sum>
  #index-mark([@eq:weighted-cubic-binomial-sum], group: [Identities])[MacMahon]
  The parameters $x,y$ may be arbitrary complex numbers.
]

#solution[
  We have #eq(
    $
      S(n) & =sum_(k=0)^n binom(n, k)binom(n, n-k)^2 x^k y^(n-k) \
           & =sum_(k=0)^n x^k y^(n-k)res_(z_1 z_2 z_3)
             (1+z_1)^n (1+z_2)^n (1+z_3)^n \
           & quad times z_1^(-k-1)z_2^(-n+k-1)z_3^(-n+k-1),
    $,
  ) <eq:weighted-cubic-residue>
  #eq(
    $
      S(n) & =res_(z_2 z_3)
             frac(((1+z_2)(1+z_3)(y+x z_2 z_3))^n, z_2^(n+1)z_3^(n+1)) \
           & =1/(2 pi i)^3 integral_(gamma times gamma_1)
             frac(
               tau^(-n-1)dif z_2 and dif z_3 and dif tau,
               z_2 z_3-tau(1+z_2)(1+z_3)(y+x z_2 z_3)
             ),
    $,
  ) <eq:weighted-cubic-generating-integral>
  #eq(
    $
      S(n) & =1/(2 pi i)^4 integral_(gamma times gamma_2)
             frac(1, z_2-t_1 (y+x z_2 z_3)) \
           & quad times frac(
               dif z_2 and dif z_3 and dif t_1 and dif t_2,
               (z_3-t_2 (1+z_2)(1+z_3))(t_1 t_2)^(n+1)
             ).
    $,
  ) <eq:weighted-cubic-split-integral>
  Here $gamma$ is a product of small positive circles about the origin in
  $z_2,z_3$. The auxiliary circles $gamma_1$ and $gamma_2$ are chosen
  sufficiently small as in @eq:splitting-contour-bounds and the residue
  evaluations of Theorem @th:splitting-sum-integral[]. The passages to
  @eq:weighted-cubic-generating-integral and @eq:weighted-cubic-split-integral
  use @eq:splitting-one-parameter and @eq:splitting-double-integral,
  respectively.

  Put
  $
    D(t_1,t_2)=lr((1-t_2 (1+t_1 (x+y))))^2-4t_1^2 t_2 x y.
  $
  Choose the holomorphic square root with $sqrt(D(0,0))=1$. Evaluating the inner
  residue in @eq:weighted-cubic-split-integral gives #eq(
    $
      S(n)=1/(2 pi i)^2 integral_(gamma_2)
      frac(D(t_1,t_2)^(-1/2), (t_1 t_2)^(n+1))dif t_1 and dif t_2,
    $,
  ) <eq:weighted-cubic-discriminant-integral>
  #keep-next[and coefficient extraction yields]
  #eq(
    $
      S(n)=sum_(k=0)^(floor(n/2)) (x y)^k (x+y)^(n-2k)
      binom(n, 2k)binom(2k, k)binom(n+k, k).
    $,
  ) <eq:weighted-cubic-half-sum>

  For the residue evaluation, the first denominator in
  @eq:weighted-cubic-split-integral vanishes at $z_2=t_1 y/(1-t_1 x z_3)$. After
  taking its residue, the remaining differential is $frac(dif z_3, Q(z_3))$,
  where
  $
    Q(z) & =-t_1 x (1-t_2)z^2 \
         & quad +(1-t_2 (1+t_1 (y-x)))z-t_2 (1+t_1 y).
  $
  The discriminant of this quadratic is $D$. Its root near zero is simple for
  small $t_1,t_2$, and $Q'$ at that root is the chosen $sqrt(D)$. Thus its
  residue is $D^(-1/2)$. This formula also covers vanishing quadratic
  coefficients by holomorphic continuation near $(t_1,t_2)=(0,0)$.

  To extract the coefficients, expand at the origin:
  $
    D(t_1,t_2)^(-1/2)
    =sum_(j=0)^infinity binom(2j, j)(x y)^j t_1^(2j)t_2^j
    lr((1-t_2 (1+t_1 (x+y))))^(-2j-1).
  $
  Taking the coefficient of $t_1^n t_2^n$ gives @eq:weighted-cubic-half-sum. We
  have therefore obtained MacMahon's identity (#bib-ref("Gould1972a"), (6.7)):
  #eq(
    $
      & sum_(k=0)^n x^k y^(n-k)binom(n, k)^3 \
      & =sum_(k=0)^(floor(n/2)) (x y)^k (x+y)^(n-2k)
        binom(n, 2k)binom(2k, k)binom(n+k, k).
    $,
  ) <eq:weighted-cubic-identity>
]

#remark[
  More generally, consider #eq(
    $
      1/(2 pi i)^2 integral_(gamma_2)
      frac(D(t_1,t_2)^(-alpha/2), t_1^(n+1)t_2^(m+1))
      dif t_1 and dif t_2,
    $,
  ) <eq:weighted-discriminant-coefficient>
  where $alpha=1,2,dots$ and $m,n=0,1,2,dots$. The power is the holomorphic
  branch whose value at the origin is $1$.

  #source(190, "178")
  For $alpha=1$, $x=-y=1$, and $m=n$, formulas
  @eq:weighted-cubic-binomial-sum–@eq:weighted-discriminant-coefficient give
  Dixon's identity (see @sec:independent-indices): #eq(
    $
      sum_(k=0)^n (-1)^k binom(n, k)^3
      =cases(
        0 & "if "n" is odd",
        (-1)^(n/2)binom(n, n/2)binom(3n/2, n) & "if "n" is even".
      )
    $,
  ) <eq:dixon-parity-identity>
  #keep-next[For $alpha=1$ and arbitrary $m,n$, we obtain the generalization]
  #eq(
    $
      & sum_(k=0)^n x^k y^(n-k)binom(n, k)binom(m, n-k)binom(m, k) \
      & =sum_(k=0)^(min(m, floor(n/2))) binom(2k, k)(x y)^k (x+y)^(n-2k)
        binom(m+k, m-k)binom(m-k, n-2k),
    $,
  ) <eq:weighted-mixed-binomial-identity>
  where $m,n=0,1,2,dots$, and binomial coefficients outside their ordinary
  nonnegative range are zero. Indeed, taking $[t_1^n t_2^m]$ in the expansion of
  $D^(-1/2)$ gives the right side of @eq:weighted-mixed-binomial-identity.
  Taking that coefficient in the two geometric factors of
  @eq:weighted-cubic-split-integral, before the $z$ residues, gives the left
  side. For $m=n$, the factors simplify to @eq:weighted-cubic-identity. For
  $x=-y=1$, $D=(1-t_2)^2+4t_1^2 t_2$, so its expansion contains only even powers
  of $t_1$; the even coefficients give @eq:dixon-parity-identity.

  The same specialization, $alpha=1$ and $x=-y=1$, yields identity (6.29) in
  #bib-ref("Gould1972a"). Other parameter choices with $x=-y=1$ give identities
  of the same type (#bib-ref("Gould1972a"), Table 3/0). Further generalizations
  of Dixon's identity are given in #bib-ref("Dyson1962") (see also #bib-ref(
    "Fjeldstad1954",
  ) and #bib-ref("Carlitz1969")).
]
