#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, source

#source(160, "148")
#problem[
  For integers $m,n,p,q>=1$ and $alpha>=0$, consider right-aligned arrays of
  zeros and ones. The rows have lengths $n-j m$ for $0<=j<=floor((n-1)/m)$, with
  $q$ rows of length $n$ and $p+j alpha$ rows of each subsequent length. Entries
  are weakly decreasing along each row and down each column wherever defined.

  #keep-next[
    It is shown in #bib-ref("Church1970") that the number $N=N(m,n,q,p,alpha)$
    of these arrays is
  ]
  $
    N & =1+sum_(s=1)^q binom(n+s-1, s) \
      & quad+sum_(k=2)^(floor((n+m-1)/m)) sum_(s=1)^(p+(k-1)alpha) \
      & quad quad times binom(
          n+s-1-(k-1)(m-p)+binom(k-1, 2)alpha+q-p,
          n-(k-1)m-1
        ).
  $
  Find the generating function and the asymptotic behavior of
  $N(m,n,q,p,alpha)$.
] <prob:binary-staircase-arrays>

#problem[
  The design and analysis of computer algorithms make extensive use of selection
  and ordering, the basic operations of combinatorial analysis. #bib-ref(
    "Knuth1969",
  ) describes algorithms for working with information structures such as arrays,
  lists and trees, for dynamic storage allocation, and for other programming
  tasks. Its estimates of algorithmic efficiency lead to problems involving the
  computation and asymptotic estimation of finite sums with binomial
  coefficients (see, for example, #bib-ref(
    "Knuth1969",
  ), the Preface and §1.2.6).

  Use integral representations of sums to solve the problems on computation and
  asymptotic estimation in the exercises for §§1.1–1.4 and 2.1–2.5, and in
  Answers to Exercises, in #bib-ref("Knuth1969").
] <prob:selection-and-ordering>
