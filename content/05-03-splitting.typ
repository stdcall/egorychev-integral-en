#import "index-style.typ": index-mark
#import "statements.typ": example, proof, remark, solution, theorem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(180, "168")
#heading(level: 2)[The “splitting” method] <sec:splitting-method>
#index-mark([@sec:splitting-method], group: [Methods])[Splitting]
#heading(level: 3)[The main idea of the method] <sec:splitting-idea>

We now describe the splitting method sketched in the introduction to this
chapter. Suppose that a combinatorial expression, such as a finite sum or a
generating function, $S(k)=S(k_1,dots,k_r)$ depends on nonnegative integer
parameters $k_1,dots,k_r$. Proceed as follows.

#keep-next[
  1) Choose an expression $R(p)=R(p_1,dots,p_n)$, with $n>=r$, such that
]
#eq(
  $
    R(k_(i_1),dots,k_(i_n))=S(k_1,dots,k_r),
  $,
) <eq:split-parameter-restriction>
where every $i_j$ belongs to ${1,dots,r}$.

#keep-next[
  2) Find the generating function, or an integral representation of it,
]
#eq(
  $
    P(t)=P(t_1,dots,t_n)=sum_(p in NN^n)R(p_1,dots,p_n)t_1^(p_1) dots t_n^(p_n).
  $,
) <eq:split-generating-function>

#keep-next[
  3) Transform $P(t)$ and expand the resulting expression as a power series:
]
#eq(
  $
    P(t)=sum_(p in NN^n)R'(p_1,dots,p_n)t_1^(p_1) dots t_n^(p_n).
  $,
) <eq:split-alternative-generating-function>
These operations may be formal, or analytic in a neighborhood of the origin.

#keep-next[
  4) Uniqueness of coefficients in @eq:split-generating-function and
  @eq:split-alternative-generating-function gives
]
#eq(
  $
    R(p_1,dots,p_n)=R'(p_1,dots,p_n), quad p_1,dots,p_n>=0.
  $,
) <eq:split-coefficient-identity>

#keep-next[
  5) Set $p_j=k_(i_j)$ in @eq:split-coefficient-identity. By
  @eq:split-parameter-restriction,
]
#eq(
  $
    S(k_1,dots,k_r)=R'(k_(i_1),dots,k_(i_n)).
  $,
) <eq:split-restricted-identity>

#source(181, "169")
#remark[
  Relations of the form
  @eq:split-parameter-restriction–@eq:split-restricted-identity occur in proofs
  of binomial identities, for example in #bib-ref("Carlitz1965") and #bib-ref(
    "Carlitz1969",
  ), where generating functions are used together with properties of binomial
  coefficients. Here we obtain
  @eq:split-parameter-restriction–@eq:split-alternative-generating-function
  using the algorithm of @ch:integral-method[Chapter] for finding integral
  representations of sums. This approach is developed further in
  @sec:splitting-integrals.
]

#example(numbered: false)[
  Compute, for $n>=0$, #eq(
    $
      S(n)=sum_(k=0)^n binom(n, k)^2 binom(3n+k, 2n)
      =sum_(k=0)^n binom(n, k)^2 binom(4n-k, 2n).
    $,
  ) <eq:cubic-binomial-sum>
  The second expression follows by replacing $k$ with $n-k$.
]

