#import "index-style.typ": index-mark
#import "statements.typ": example, solution
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(166, "154")
#heading(level: 3)[Other sums] <sec:other-multiple-sums>

We evaluate five more known multidimensional sums by a similar method. Carlitz
obtained many binomial identities through analytic and combinatorial arguments
(see the survey #bib-ref("Carlitz1969")). His calculations combine properties of
binomial coefficients with operations on a broad class of generating functions.

#example(title: [])[
  Find a closed form for the generating function of the double sequence (cf.
  #bib-ref("Carlitz1969"), p. 379) #eq(
    $ A_(j k)(alpha,beta)=binom(alpha+j+k, j)binom(beta+j+k, k). $,
  ) <eq:carlitz-double-coefficients>
  #index-mark([@eq:carlitz-double-coefficients], group: [Identities])[Carlitz]
  Here $j,k>=0$ are integers and $alpha,beta$ are fixed complex parameters.
] <ex:carlitz-double-coefficients>

#solution(title-format: emph, suffix: [.])[
  Apply $M_(1)(z_1)$ and $M_(1)(z_2)$ from #link(<app:table-m>)[Table M] and the
  main theorem of @ch:integral-method[Chapter], with $m_1=m_2=1$. For $0<rho<1$
  and sufficiently small $u,v$, #eq(
    $
      F_(alpha beta)(u,v) & =sum_(j,k=0)^infinity A_(j k)(alpha,beta)u^j v^k \
                          & =sum_(j,k>=0) u^j v^k
                            1/(2pi i) integral_(|z_1|=rho)
                            (1+z_1)^(alpha+j+k)z_1^(-j-1)dif z_1 \
                          & quad times 1/(2pi i) integral_(|z_2|=rho)
                            (1+z_2)^(beta+j+k)z_2^(-k-1)dif z_2 \
                          & =1/(2pi i)^2
                            integral_(|z_1|=rho) integral_(|z_2|=rho)
                            ((1+z_1)^alpha (1+z_2)^beta)/(w_1 w_2)dif z \
                          & =lr(
                              [((1+z_1)^alpha (1+z_2)^beta)/
                                (det((partial(w_1, w_2))/(partial(z_1, z_2))))]
                            )_(z=z^((0))).
    $,
  ) <eq:carlitz-double-integral>
  The powers use the branches analytic near $z_1=z_2=0$. The sum of the two
  geometric series gives the denominators #eq(
    $
      w_1 & =z_1-u(1+z_1)(1+z_2), \
      w_2 & =z_2-v(1+z_1)(1+z_2).
    $,
  ) <eq:carlitz-double-substitution>
  #keep-next[
    Put $A=sqrt((1-u-v)^2-4u v)$, choosing the analytic branch with $A(0,0)=1$.
    The small common zero is
  ]
  $
    z_1^((0)) & =(1-u-v-A)/(2v)= (2u)/(1-u-v+A), \
    z_2^((0)) & =(1-u-v-A)/(2u)= (2v)/(1-u-v+A).
  $
  The rationalized expressions also define the values when $u=0$ or $v=0$.
  #source(167, "155")
  This is the unique common zero near the origin for sufficiently small $u,v$.
  The Jacobian is $1-u(1+z_2)-v(1+z_1)$, which equals $A$ at that zero.
  Moreover,
  $
    1+z_1^((0))=2/(1-u+v+A), quad
    1+z_2^((0))=2/(1-v+u+A).
  $
  Consequently @eq:carlitz-double-integral gives #eq(
    $
      F_(alpha beta)(u,v)=2^(alpha+beta)A^(-1)
      (1-u+v+A)^(-alpha)(1-v+u+A)^(-beta),
    $,
  ) <eq:carlitz-double-generating-function>
  with all branches normalized to give $F_(alpha beta)(0,0)=1$. This agrees with
  Carlitz's result.
]
