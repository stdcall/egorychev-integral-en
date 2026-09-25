#import "main-defs.typ": bib-ref, source
#import "statements.typ": proof, remark, theorem
#import "editorial-notes.typ": editorial-note

#source(73, "61")
Let
$
  N_3=N_2-N_1+max(abs(a_2), abs(a_5)), quad
  N_4=(a_2-a_5)(m+1)+a_5.
$
For the following rational residue reduction, assume that $N_1$ is a nonnegative
integer and that $a_1,dots,a_6,x$ are fixed as $n$ varies. Put
$
  P(w)=w^(a_5)-x(1+w)^(a_2), quad d=max(a_2, a_5).
$
Initially take $x!=0$, $P(0)!=0$, and $deg P=d$. The sum at $x=0$ is simply
$binom(N_1, N_2)$. For finite $m$, exceptional values at which a root reaches
zero or the degree drops can be treated by continuity of the polynomial
@eq:binomial-parameter-sum, using the combined finite kernel of
@th:binomial-parameter-sum.

#theorem[
  _In the following cases, $S(a,n,x)$ reduces to a number of binomial
  coefficients and residues independent of $n$, at roots of $P$ that are also
  independent of $n$. If the required roots are expressible using the functions
  allowed in @def:closed-form-computability, this gives a computation in closed
  form in that definition's sense._


  *I.* _Let $m=infinity$, $a_2>=0$, $a_5>=0$, and assume an admissible contour
  satisfying @eq:binomial-contour-bound. Any one of the following conditions
  suffices:_

  + $N_2<=a_5-1$;
  + $N_3>a_5$;
  + $N_3<=a_5$, $a_4=0$;
  + $N_3<=a_5$, $a_1=a_4$;
  + $N_3<=a_5$, $a_1=2a_4$, and the only finite nonzero pole of the integrand is
    at $w=1$.

  #block(sticky: true)[
    *II.* _Let $m<infinity$ and $a_2>=a_5>=0$. Any one of the following
    conditions suffices:_
  ]

  + $N_2<=-a_2 m-1$, in which case $S(a,n,x)=0$;
  + $N_3>N_4$, in which case $S(a,n,x)=0$;
  + $N_4>=N_3>a_5$, and $N_2+a_5 m$ is independent of $n$;
  + $N_4>=N_3>a_5$, and $N_4-N_3$ is independent of $n$;
  + $N_4>=N_3>a_5$, $N_4-N_3-N_2-a_5 m$ is independent of $n$, and the only
    finite nonzero pole of the integrand in @eq:binomial-infinite-integral is
    $w=1$;
  + $N_3<=a_5$, $a_4=a_5=0$;
  + $N_3<=a_5$, $a_1=a_4$, $a_2=a_5$;
  + $N_3<=a_5$, $a_1 n+a_(2)(m+1)-2a_4 n-2a_5 m$ is independent of $n$, and the
    integrands in @eq:binomial-finite-integral each have their only finite
    nonzero pole at $w=1$. In addition, assume at least one of $a_4=0$,
    $a_1=a_4$, or $a_1=2a_4$;
  + $N_3<=a_5$, $a_1=2a_4$, $a_2=2a_5$, and the integrands in
    @eq:binomial-finite-integral each have their only finite nonzero pole at
    $w=1$.
] <th:binomial-sum-classification>

