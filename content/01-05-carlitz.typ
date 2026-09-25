#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, res, source
#import "statements.typ": lemma, remark, theorem
#import "book-style.typ": keep-next

#source(40, "28")
#heading(level: 3)[
  A multiple summation formula of Carlitz
] <sec:carlitz-multiple-sum>
#index-mark([@sec:carlitz-multiple-sum], group: [Identities])[Carlitz]

#theorem(suffix: [])[
  #bib-ref("Carlitz1974").
  _Let $alpha_j$ and $a_(i j)$, $i,j=1,dots,n$, be complex numbers. For $x$ in a
  sufficiently small neighborhood of the origin, the following summation formula
  holds:_
  #eq(
    $
      sum_(k_1=0)^infinity dots sum_(k_n=0)^infinity
      lr(
        {product_(j=1)^n
          (x_j exp(-sum_(i=1)^n a_(i j) x_i))^(k_j)
          (alpha_j+sum_(i=1)^n k_i a_(j i))^(k_j)/(k_j!)}
      ) \
      =exp(alpha_1 x_1+dots+alpha_n x_n) \
      quad times mat(
        delim: "|",
        1-a_(11)x_1, -a_(12)x_1, dots.h, -a_(1n)x_1;
        -a_(21)x_2, 1-a_(22)x_2, dots.h, -a_(2n)x_2;
        dots.v, dots.v, dots.down, dots.v;
        -a_(n 1)x_n, -a_(n 2)x_n, dots.h, 1-a_(n n)x_n;
      )^(-1).
    $,
  ) <eq:carlitz-multivariate-identity>
] <th:carlitz-multivariate-identity>

#keep-next[
  The identity @eq:carlitz-multivariate-identity follows from
  @eq:lagrange-summation by writing its coefficients in the form
]
#eq(
  $
    product_(j=1)^n (alpha_j+sum_(i=1)^n k_i a_(j i))^(k_j)/(k_j!) \
    =product_(j=1)^n lr(
      {res_(z_j) z_j^(-k_j-1)
        exp(z_j (alpha_j+sum_(i=1)^n k_i a_(j i)))}
    ) \
    =res_(z_1 dots z_n) lr(
      {exp(alpha_1 z_1+dots+alpha_n z_n)
        lr(
          (product_(j=1)^n z_j^(-k_j-1)
            exp(k_j sum_(i=1)^n a_(i j) z_i))
        )}
    )
  $,
) <eq:carlitz-coefficient-residue>
and computing the Jacobian. The following elementary determinant identity is
also useful.


#lemma[
  _If $Delta_n$ is the determinant_
  #eq(
    $
      Delta_n=mat(
        delim: "|",
        1+alpha_1, 1, dots.h, 1;
        1, 1+alpha_2, dots.h, 1;
        dots.v, dots.v, dots.down, dots.v;
        1, 1, dots.h, 1+alpha_n;
      ),
    $,
  ) <eq:carlitz-determinant>
  _where $alpha_1,dots,alpha_n$ are arbitrary complex numbers, then_
  #eq(
    $
      Delta_n=alpha_1 dots alpha_n
      (1+alpha_1^(-1)+dots+alpha_n^(-1)).
    $,
  ) <eq:carlitz-determinant-value>
  When some $alpha_j=0$, formula @eq:carlitz-determinant-value is interpreted
  after expanding the product and cancelling the inverse factors.
] <lem:carlitz-determinant>

#remark(title: [Remark on the proof of @th:carlitz-multivariate-identity])[
  Formula @eq:carlitz-multivariate-identity was obtained in #bib-ref(
    "Carlitz1974",
  ) by elementary means, using MacMahon's master theorem. The #source(
    41,
    "29",
  )method of integral representation reduces the proof to
  @eq:carlitz-coefficient-residue and an application of @rule:lagrange-summation
  for $res$. If we express the computations using contour integrals instead of
  $res$ in @eq:carlitz-coefficient-residue, we recover the same computational
  scheme that Good used in #bib-ref("Good1962b") to prove MacMahon's master
  theorem.
]
