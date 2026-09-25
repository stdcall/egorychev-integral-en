#import "statements.typ": proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(153, "141")
#heading(level: 3)[The generating function and the asymptotic behavior of the
  number of paths in a rectangular lattice that lie below the main
  diagonal] <sec:lattice-paths>

#theorem(suffix: [])[
  (#bib-ref("Egorychev1974c")). _Let $Q(m,n)$ count paths from $(0,0)$ to
  $(m,n)$ with steps $(1,0)$, $(0,1)$ and $(1,1)$ which remain in $y<=x$. For
  integers $m>n>=1$,_ #eq(
    $
      Q(m,n)=res_z (1+z)^(n-1)(1-z)^(-n-1)
      (z^2+2z-1)z^(-m-2).
    $,
  ) <eq:restricted-path-residue>
  _For $n=0$, $Q(m,0)=1$._
] <th:restricted-path-residue>

#block(sticky: true)[The diagonal convolution below also uses the periodic
  sequences]
#eq(
  $
    alpha_n = cases(0 & quad n " even", (-1)^((n-1)/2) & quad n " odd"),
    quad beta_n = cases(0 & quad n " odd", (-1)^(n/2) & quad n " even").
  $,
) <eq:path-parity-sequences>

_For fixed $n>=0$,_
#eq($ Q(m,n) ∼ 2^n frac(m^n, n!) $) <eq:restricted-path-asymptotic>
_as $m arrow.r infinity$._

