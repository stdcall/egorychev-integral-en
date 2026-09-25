#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": example, proof, solution
#import "book-style.typ": keep-together
#import "editorial-notes.typ": editorial-note

#source(66, "54")
#example(title: [])[
  The Stechkin identities: #eq(
    $
      sum_(j_1>=0)dots sum_(j_t>=0)
      sum_(beta_1>=0)dots sum_(beta_t>=0)
      product_(i=1)^t binom(alpha_i, beta_i)binom(r_i-alpha_i, j_i-beta_i) \
      =binom(sum_i alpha_i, q)binom(sum_(i)(r_i-alpha_i), l-q), \
      j_1+dots+j_t=l, quad beta_1+dots+beta_t=q;
    $,
  ) <eq:stechkin-multiple-sum>
  #index-mark([@eq:stechkin-multiple-sum], group: [Identities])[Stechkin]
  #eq(
    $
      sum_(j_1=0)^q sum_(j_2=q)^l
      binom(j_2-j_1, q-j_1)
      binom(r_2-r_1-j_2+j_1, p-r_1-q+j_1) \
      times binom(r_1, j_1)binom(r_2-r_1, j_2-j_1)binom(n-r_2, l-j_2) \
      =binom(p, q)binom(n-p, l-q)binom(r_2-r_1, p-r_1),
    $,
  ) <eq:stechkin-double-sum>
  #index-mark([@eq:stechkin-double-sum], group: [Identities])[Stechkin]
  #eq(
    $
      sum_(i=0)^(r_2-q)(-1)^i
      binom(q+i-r_1, q-r_1)binom(r_2-r_1, q+i-r_1)binom(n-q-i, l-q-i) \
      =binom(n-r_2, l-q)binom(r_2-r_1, q-r_1).
    $,
  ) <eq:stechkin-alternating-sum>
  #index-mark([@eq:stechkin-alternating-sum], group: [Identities])[Stechkin]
  Use nonnegative integer parameters. In @eq:stechkin-multiple-sum, take $t>=1$,
  $0<=alpha_i<=r_i$ and $0<=q<=l$. In @eq:stechkin-double-sum, assume
  $0<=r_1<=p<=r_2<=n$ and $0<=q<=l<=n$; in @eq:stechkin-alternating-sum, assume
  $0<=r_1<=q<=r_2<=n$ and $q<=l<=n$. Binomial factors outside their natural
  range are zero, and a product with such a factor contributes zero.
] <ex:stechkin-multiple-sum>

#proof[
  We prove the more general identity @eq:stechkin-multiple-sum. Write
  $n=sum_i r_i$ and $p=sum_i alpha_i$, and denote its left-hand side by
  $S=S_(n,p,q,l)$. Then
  $
    S & =sum_(j_1,dots,j_t>=0)sum_(beta_1,dots,beta_t>=0)
        res_(tau_1)lr(
          {
            tau_1^(-q-1)product_(i=1)^t res_(z_i)lr(
              (
                (1+z_i tau_1)^(alpha_i)z_i^(-beta_i-1)
              )
            )
          }
        ) \
      & quad times res_(tau_2)lr(
          {
            tau_2^(q-l-1)product_(i=1)^t res_(w_i)lr(
              (
                (1+w_i tau_2)^(r_i-alpha_i)w_i^(beta_i-j_i-1)
              )
            )
          }
        ).
  $
  The variables $tau_1$ and $tau_2$ enforce the constraints $j_1+dots+j_t=l$ and
  $beta_1+dots+beta_t=q$, so the individual indices may range independently from
  zero to infinity.

  Sum successively over $beta_t,dots,beta_1,j_t,dots,j_1$ and use the
  substitution rule for $res$ with respect to the corresponding variables
  $z_t,dots,z_1,w_t,dots,w_1$. This gives
  $
    S & =res_(tau_1 tau_2)lr(
          {
            (1+tau_1)^(sum_i alpha_i)(1+tau_2)^(sum_(i)(r_i-alpha_i))
            tau_1^(-q-1)tau_2^(q-l-1)
          }
        ) \
      & =binom(sum_i alpha_i, q)binom(sum_(i)(r_i-alpha_i), l-q).
  $
  #keep-together[
    The substitutions are finite polynomial operations under the stated
    hypotheses.
  ]

  #source(67, "55")
  Stechkin #bib-ref("Stechkin1975") obtained @eq:stechkin-double-sum and
  @eq:stechkin-alternating-sum as applications of results on enumerating edges
  in an $n$-vertex hypergraph. He observed that suitable choices of the
  parameters recover identities considered in Chapter 1 of Riordan's book
  #bib-ref("Riordan1968").
]

#example(title: [])[
  Computation of sums containing finitely many terms of the harmonic series.
  Compute the sum #eq(
    $
      S_n=sum_(k=1)^(n)(-1)^(k-1)binom(n, k)sum_(j=1)^k frac(1, j),
    $,
  ) <eq:harmonic-binomial-sum>
  where $n>=1$ is an integer.
] <ex:harmonic-binomial-sum>

#solution[
  We have
  $
    S_n=sum_(k=0)^(infinity)(-1)^(k-1)
    res_u frac((1+u)^n, u^(n-k+1))
    lr((sum_(j=1)^k res_v frac(-ln(1-v), v^(j+1)))).
  $
  The $k=0$ inner sum is empty, and the terms with $k>n$ vanish. Summing over
  $j$ and then applying the substitution rule gives
  $
    S_n & =sum_(k=0)^(infinity)(-1)^(k-1)
          res_(u v) frac((1+u)^n, u^(n-k+1))
          lr((-frac(ln(1-v), 1-v)))v^(-k-1) \
        & =res_u frac((1+u)^(n-1)ln(1+u), u^(n+1)).
  $
  In the last residue make the substitution $w=u/(1+u)$, or $u=w/(1-w)$,
  including its derivative $(1-w)^(-2)$. We obtain
  $
    S_n=-res_w frac(ln(1-w), w^(n+1))=frac(1, n).
  $
  Together with @eq:harmonic-binomial-sum, this yields the identity #eq(
    $
      sum_(k=1)^(n)(-1)^(k-1)binom(n, k)sum_(j=1)^k frac(1, j)=frac(1, n).
    $,
  ) <eq:harmonic-binomial-value>
  Kaucký (#bib-ref("Kaucky1975"), pp. 293–297) gives six proofs of
  @eq:harmonic-binomial-value, together with a detailed discussion and history
  (pp. 296–309) of six further identities of this type (see
  @prob:harmonic-identities).
]
