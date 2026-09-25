#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": corollary, proof, theorem
#import "book-style.typ": keep-next

#source(190, "178")
#heading(level: 2)[New identities] <sec:new-identities>

New identities arise throughout this book: in §@sec:sum-computation, when
computing one-dimensional sums; in §@sec:binomial-sum-classification, when
classifying sums of binomial coefficients; in
§§@sec:matrix-inversion–@sec:multivariate-inversion, through inversion and
generalization of linear relations; in §§@sec:identity-interpretations and
@sec:enumeration-integrals, when solving enumeration problems; in
§@sec:linear-constraints, for sums with linear constraints; and in
§@sec:splitting-integrals, through splitting.

From the generating-function viewpoint, an identity equates the coefficients of
like monomials in two expressions for the same generating function. Both
generating functions and residue theory provide new, sometimes deep, functional
relations. Examples may be found in #bib-ref("Riordan1968"), #bib-ref(
  "Gould1972a",
) and #bib-ref("Kaucky1975"), which contain many identities involving binomial
coefficients, and, for residue theory, in #bib-ref("Gelfond1966").

Our main concern is the broader problem of finding integral representations for
sums arising in combinatorial practice, and of computing #source(191, "179")and
estimating these sums. Such computations can also reveal nontrivial
generalizations and lead to their combinatorial interpretations. Sections
@sec:unbounded-szego-kernels and @sec:solvable-polynilpotent-ranks illustrate
this possibility.

Here we first give new proofs of two identities from graph theory. Examining the
steps in which the identities emerge then leads to two new identities. The
multidimensional analogue of @eq:liskovets-identity in the following theorem
uses the proof scheme of §@sec:univariate-inversion.

#heading(level: 3)[
  An infinite system of linear equations with binomial coefficients in graph
  theory
] <sec:multivariate-liskovets>

Let $n>=1$ be an integer, and let $m=(m_1,dots,m_n)$, $t=(t_1,dots,t_n)$,
$k=(k_1,dots,k_n)$ and $r=(r_1,dots,r_n)$, with $abs(m)=m_1+dots+m_n$, and
similarly for the other multi-indices. In the multinomial notation below,
$
  binom(N, d_1, dots, d_n)
  =frac(N!, (N-abs(d))! product_(i=1)^n d_i!),
  quad d_i>=0, quad abs(d)<=N.
$
Thus the unlisted part is $N-abs(d)$.

#theorem[
  _For every fixed $k$ with nonnegative integer components, the system_
  #eq(
    $
      sum_(t_1=1)^(m_1) dots sum_(t_n=1)^(m_n)
      binom(abs(m)-1, m_1-t_1, dots, m_n-t_n)
      abs(m)^(abs(m)-abs(t)) tilde(f)_(k)(t) \
      =abs(m)^(abs(m)+abs(k)), quad m_1,dots,m_n=1,2,dots,
    $,
  ) <eq:multivariate-liskovets-system>
  #keep-next[_has a unique solution, given by_]
  #eq(
    $
      tilde(f)_(k)(t)
      =sum_(r_1=1)^(t_1) dots sum_(r_n=1)^(t_n) (-1)^(abs(t)-abs(r)) \
      times binom(abs(t), t_1-r_1, dots, t_n-r_n)
      abs(r)^(abs(t)+abs(k)), quad t_1,dots,t_n>=1.
    $,
  ) <eq:multivariate-liskovets-solution>
] <th:multivariate-liskovets-system>

#corollary[
  The following identity holds: #eq(
    $
      & sum_(t_1=1)^(m_1) dots sum_(t_n=1)^(m_n)
        sum_(r_1=1)^(t_1) dots sum_(r_n=1)^(t_n)
        (-1)^(abs(t)-abs(r)) frac(abs(r)^(abs(t)+abs(k)), abs(m)^(abs(t))) \
      & quad times binom(abs(m)-1, m_1-t_1, dots, m_n-t_n)
        binom(abs(t), t_1-r_1, dots, t_n-r_n) \
      & =abs(m)^(abs(k)), quad k_1,dots,k_n>=0, quad m_1,dots,m_n>=1.
    $,
  ) <eq:multivariate-liskovets-identity>
  For $n=1$, this is @eq:liskovets-identity after expanding the DeMorgan number.
]