#solution[
  Consider the sum #eq(
    $
      R(m,n,p)=sum_(k=0)^(min(m, n))binom(n, k)binom(m, k)
      binom(m+n+p-k, m+n),
    $,
  ) <eq:cubic-binomial-extension>
  #keep-next[where $m,n,p$ are nonnegative integers. Then]
  #eq($ R(n,n,2n)=S(n). $) <eq:cubic-binomial-diagonal>

  Use positively oriented circles with $|z_1|=|z_2|=2$ and $|z_3|=1/2$. The
  coefficient integrals give #eq(
    $
      R(m,n,p) & =sum_(k=0)^infinity 1/(2pi i)^3
                 integral_(|z_1|=2)(1+z_1)^m/z_1^(k+1)dif z_1
                 integral_(|z_2|=2)(1+z_2)^n/z_2^(k+1)dif z_2 \
               & quad times integral_(|z_3|=1/2)
                 (1+z_3)^(m+n+p-k)/z_3^(m+n+1)dif z_3.
    $,
  ) <eq:cubic-binomial-factor-integrals>
  Terms with $k>min(m, n)$ vanish in the first two integrals. The third
  integrand is analytic at $z_3=0$ apart from the displayed monomial pole, even
  when the exponent of $1+z_3$ is negative.

  #keep-next[Put $gamma={z:|z_1|=|z_2|=2, |z_3|=1/2}$. Thus]
  #eq(
    $
      & R(m,n,p) \
      & =1/(2pi i)^3 integral_(gamma)
        (1+z_3)^(m+n+p)(1+z_1)^m (1+z_2)^n z_3^(-m-n-1) \
      & quad times lr(
          (sum_(k=0)^infinity
            (1+z_3)^(-k)(z_1 z_2)^(-k-1))
        )dif z.
    $,
  ) <eq:cubic-binomial-summed-integral>
  The geometric ratio has modulus at most $1/2$, so this series converges
  uniformly absolutely on $gamma$. Its sum is $(1+z_3)/(z_1 z_2 (1+z_3)-1)$.

  #keep-next[
    Introduce two coefficient variables $u,v$, with
    $gamma_2={(u,v):|u|=|v|=1/10}$, and abbreviate
  ]
  $
    a & =1+z_3, quad D=z_1 z_2 a-1, \
    A & =z_3-u(1+z_1)a, quad B=z_3-v(1+z_2)a.
  $
  #keep-next[
    The two additional geometric ratios have modulus at most $9/10$ on these
    contours. Extracting the coefficients of $u^m v^n$ gives
  ]
  #eq(
    $
      R(m,n,p) & =1/(2pi i)^5 integral_(gamma times gamma_2)
                 (a^(p+1)z_3)/(A B D u^(m+1)v^(n+1)) \
               & quad times dif z_1 ∧ dif z_2 ∧ dif z_3 ∧ dif u ∧ dif v.
    $,
  ) <eq:cubic-binomial-extended-integral>

  #source(182, "170")
  Integrate first in $z_1,z_2,z_3$, in that order. The pole $z_1=1/(z_2 a)$ lies
  inside $|z_1|=2$, whereas the zero of $A$ lies outside: its modulus is at
  least $7/3$. The first residue of the kernel $a^(p+1)z_3/(A B D)$ is
  $
    (a^p z_3)/((z_2 (z_3-u a)-u)(z_3-v a-v a z_2)).
  $
  The pole $z_2=u/(z_3-u a)$ has modulus at most $2/7$; the other pole again has
  modulus at least $7/3$. The second residue is
  $
    (a^p z_3)/((z_3-u a)(z_3-v a)-u v a)
    =a^p/(z_3-a(u+v-u v)).
  $
  Finally, put $h=u+v-u v$. Since $|h|<=21/100$, the pole $z_3=h/(1-h)$ has
  modulus at most $21/79<1/2$. Its residue is
  $(1-h)^(-p-1)=(1-u)^(-p-1)(1-v)^(-p-1)$. Consequently, #eq(
    $
      R(m,n,p) & =1/(2pi i)^2 integral_(gamma_2)
                 (1-u)^(-p-1)(1-v)^(-p-1)u^(-m-1)v^(-n-1)dif u ∧ dif v \
               & =binom(m+p, m)binom(n+p, n).
    $,
  ) <eq:cubic-binomial-value>

  #keep-next[
    Comparing @eq:cubic-binomial-extension and @eq:cubic-binomial-value gives
    Carlitz's identity (#bib-ref("Carlitz1969"), p. 380):
  ]
  #eq(
    $
      sum_(k=0)^(min(m, n))binom(n, k)binom(m, k)binom(m+n+p-k, m+n)
      =binom(m+p, m)binom(n+p, n).
    $,
  ) <eq:carlitz-product-identity>
  #index-mark([@eq:carlitz-product-identity], group: [Identities])[Carlitz]
  #keep-next[
    By @eq:cubic-binomial-diagonal, this gives the required value of $S(n)$ and
    the identity (#bib-ref("Gould1972a"), (6.37))
  ]
  #eq(
    $
      sum_(k=0)^n binom(n, k)^2 binom(3n+k, 2n)=binom(3n, n)^2.
    $,
  ) <eq:cubic-binomial-diagonal-value>

  #metadata((kind: "index-anchor")) <idx:shoo-splitting>
  #index-mark([@idx:shoo-splitting], group: [Identities])[Le-Jen Shoo]
  #block(breakable: false)[
    Taking $R(m,m,n)$ in @eq:carlitz-product-identity gives another proof of the
    identity of Le-Jen Shoo:#footnote[
      A history of the question and several proofs appear in #bib-ref(
        "Kaucky1975",
      ). In #bib-ref("Takacs1973"), Takács surveys generalizations of the
      identity, which he calls the Shih-Chieh Chu identity.
    ]

    $
      sum_(k=0)^m binom(m, k)^2 binom(n+2m-k, 2m)=binom(m+n, n)^2.
    $
  ]
  This proof uses integral representation and splitting; compare the proof of
  the same identity in @sec:sum-computation.
]

#heading(level: 3)[
  A theorem on the generating function for a subsequence of a multiple sequence
] <sec:diagonal-generating-functions>

