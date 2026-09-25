#import "statements.typ": example, solution
#import "main-defs.typ": bib-ref, eq, res, source

#heading(level: 2)[Computation of Sums] <sec:sum-computation>
#heading(level: 3)[The linearity rule] <sec:linearity-rule>

#example(title: [])[
  Compute the sum
  $
    S=S_(p,q)=sum_(k=0)^q (-1)^k binom(p, k), quad p>q,
  $
  where $q$ is a nonnegative integer.

  #source(58, "46")
] <ex:alternating-binomial>

#solution[
  By formula $M_(1)(w)$, the linearity rule and the formula for a finite
  geometric sum,
  $
    S & =sum_(k=0)^q (-1)^k res_w (1+w)^p w^(-k-1) \
      & =res_w (1+w)^p lr((sum_(k=0)^q (-w)^(-k)))w^(-1) \
      & =res_w (1+w)^(p-1)lr((1-(-w)^(-q-1))) \
      & =(-1)^q res_w (1+w)^(p-1)w^(-q-1) \
      & =(-1)^q binom(p-1, q).
  $
  #block(sticky: true)[
    The term $(1+w)^(p-1)$ has zero residue. We thus obtain the identity (see
    #bib-ref("Gould1972a"), formula (1.5))
  ]
  #eq(
    $ sum_(k=0)^q (-1)^k binom(p, k)=(-1)^q binom(p-1, q), quad p>q. $,
  ) <eq:alternating-partial-binomial>
]
