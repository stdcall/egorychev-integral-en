#import "statements.typ": example, exercise, remark
#import "book-style.typ": keep-next
#import "editorial-notes.typ": editorial-note
#import "main-defs.typ": bib-ref, eq, res, source

#example(numbered: false, name: [solution of a recurrence])[
  Consider the relations #eq(
    $ a_n-beta a_(n-1)-gamma a_(n-2)=0, quad n=2,3,dots, $,
  ) <eq:linear-recurrence>
  for a sequence $lr({a_n})$, $n=0,1,dots$, with initial conditions #eq(
    $ a_0=alpha_0, quad a_1=alpha_1. $,
  ) <eq:recurrence-initial-data>
  Seek a solution in the form #eq(
    $ a_n=res_w A(w)w^(-n-1). $,
  ) <eq:recurrence-coefficient>
  Then
  $
    res_w A(w)w^(-n-1)-beta res_w A(w)w^(-n)
    -gamma res_w A(w)w^(-n+1)=0,
  $
  or #eq(
    $ res_w A(w)(1-beta w-gamma w^2)w^(-n-1)=0, quad n=2,3,dots. $,
  ) <eq:recurrence-residue>
  #source(48, "36")
  To include the initial conditions @eq:recurrence-initial-data, compute the
  coefficients with $n=0$ and $n=1$ separately. Together with
  @eq:recurrence-residue, they give
  $
    res_w A(w)(1-beta w-gamma w^2)w^(-n-1) \
    =res_w (alpha_0+w(alpha_1-alpha_0 beta))w^(-n-1),
    quad n=0,1,dots,
  $
  or, equivalently, #eq(
    $ A(w)(1-beta w-gamma w^2)=alpha_0+(alpha_1-alpha_0 beta)w. $,
  ) <eq:recurrence-generating-function>
  #keep-next[
    Factor $1-beta w-gamma w^2=(1-x_1 w)(1-x_2 w)$. For $x_1!=x_2$,
    @eq:recurrence-generating-function gives
  ]
  #eq(
    $
      a_n=res_w A(w)w^(-n-1) \
      =frac(alpha_1-beta alpha_0, x_1-x_2)(x_1^n-x_2^n)
      +frac(alpha_0, x_1-x_2)(x_1^(n+1)-x_2^(n+1)).
    $,
  ) <eq:recurrence-solution>
  For repeated roots $x_1=x_2=r$, each quotient $(x_1^m-x_2^m)/(x_1-x_2)$ is
  interpreted by its polynomial continuation: $m r^(m-1)$ for $m>=1$, and $0$
  for $m=0$.
]

#remark[
  The same solution follows by multiplying @eq:linear-recurrence by $w^n$ and
  summing over $n$, or by working in the algebra of sequences, as in #bib-ref(
    "Riordan1958",
  ), pp. 26–27. These methods lead to the representation
  @eq:recurrence-coefficient, which can also be written as a contour integral of
  the rational function $A(w)$. Using $res$ and its operational rules
  illustrates, in this elementary example, Cauchy's idea of solving differential
  and difference equations by contour integrals #bib-ref("Efros1937").
]

#exercise[
  Starting from the recurrence defining the Fibonacci numbers,
  $
    F_(n+1)=F_n+F_(n-1), quad n>=1, quad F_0=F_1=1,
  $
  find their generating function and an explicit expression for them. Compare
  the solution in #bib-ref("Andrews1975"), obtained using Cauchy's residue
  theorem.
]
