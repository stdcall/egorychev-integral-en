#import "main-defs.typ": bib-ref, eq, source

#source(99, "87")
#heading(level: 1)[
  Inversion and Classification of Linear Relations in Combinatorial Analysis
] <ch:inverse-relations>
#heading(level: 2, numbering: none)[Introduction] <sec:inversion-introduction>

In combinatorial analysis one often encounters the problem of inverting
(solving) a system of linear relations #eq(
  mark: "*",
  $ a_m=sum_(k>=0)c_(m k)b_k, quad m>=0, $,
) <eq:matrix-transform>
where the entries of the matrix $(c_(m k))$ are expressed in terms of
combinatorial numbers, including binomial coefficients and factorials. Here $m$
and $k$ are multi-indices, and inequalities between them are componentwise. A
typical example is the problem of establishing one-to-one correspondences
between probabilities and moments of discrete distributions (see, for example,
#bib-ref("David1962") and #bib-ref("Takacs1965")).

A large part of Riordan's monograph #bib-ref("Riordan1968") on combinatorial
identities concerns pairs of inverse relations involving binomial coefficients
in one dimension. He describes the state of the problem as follows: “Their
initial attraction is that they offer an alternative in proof of a given
identity associated with a pair, leading to the hope that a large and varied
library of pairs may dispose of an even larger collection of identities. The
hope is not fulfilled; the library grows slowly and the extent of its variety is
hard to determine.”

This chapter presents a solution to the problem posed in #bib-ref("Riordan1968")
of classifying known pairs of inverse combinatorial relations. We obtain an
integral expression for the general matrix entry in a class $F_n^q$ of linear
relations that includes, in particular, the inverse pairs in #bib-ref(
  "Riordan1968",
). We establish the main properties of these matrices and develop a method for
constructing multidimensional analogues of known inverse pairs in combinatorics.