#source(192, "180")
#proof(title: [Proof of @th:multivariate-liskovets-system])[
  The coefficient of $tilde(f)_(k)(m)$ in @eq:multivariate-liskovets-system is
  $1$; every other term has $abs(t)<abs(m)$. Induction on $abs(m)$ therefore
  gives existence and uniqueness. To find the solution, rewrite the system as
  #eq(
    $
      sum_(t_1=1)^(m_1) dots sum_(t_n=1)^(m_n)
      frac(tilde(f)_(k)(t), (abs(t)-1)!)
      product_(i=1)^n frac(abs(m)^(m_i-t_i), (m_i-t_i)!) \
      =frac(abs(m)^(abs(m)+abs(k)), (abs(m)-1)!), quad m_1,dots,m_n>=1.
    $,
  ) <eq:multivariate-liskovets-normalization>
  #keep-next[
    Denote its left side by $S_m$, and introduce the formal series
  ]
  #eq(
    $
      F(w)=sum_(t_1=1)^infinity dots sum_(t_n=1)^infinity
      frac(tilde(f)_(k)(t), (abs(t)-1)!) product_(i=1)^n w_i^(t_i).
    $,
  ) <eq:multivariate-liskovets-generating>
  #keep-next[In the summand we use]
  $
    frac(abs(m)^(m_i-t_i), (m_i-t_i)!)
    =res_(z_i) e^(abs(m)z_i) z_i^(-m_i+t_i-1), \
    frac(tilde(f)_(k)(t), (abs(t)-1)!)
    =res_w F(w) product_(i=1)^n w_i^(-t_i-1).
  $
  Put $s=s(z)=z_1+dots+z_n$. Terms with some $t_i>m_i$ have zero residue, so the
  finite sums may be extended to all positive $t_i$. The substitution rule gives
  #eq(
    $
      S_m & =sum_(t_1=1)^infinity dots sum_(t_n=1)^infinity
            lr((res_w F(w) product_(i=1)^n w_i^(-t_i-1))) \
          & quad times product_(i=1)^n lr(
              (
                res_(z_i) e^(abs(m)z_i)
                z_i^(-m_i+t_i-1)
              )
            ) \
          & =res_z e^(abs(m)s) lr((product_(i=1)^n z_i^(-m_i-1))) \
          & quad times sum_(t_1=1)^infinity dots sum_(t_n=1)^infinity
            lr((product_(i=1)^n z_i^(t_i)))
            res_w F(w) product_(i=1)^n w_i^(-t_i-1) \
          & =res_z F(z) product_(i=1)^n lr((e^(m_i s)z_i^(-m_i-1))).
    $,
  ) <eq:multivariate-liskovets-residue>
  #keep-next[
    Make the change of variables $w_i=z_i e^(-s)$, $i=1,dots,n$. Its Jacobian is
  ]
  $
    frac(∂ w, ∂ z)=e^(-n s)det(δ_(i j)-z_i)_(i,j=1)^n
    =(1-s)e^(-n s).
  $
  The map has identity linear part and a unique formal inverse $z=z(w)$. The
  exponential factors cancel in the transformed differential, giving #eq(
    $
      S_m=res_w frac(F(z(w)), 1-s(z(w)))
      product_(i=1)^n w_i^(-m_i-1), quad m_1,dots,m_n>=1.
    $,
  ) <eq:multivariate-liskovets-transformed>

  #source(193, "181")
  Comparing @eq:multivariate-liskovets-normalization with
  @eq:multivariate-liskovets-transformed yields
  $
    frac(F(z), 1-s)
    =lr(
      [sum_(r_1=1)^infinity dots sum_(r_n=1)^infinity
        frac(abs(r)^(abs(r)+abs(k)), (abs(r)-1)!)
        product_(i=1)^n w_i^(r_i)]
    )|_(w_i=z_i e^(-s)).
  $
  Both series are divisible by the product of their variables, and the inverse
  substitution preserves this property. Thus their positive-index coefficients
  determine the full series. Equivalently, #eq(
    $
      & frac(tilde(f)_(k)(t), (abs(t)-1)!) \
      & =res_z F(z) product_(i=1)^n z_i^(-t_i-1) \
      & =res_z (1-s)
        lr(
          (
            sum_(r_1=1)^infinity dots sum_(r_n=1)^infinity
            frac(abs(r)^(abs(r)+abs(k)), (abs(r)-1)!)
            product_(i=1)^n lr((z_i^(r_i)e^(-r_i s)))
          )
        ) \
      & quad times product_(i=1)^n z_i^(-t_i-1) \
      & =sum_(r_1=1)^(t_1) dots sum_(r_n=1)^(t_n)
        frac(abs(r)^(abs(r)+abs(k)), (abs(r)-1)!) \
      & quad times res_z (1-s)e^(-abs(r)s)
        product_(i=1)^n z_i^(r_i-t_i-1).
    $,
  ) <eq:multivariate-liskovets-inversion>
  To evaluate the last residue, put $R=abs(r)>0$, $d_i=t_i-r_i$ and
  $D=abs(t)-R$. The exponential series gives
  $
    [z_1^(d_1) dots z_n^(d_n)](1-s)e^(-R s)
    =frac((-R)^D, product_(i=1)^n d_i!) lr((1+frac(D, R)))
    =frac(abs(t)(-R)^D, R product_(i=1)^n d_i!).
  $
  Substitution in @eq:multivariate-liskovets-inversion gives
  @eq:multivariate-liskovets-solution after cancelling factorials. Substituting
  this solution in @eq:multivariate-liskovets-system and dividing by
  $abs(m)^(abs(m))$ proves @eq:multivariate-liskovets-identity.
]
