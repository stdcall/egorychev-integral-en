#import "statements.typ": example, solution
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(167, "155")
#example(title: [])[
  Find the generating function of the binomial coefficient cycles (cf. #bib-ref(
    "Carlitz1965",
    "Riordan1968",
    "Singhal1972",
  )) #eq(
    $
      A_k=A_(k_1,dots,k_n)=binom(k_1+k_2, k_2) dots
      binom(k_(n-1)+k_n, k_n)binom(k_n+k_1, k_1).
    $,
  ) <eq:cyclic-binomial-coefficients>
  Here $n>=2$ and $k_1,dots,k_n>=0$ are integers. The one-variable case is
  $sum_(k>=0)binom(2k, k)t^k=(1-4t)^(-1/2)$.
] <ex:cyclic-binomial-coefficients>

#solution(title-format: emph, suffix: [.])[
  Let $Gamma(rho)={z:|z_j|=rho, j=1,dots,n}$ with $0<rho<1$. Replacing each
  binomial coefficient by $M_1$ in its own variable, we obtain #eq(
    $
      A_k=1/(2pi i)^n integral_(Gamma(rho))
      product_(j=1)^n lr([(1+z_(j-1))(1+z_j)])^(k_j)
      product_(j=1)^n z_(j-1)^(-k_j-1)dif z,
    $,
  ) <eq:cyclic-binomial-integral>
  where subscripts are cyclic: $z_0=z_n$, $t_(n+1)=t_1$. For sufficiently small
  $t=(t_1,dots,t_n)$, summing the geometric series gives #eq(
    $
      F(t) & =sum_(k_1,dots,k_n>=0)A_k t_1^(k_1) dots t_n^(k_n) \
           & =1/(2pi i)^n integral_(Gamma(rho))
             product_(j=1)^n lr([z_j-t_(j+1)(1+z_j)(1+z_(j+1))])^(-1)dif z.
    $,
  ) <eq:cyclic-binomial-generating-integral>
  #keep-next[
    The main theorem of @ch:integral-method[Chapter] expresses this as the
    reciprocal Jacobian at the small common zero:
  ]
  $ F(t)=1/(det H(z^((0))(t))), $
  where
  $
    H(z)=mat(
      1-t_2 (1+z_2), -t_2 (1+z_1), dots, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, dots, 1-t_n (1+z_n), -t_n (1+z_(n-1));
      -t_1 (1+z_n), 0, dots, 1-t_1 (1+z_1)
    ).
  $
  The cyclic matrix has $n$ rows; for $n=2$ its first and last rows are the two
  rows. Only the diagonal and the full cyclic permutation contribute to its
  determinant. Therefore #eq(
    $
      F(t)=lr(
        [
          product_(j=1)^n lr([1-t_j (1+z_j)])
          -product_(j=1)^n t_j (1+z_j)
        ]
      )^(-1) quad "at" z=z^((0))(t).
    $,
  ) <eq:cyclic-binomial-jacobian>
  Here $z^((0))(t)$ is the unique common zero near the origin of
  $
    cases(
      z_1-t_2 (1+z_1)(1+z_2)=0,
      dots.v,
      z_(n-1)-t_n (1+z_(n-1))(1+z_n)=0,
      z_n-t_1 (1+z_n)(1+z_1)=0.
    )
  $

  #source(168, "156")
  Iterated integration in @eq:cyclic-binomial-generating-integral reduces the
  answer to #eq(
    $ F(t)=lr([(a_n-c_n+d_n)^2+4c_n b_n-4a_n d_n])^(-1/2), $,
  ) <eq:cyclic-binomial-closed-form>
  where the coefficients are determined recursively by
  $
    a_1=1, quad b_1=0, quad c_1=d_1=t_1,
  $
  $
    a_k=a_(k-1)-c_(k-1), quad b_k=b_(k-1)-d_(k-1), \
    c_k=t_k a_(k-1), quad d_k=t_k b_(k-1), quad k>=2.
  $
  The branch in @eq:cyclic-binomial-closed-form has value $1$ at $t=0$.

  One can also verify this reduction directly from the Jacobian. At the small
  zero put $x_j=(1+z_j)^(-1)$, $lambda=product_j x_j$ and $T=product_j t_j$.
  Then $x_(j-1)=1-t_j/x_j$ and the Jacobian is $J=lambda-T/lambda$. The matrix
  $
    M_j=mat(1, -t_j; 1, 0)
  $
  maps $(x_j,1)^T$ to $x_j (x_(j-1),1)^T$. Hence $M_1 dots M_n$ has eigenvalue
  $lambda$, determinant $T$, and trace $lambda+T/lambda$. On the other hand, the
  recurrences above give
  $
    mat(a_n, b_n; c_n, d_n)mat(1, -1; 0, 1)
    =mat(1, -1; t_n, 0) dots mat(1, -1; t_1, 0).
  $
  The trace of this product is $a_n-c_n+d_n$, equal to that of $M_1 dots M_n$.
  Thus $J^2=(a_n-c_n+d_n)^2-4T$, and $T=a_n d_n-b_n c_n$. Since $J(0)=1$, this
  proves @eq:cyclic-binomial-closed-form.

  #keep-next[In particular, for $n=2$ and $3$,]
  $
        F(t_1,t_2) & =lr([(1-t_1-t_2)^2-4t_1 t_2])^(-1/2), \
    F(t_1,t_2,t_3) & =lr([(1-t_1-t_2-t_3)^2-4t_1 t_2 t_3])^(-1/2).
  $

  Carlitz #bib-ref("Carlitz1965") gives the equivalent expression, for $n>=3$,
  $
    F(u)=lr((P_n^2-4u_1 Q_n R_n))^(-1/2),
  $
  where
  $
    P_n & =f_(n-1)(u_2,dots,u_n)+u_1 f_(n-3)(u_3,dots,u_(n-1)), \
    Q_n & =f_(n-2)(u_2,dots,u_(n-1)), \
    R_n & =f_(n-2)(u_3,dots,u_n).
  $
  The polynomials $f_n$ are defined by $f_0=1$ and
  $
             f_(1)(u_1) & =1-u_1, quad f_(2)(u_1,u_2)=1-u_1-u_2, \
    f_(n)(u_1,dots,u_n) & =f_(n-1)(u_1,dots,u_(n-1)) \
                        & quad -u_n f_(n-2)(u_1,dots,u_(n-2)), quad n>=2.
  $
  Here $u$ is another name for the generating-function variables, and the
  square-root branch again has value $1$ at the origin.
]
