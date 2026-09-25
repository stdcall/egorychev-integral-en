#import "statements.typ": proof, theorem
#import "main-defs.typ": bib-ref, eq, res, source

#source(156, "144")
#heading(level: 3)[Asymptotic behavior of the number of distinct colorings of
  the vertices of the complete bipartite graph $K_(p,q)$ using $t$
  colors] <sec:bipartite-colorings>

#theorem(suffix: [])[
  (#bib-ref("Avramenok1975")). _Let $f(p,q,t)$ count proper colorings of the
  labeled vertices of the complete bipartite graph $K_(p,q)$ (#bib-ref(
    "Harary1969",
  ), p. 17) from $t$ available, distinguished colors. Colors may be unused. For
  integers $p,q>=1$ and $t>=0$,_ #eq(
    $ f(p,q,t)=p!q!res_(x y) F(x,y)^t x^(-p-1)y^(-q-1), $,
  ) <eq:bipartite-coloring-residue>
  _where_
  #eq($ F(x,y)=e^x+e^y-1. $) <eq:bipartite-coloring-generating>
  _Furthermore,_
  #eq(
    $
      f(p,q,t)=frac(p!q!F(x_0,y_0)^t, 2pi t x_0^p y_0^q sqrt(Delta))
      lr([1+frac(C, 24t)+O(t^(-2))]),
    $,
  ) <eq:bipartite-coloring-asymptotic>
  _with_
  $
    C & = 3lambda_(40)-12lambda_(31)alpha
        +6lambda_(22)(1+2alpha^2)-12lambda_(13)alpha+3lambda_(04) \
      & quad-5lambda_(30)^2-9lambda_(21)^2 (1+4alpha^2)
        -9lambda_(12)^2 (1+4alpha^2)-5lambda_(03)^2 \
      & quad+30lambda_(30)lambda_(21)alpha
        -6lambda_(30)lambda_(12)(1+4alpha^2) \
      & quad+2lambda_(30)lambda_(03)alpha(3+2alpha^2)
        +18lambda_(21)lambda_(12)alpha(3+2alpha^2) \
      & quad-6lambda_(21)lambda_(03)(1+4alpha^2)
        +30lambda_(12)lambda_(03)alpha,
  $
  _as_
  #eq(
    $
      p=alpha_1 t, quad q=alpha_2 t, quad t arrow.r infinity,
      quad 0<alpha_1<frac(1, 2), quad 0<alpha_2<frac(1, 2),
    $,
  ) <eq:bipartite-density-regime>
  _with $alpha_1,alpha_2$ fixed, along integer values of $p,q,t$. The point
  $(x_0,y_0)$ is the unique positive solution of_
  #eq(
    $
      x_0 e^(x_0)=alpha_1 lr((e^(x_0)+e^(y_0)-1)), quad
      y_0 e^(y_0)=alpha_2 lr((e^(x_0)+e^(y_0)-1)).
    $,
  ) <eq:bipartite-saddle-system>
  _The quantities in @eq:bipartite-coloring-asymptotic are defined by_
  #eq(
    $
      lambda_(r s) & =frac(
                       k_(r s) k_(02)^(r/2) k_(20)^(s/2),
                       Delta^((r+s)/2)
                     ), quad
                     alpha=frac(lambda_(11), sqrt(lambda_(02)lambda_(20))), \
             Delta & =k_(02)k_(20)-k_(11)^2, \
           k_(r s) & =lr((frac(partial, partial xi)))^r
                     lr((frac(partial, partial eta)))^s
                     log F(e^xi,e^eta)bar_(xi=log x_0,eta=log y_0).
    $,
  ) <eq:bipartite-cumulants>
] <th:bipartite-coloring-residue>

#source(157, "145")
#proof[
  It was found in #bib-ref("Swenson1973") that #eq(
    $
      f(p,q,t)=sum_(r=1)^p sum_(s=1)^q
      s_(2)(p,r)s_(2)(q,s)frac(t!, (t-r-s)!),
    $,
  ) <eq:bipartite-coloring-exact-count>
  where $s_(2)(m,k)$ are the Stirling numbers of the second kind. A term with
  $r+s>t$ is understood to be zero. Indeed, partition the two vertex sets into
  $r$ and $s$ nonempty color classes. Since every vertex in one part is adjacent
  to every vertex in the other, the $r+s$ classes must receive different colors.

  The formulas $M_(7)(x),M_(7)(y)$ and $M_(1)(z_1,z_2)$ in #link(
    <app:table-m>,
  )[Table M], and the substitution rule, give
  $
    f(p,q,t) & =p!q!sum_(r+s<=t) frac(t!, r!s!(t-r-s)!)
               res_x (e^x-1)^r x^(-p-1)res_y (e^y-1)^s y^(-q-1) \
             & =p!q!sum_(r,s) res_(z_1 z_2)
               (1+z_1+z_2)^t z_1^(-r-1)z_2^(-s-1) \
             & quad times res_x (e^x-1)^r x^(-p-1)
               res_y (e^y-1)^s y^(-q-1) \
             & =p!q!res_(x y) x^(-p-1)y^(-q-1)
               lr([(1+z_1+z_2)^t])bar_(z_1=e^x-1,z_2=e^y-1),
  $
  where the double sums run over nonnegative integers $r,s$. This proves
  @eq:bipartite-coloring-residue. Equivalently, a single color is either unused,
  used on a nonempty subset of the first part, or used on a nonempty subset of
  the second part, giving the factor $1+(e^x-1)+(e^y-1)$.

  For the asymptotic estimate, set
  $ L(xi,eta)=log F(e^xi,e^eta). $
  The coefficients of $F$ are nonnegative, and its support contains
  $(0,0),(1,0),(0,1)$. Its logarithmic Hessian is positive definite, by the
  covariance argument in @th:good-laurent-series. The strictly convex function
  $L(xi,eta)-alpha_1 xi-alpha_2 eta$ tends to infinity as
  $abs(xi)+abs(eta) arrow.r infinity$: indeed, $L(xi,eta)>=max(0, xi, eta)$ and
  $(alpha_1,alpha_2)$ lies inside the triangle with those three support
  vertices. It therefore has a unique minimum, which gives
  @eq:bipartite-saddle-system. The saddle is fixed, and the full integer support
  lattice makes it the only maximum on the coefficient torus.

  To obtain the next term, expand the Cauchy integral at the saddle. Its
  relative correction is
  $
    frac(1, t)lr(
      (frac(bb(E) A_(4)(U,V), 24)
        -frac(bb(E) A_(3)(U,V)^2, 72))
    ),
  $
  where
  $ A_(j)(U,V)=sum_(r=0)^j binom(j, r)lambda_(r,j-r)U^r V^(j-r), $
  and $(U,V)$ is a centered Gaussian vector with variances $1$ and covariance
  $-alpha$. Its moments follow by expanding
  $bb(E) exp(a U+b V)=exp((a^2-2alpha a b+b^2)/2)$; they give exactly $C$ above.
  Odd terms vanish on integration, and the analytic Taylor expansion with
  Gaussian decay leaves an $O(t^(-2))$ relative remainder. Restoring the
  factorials in @eq:bipartite-coloring-residue yields
  @eq:bipartite-coloring-asymptotic.
]