#theorem[
  Suppose that the generating function #eq(
    $
      P(t)=sum_(p in NN^n)R(p_1,dots,p_n)t_1^(p_1) dots t_n^(p_n)
    $,
  ) <eq:diagonal-parent-series>
  is holomorphic in a neighborhood of the closed polydisc
  $
    overline(V)_(1)(rho_1)={t:|t_j|<=rho_1, j=1,dots,n}, quad rho_1>0.
  $
  Its skeleton is $Gamma_(1)(rho_1)={t:|t_j|=rho_1, j=1,dots,n}$. Let $1<=r<=n$
  and $0=j_0<j_1<dots<j_r=n$. Define $b_i=j_i-j_(i-1)$.

  #keep-next[Then the generating function]
  #eq(
    $
      Q(z)=sum_(k in NN^r)S(k_1,dots,k_r)z_1^(k_1) dots z_r^(k_r)
    $,
  ) <eq:diagonal-restricted-series>
  #source(183, "171")
  #keep-next[of the subsequence specified by]
  #eq(
    $
      R(underbrace(k_1 comma dots comma k_1, b_1 " times"),dots,
        underbrace(k_r comma dots comma k_r, b_r " times"))=S(k_1,dots,k_r)
    $,
  ) <eq:diagonal-coefficient-restriction>
  has the following integral representations: #eq(
    $
      Q(z)=1/(2pi i)^n integral_(Gamma_(1)(rho_1))P(t)
      product_(i=1)^r lr((product_(s=j_(i-1)+1)^(j_i)t_s-z_i))^(-1)dif t.
    $,
  ) <eq:diagonal-integral>
] <th:diagonal-parent-series>
#index-mark([@th:diagonal-parent-series], group: [Theorems], after: [On
  residues])[On a generating function for a subsequence]

For the second representation, set $a_i=j_(i-1)+1$ and
$B={1,dots,n} without {a_1,dots,a_r}$. In each block, replace its first
coordinate by
$
  hat(t)_(a_i)=z_i product_(s=a_i+1)^(j_i)t_s^(-1), quad
  hat(t)_s=t_s " for " s in B.
$
#keep-next[Then]
#eq(
  $
    Q(z)=1/(2pi i)^(n-r)integral_(Gamma'_(1)(rho_1))
    P(hat(t))lr((product_(s in B)t_s^(-1)))dif t_B,
  $,
) <eq:diagonal-reduced-integral>
where $Gamma'_(1)(rho_1)={t_B:|t_s|=rho_1, s in B}$ and $dif t_B$ is the ordered
product of the differentials for the remaining coordinates. All circles are
positively oriented. Both formulas hold for
$
  z in V_(2)(rho_2)={z:|z_i|<rho_2, i=1,dots,r}, quad
  0<rho_2<min(rho_1, rho_1^n).
$
Empty products are $1$. If $r=n$, @eq:diagonal-reduced-integral is the
evaluation $Q(z)=P(z)$, with no integral remaining.

#proof[
  By the computation scheme in @sec:computation-algorithm, #eq(
    $
      Q(z) & =sum_(k in NN^r)z^k R(k_1,dots,k_1,dots,k_r,dots,k_r) \
           & =sum_(k in NN^r)z^k 1/(2pi i)^n integral_(Gamma_(1)(rho_1))P(t)
             product_(i=1)^r product_(s=a_i)^(j_i)t_s^(-k_i-1)dif t \
           & =1/(2pi i)^n integral_(Gamma_(1)(rho_1))P(t)
             lr(
               (sum_(k in NN^r)z^k
                 product_(i=1)^r product_(s=a_i)^(j_i)t_s^(-k_i-1))
             )dif t.
    $,
  ) <eq:diagonal-integral-derivation>
  Indeed, $rho_2<rho_1^(b_i)$ for every block. Each geometric ratio
  $z_i/(product_(s=a_i)^(j_i)t_s)$ is uniformly bounded in modulus by a constant
  less than $1$, justifying termwise integration. Summing those series gives
  @eq:diagonal-integral.

  For fixed remaining coordinates, the pole in $t_(a_i)$ is $hat(t)_(a_i)$,
  whose modulus is less than $rho_1$. Cauchy's formula in these $r$ coordinates
  evaluates $P$ at $hat(t)$ and contributes the factor
  $product_(s in B)t_s^(-1)$. This gives @eq:diagonal-reduced-integral. The same
  uniform bounds show that $Q$ is holomorphic in $V_(2)(rho_2)$.

  #source(184, "172")
]

#remark[
  If either integral in @eq:diagonal-integral or @eq:diagonal-reduced-integral
  can be evaluated directly, then $S(k)$ can be found by expanding $Q(z)$. In
  that case steps 4) and 5) of the splitting method may be bypassed.

  For $n=2$ and $r=1$, these formulas give the generating function of the
  diagonal sequence ${f(k,k)}_(k>=0)$ in terms of that of the double sequence
  ${f(m,n)}_(m,n>=0)$. This case was obtained in #bib-ref("Hautus1971"), Theorem
  1, as a generalization of the Hadamard product in connection with certain
  difference equations.
]