#proof[
  Let $T(m,n)$ count paths strictly below the diagonal after leaving the origin,
  with $m>n$. Prepending a horizontal step gives a bijection from the paths
  counted by $Q(m,n)$ to those counted by $T(m+1,n)$. The first-return
  decomposition considered in #bib-ref("Rohatgi1964") gives #eq(
    $
      T(m,n) & = f(m,n)-f(m-1,n-1)
               -2 sum_(i=1)^n Q(i)f(m-i,n-i), \
      Q(m,n) & =T(m+1,n),
    $,
  ) <eq:path-decomposition>
  where #eq(
    $
      f(m,n)=sum_(r=0)^(min(m, n))
      frac((m+n-r)!, (m-r)!(n-r)!r!)
    $,
  ) <eq:delannoy-multinomial-sum>
  counts all paths to $(m,n)$. Put $f(m,n)=0$ if either index is negative. The
  number of paths to $(n,n)$ strictly below the diagonal except at their
  endpoints is #eq(
    $
      Q(n)=1+sum_(r=0)^(n-2) frac(1, n-r-1)
      frac((2n-r-2)!, (n-r)!(n-r-2)!r!), quad n>=1.
    $,
  ) <eq:schroder-sum>
  Here the sum is empty for $n=1$, so $Q(1)=1$. These paths start horizontally
  and end vertically; a diagonal step along the main diagonal is excluded.

  To justify @eq:path-decomposition, a path that fails the strict restriction
  either starts with a diagonal step, or first returns to $(i,i)$ from below or
  from above. These disjoint classes have respectively $f(m-1,n-1)$ and
  $2Q(i)f(m-i,n-i)$ members. Only the first diagonal step is removed in the
  first class.

  #source(154, "142")
  We now find integral representations for $Q(n)$ and $f(m,n)$. Deleting the
  first and last steps of a path counted by $Q(n)$ gives a weakly constrained
  path to $(n-1,n-1)$. Its generating function $S(z)$ satisfies $S=1+z S+z S^2$,
  by decomposition at the first step and first return. Thus #eq(
    $
      Q(n)=-frac(1, 2)res_z
      lr((sqrt(1-6z+z^2)-1+z))z^(-n-1), quad n=1,2,...,
    $,
  ) <eq:schroder-generating-residue>
  where the square root has constant term $1$. Alternatively, deleting the
  diagonal steps gives a Dyck path, and inserting them among its steps yields
  the finite sum in @eq:schroder-sum. From @eq:delannoy-multinomial-sum we
  obtain #eq(
    $ f(m,n)=sum_(r=0)^(min(m, n))binom(n, r)binom(m+n-r, m-r) $,
  ) <eq:delannoy-binomial-sum>
  #eq($ =sum_(r=0)^n binom(n, r)binom(m+n-r, n) $) <eq:delannoy-extended-sum>
  #eq($ =res_z (1+z)^n (1-z)^(-n-1)z^(-m-1) $) <eq:delannoy-first-residue>
  #eq($ =res_w (1+w)^m (1-w)^(-m-1)w^(-n-1). $) <eq:delannoy-symmetric-residue>
  These identities hold for $m,n>=0$. In a diagonal convolution with $m>=n$,
  terms with $i>n$ vanish because their required coefficient has negative
  degree.

  An associated diagonal convolution has the integral representation #eq(
    $
      R(m,n) & =sum_(i=0)^n f(m-i,n-i) \
             & =frac(1, 2pi i) integral_(abs(z)=rho)
               frac((1+z)^(m+1), (1-z)^(m+1)(1+z^2))z^(-n-1)dif z,
    $,
  ) <eq:diagonal-path-sum>
  for $m>=n$. This counts a path once for each initial diagonal segment that can
  be removed; it is therefore different from a first-return count. Let
  $hat(R)(m,n)$ denote the coefficient on the right for all $m,n>=0$. It agrees
  with $R(m,n)$ when $m>=n$, and its generating function is #eq(
    $
      hat(R)_(n)(w) & =sum_(m=0)^infinity hat(R)(m,n)w^m \
                    & =frac(1, 1+w^2) frac(1, 2pi i)integral_(abs(z)=rho)
                      frac(z-w, 1+z^2)z^(-n-1)dif z \
                    & quad+frac(1+w, 1+w^2) frac(1, 2pi i)integral_(abs(z)=rho)
                      frac(z^(-n-1), 1-w-z(1+w))dif z.
    $,
  ) <eq:diagonal-path-generating-integral>

  #source(155, "143")
  Here $rho>0$ and $abs(w)$ are sufficiently small. Evaluation gives #eq(
    $
      hat(R)_(n)(w)=frac(alpha_n-w beta_n, 1+w^2)
      +frac((1+w)^(n+1), (1+w^2)(1-w)^(n+1)).
    $,
  ) <eq:diagonal-path-generating-function>
  #block(sticky: true)[Consequently, for $m>=n$,]
  #eq(
    $
      R(m,n) & =alpha_n beta_m-alpha_m beta_n \
             & quad+res_z frac((1+z)^(n+1), (1+z^2)(1-z)^(n+1))z^(-m-1).
    $,
  ) <eq:diagonal-path-residue>

  Return now to the last term in @eq:path-decomposition. By the substitution
  rule, @eq:schroder-generating-residue and @eq:delannoy-symmetric-residue give,
  for $m>=n>=1$, #eq(
    $
      P(m,n) & =-2 sum_(i=1)^n Q(i)f(m-i,n-i) \
             & =res_z (1+z)^m (1-z)^(-m-1)z^(-n-1)
               lr((sqrt(1-6u+u^2)-1+u))
               bar_(u=z(1-z)/(1+z)).
    $,
  ) <eq:excluded-path-convolution>
  The substituted square root is $(1-2z-z^2)/(1+z)$, since its square is
  $1-6u+u^2$ and its constant term is $1$. The parenthesis in
  @eq:excluded-path-convolution therefore becomes $-2z$. Thus
  $P(m,n)=-2f(m,n-1)$ in this range. Extending this last coefficient expression
  to all $m>=0$ as $hat(P)(m,n)$ gives #eq(
    $
      hat(P)_(n)(w) & =sum_(m=0)^infinity hat(P)(m,n)w^m \
                    & =-frac(2, 2pi i)integral_(abs(z)=rho)
                      frac(dif z, (1-z-w(1+z))z^n) \
                    & =-frac(2(1+w)^(n-1), (1-w)^n).
    $,
  ) <eq:excluded-path-generating-function>
  Taking coefficients, for $m>=n>=1$ we obtain #eq(
    $ P(m,n)=-2res_z (1+z)^(n-1)(1-z)^(-n)z^(-m-1). $,
  ) <eq:excluded-path-residue>
  Substitution into @eq:path-decomposition, followed by $Q(m,n)=T(m+1,n)$,
  proves @eq:restricted-path-residue. Equivalently,
  $ Q(m,n)=f(m,n)-f(m+1,n-1). $
  This identity also follows by reflecting a path up to its first vertex on
  $y=x+1$; the paths that cross the diagonal correspond to unrestricted paths
  ending at $(m+1,n-1)$.

  For fixed $n>=1$, the rational function in @eq:restricted-path-residue has a
  pole of order $n+1$ at $z=1$, with leading coefficient $2^n$. Its possible
  additional singularity at $z=-1$ is absent, since $(1+z)^(n-1)$ is a
  polynomial. Hence its coefficients are eventually a polynomial of degree $n$
  with leading coefficient $2^n/n!$. This proves @eq:restricted-path-asymptotic.

  #source(156, "144")
  The same leading term follows for the unrestricted count from
  @eq:delannoy-first-residue. Thus, with $n$ fixed, #eq(
    $ Q(m,n) ∼ 2^n m^n/n!, $,
  ) <eq:restricted-path-leading-term>
  #eq($ f(m,n) ∼ 2^n m^n/n!. $) <eq:delannoy-leading-term>
  The estimates also follow from @th:generating-function-limit: appending a
  horizontal step injects either family into the next one, so the coefficient
  differences are nonnegative, and the radial limits of their generating
  functions are $2^n$. Finitely many initial coefficients do not affect these
  limits.
]