#proof[
  Write the two rational integrands, including the scalar in the tail, as
  $
    F_(0)(w) & =frac((1+w)^(N_1) w^(a_5-N_2-1), P(w)), \
    F_(1)(w) & =x^(m+1)
               frac((1+w)^(N_1+a_(2)(m+1))w^(-N_2-a_5 m-1), P(w)).
  $
  The multiplicities and positions of the roots of $P$ are independent of $n$.
  At a nonzero root, the usual residue formula therefore requires only a fixed
  number of differentiations. These produce a fixed number of powers and
  binomial coefficients. The same is true at zero or infinity whenever the pole
  order there is bounded independently of $n$; pole orders at infinity are
  understood for the differential $F(w) dif w$.

  In case I.1, $F_0$ is regular at zero. Rouché's theorem (#bib-ref(
    "Shabat1969",
  ), p. 506), applied to $w^(a_5)$ and $-x(1+w)^(a_2)$, shows that $Gamma$
  encloses exactly $a_5$ roots of $P$, counted with multiplicity. Thus only
  their residues are needed. When $Gamma$ is a circle centered at zero, these
  are the roots of smallest modulus.

  #source(74, "62")
  In case I.2, $F_(0)(w) dif w$ is regular at infinity, since
  $N_1+a_5-N_2-1-d<=-2$. The substitution $w=1/z$ and the residue theorem reduce
  the integral to the residues outside $Gamma$. In I.3 the order at zero is
  fixed, because $N_2=a_6$. In I.4 the order at infinity is fixed, because
  $N_1-N_2=a_3-a_6$. These cases therefore have the required finite reduction.

  #block(sticky: true)[
    For the symmetry cases, a little care with constant shifts is needed. When
    all roots of $P$ are at $1$, the possible triples $(a_2,a_5,x)$ are
  ]
  $
    (0,1,1), quad (1,0,1/2), quad (1,1,1/2), quad (2,1,1/4).
  $
  Indeed, $P(1)=0$ gives $x=2^(-a_2)$. The root is simple unless $a_2=2a_5>0$,
  when its multiplicity is exactly two. Since all roots are at $1$, comparison
  with the degree gives precisely these four possibilities. A root at $-1$ can
  also cancel against the numerator when $a_2=0$. The additional possibility
  with a pole only at $1$ is $(a_2,a_5,x)=(0,2,1)$ and $N_1>=1$; cancel the
  factor $1+w$ first. Thus, up to a constant factor, each differential has the
  form
  $
    frac((1+w)^A w^k, (w-1)^e)dif w, quad e=1 " or " 2,
  $
  with $A$ a nonnegative integer and $k$ an integer.

  For $e=1$, inversion multiplies this differential by $z^(-A-2k-1)$. The
  residues at zero and infinity are equal when $A+2k+1=0$. If $A+2k+1$ is a
  fixed nonzero integer, a fixed number of boundary binomial coefficients must
  instead be retained. To see this, put $B(A,t)=sum_(j=0)^t binom(A, j)$, with
  $B(A,t)=0$ for $t<0$ and $B(A,t)=2^A$ for $t>=A$. Then
  $
    op("Res")_(w=0) frac((1+w)^A w^k, w-1)=-B(A,-k-1).
  $
  Binomial symmetry gives
  $
    2B(2h,h-1)+binom(2h, h)=4^h, quad B(2h+1,h)=4^h.
  $
  A fixed displacement from these middle indices changes only a fixed number of
  terms, independently of $h$.

  The double pole also admits such a reduction. With
  $G(w)=(1+w)^(A+1)w^(k+1)/(w-1)$, differentiation gives
  $
    G'(w)=frac((1+w)^A w^k, (w-1)^2)
    lr(((A+k+1)(w-1)^2+(A+2k)(w-1)-2)).
  $
  #block(breakable: false)[
    The integral of $G'$ around a closed contour is zero. Consequently,
    $
      2 integral frac((1+w)^A w^k, (w-1)^2)dif w
      & = (A+k+1)integral (1+w)^A w^k dif w \
      & quad +(A+2k)integral frac((1+w)^A w^k, w-1)dif w,
    $
  ]
  where all integrals use the same contour, avoiding the poles. The first term
  is a single binomial coefficient after normalization, and the second is the
  simple-pole case. This proves I.5, since $a_1=2a_4$ makes the relevant
  displacement independent of $n$.

  For II.1, every lower index is negative. For II.2, every lower index exceeds
  its nonnegative upper index, because $N_4-N_3=N_1-N_2+(a_2-a_5)m<0$. Hence
  both sums vanish.

  In II.3–II.5, choose a large contour enclosing all finite poles. Since
  $N_3>a_5$, the first integral is zero. The second has a fixed pole order at
  zero in II.3 and at infinity in II.4. In II.5 its displacement from the middle
  binomial index is fixed, so the preceding simple- or double-pole argument
  applies. In II.6 the orders at zero of both integrands are fixed; in II.7
  their orders at infinity are fixed. In II.8 the second integral has a fixed
  middle displacement, while the additional condition controls the first
  integral by I.3, I.4, or the symmetry argument. Finally, II.9 gives a fixed
  middle displacement for both integrands and follows by the same reduction.
]

#remark[
  The theorem applies after further transformations in some cases. For
  nonnegative integer upper indices, the identity $binom(u, v)=binom(u, u-v)$
  replaces $a_5$ by $a_2-a_5$. For a finite sum, replacing $k$ by $m-k$ reverses
  the signs of both slopes and, when $x!=0$, replaces $x$ by $1/x$, with an
  overall factor $x^m$. These transformations can make both slopes nonnegative.
  If $a_5<=a_2$, the resulting finite sum is of type II. If $a_5>a_2$, it is the
  difference of the full sum and its shifted tail, each of type I: the
  large-circle condition holds for both. The theorem still does not include
  every sum that can be computed in closed form.
]
