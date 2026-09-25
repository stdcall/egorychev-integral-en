#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "main-defs.typ": bib-ref, source

#source(121, "109")
#problem[
  Let $q$ be a positive integer, and let $r$ and $s$ be real numbers with $r>=0$
  and $s>-1$. Linear relations of the form
  $
    a_m=sum_(k=0)^(m q)b_k
    frac(
      (m q)!(k+r+s k),
      (m q-k)!(m q+r)(m q+r+s)dots(m q+r+s k)
    ),
    quad m=0,1,dots,
  $
  are called relations of type $P(q,r,s)$. The coefficient for $m=k=0$ is
  interpreted as $1$, including when $r=0$. The familiar methods of summing
  divergent series due to de la Vallée-Poussin, Obreshkov, Cesàro, Euler, and
  others are all of type $P(q,r,s)$ for particular values of the parameters.

  #block(sticky: true)[
    a) Show that #bib-ref("Egorychev1974c") the method $P(1,r,s)$ is of type
    $F_1^1$ with
  ]
  $
    phi(w)=(1-s Z)^(-r/s), quad
    f_(1)(w)=(1-s Z)^(-(s+1)/s), quad psi_(1)(w)=1,
  $
  where $Z=Z(w)$ is the local inverse defined by
  $
    w=Z(1-s Z)^(1/s), quad Z(0)=0,
  $
  and all powers have value $1$ at $Z=0$. At $s=0$, use the limiting formulas
  $ w=Z e^(-Z), quad phi(w)=e^(r Z), quad f_(1)(w)=e^Z. $
  The coefficient weights are
  $
    alpha_m=frac((m+r)(m+r+s)dots(m+r+s(m-1)), m!),
    quad m=1,2,dots,
  $
  with $alpha_0=1$ and $beta_k=1$.

  b) Find #bib-ref("Egorychev1974c") the inverse of a matrix of type $P(1,r,s)$,
  and write an identity for the general entry of the product of these matrices.

  #block(sticky: true)[
    c) Prove the identity #bib-ref("Egorychev1974c")
  ]
  $
    sum_(k=0)^(m q)frac(
      (m q)!(k+r+s k),
      (m q-k)!(m q+r)(m q+r+s)dots(m q+r+s k)
    )=1.
  $

  d) Give #bib-ref("Egorychev1974c") a combinatorial interpretation of the
  identities in b) and c) in terms of particles arranged among cells.
] <prob:summation-relations>
#index-mark([@prob:summation-relations], group: [Pairs of inverse linear
  relations])[Type $P(q,r,s)$]
