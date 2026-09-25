#import "index-style.typ": index-mark
#import "main-defs.typ": bib-ref, eq, source
#import "statements.typ": theorem
#import "book-style.typ": keep-next

#source(204, "192")
#heading(level: 3)[Computation of Szegő kernels for certain
  domains] <sec:szego-computation>
#index-mark([@sec:szego-computation], group: [Kernels])[Szegö]

Before the appearance of this book, the known example of a Szegő representation
for an unbounded $n$-circular domain was due to one of the authors of this
section; see #bib-ref("Fuks1962"), Chapter IV, §23.3. For the domain
$
  D=lr({z in CC^2: abs(z_1)^2 e^(abs(z_2)^2)<1}),
$
equivalently $abs(z_2)^2<-2 ln abs(z_1)$ when $0<abs(z_1)<1$, with the axis
$z_1=0$ included, the representation is #eq(
  $
    f(z)=frac(2, (2π i)^2) integral_0^1 abs(ζ_1) d abs(ζ_1)
    integral_(Γ(abs(ζ)))
    frac(
      e^(z_2 overline(ζ)_2) f(ζ),
      lr((1-z_1 overline(ζ)_1 e^(z_2 overline(ζ)_2)))^2
    )
    frac(d ζ, ζ).
  $,
) <eq:exponential-domain-integral>
Here radial integration is with respect to $d abs(ζ_1)^2$ on $[0,1]$.

We now compute kernels for the domains @eq:szego-general-domain as power series,
multiple contour integrals and closed expressions; see @th:szego-general-series.
A more general result is stated without proof in @th:nested-exponential-kernel.
In the proof, the main points are the multiple integrals in Lemmas
@lem:nested-beta-integral[] and @lem:logarithmic-block-integral[], the
construction of an integral representation for the kernel, and its evaluation by
the main theorem of §@sec:main-residue-theorem. The domains are chosen to
illustrate the method while keeping the calculations manageable.

Let $p=(p_1,dots,p_n)$, $γ=(γ_1,dots,γ_m)$ and $α=(α_1,α_2)$ have positive
integer entries. Choose integers $0<s<m$ and $0=ν_0<ν_1<dots<ν_m=n$, and put
$B_i=lr({ν_(i-1)+1,dots,ν_i})$. Put
$
  M_i (z)=sum_(j in B_i) abs(z_j)^(2/p_j), quad i=1,dots,m.
$
#keep-next[Consider the complete $n$-circular domain]
#eq(
  $
    D^(p,γ,α)=lr(
      {z in CC^n:
        lr((sum_(i=1)^s M_i (z)^(1/γ_i)))^(1/α_1)
        <exp lr((-lr((sum_(i=s+1)^m M_i (z)^(1/γ_i)))^(1/α_2)))}
    ).
  $,
) <eq:szego-general-domain>

#source(205, "193")
Write $x_j=z_j overline(ζ)_j$. The radial measure is
$d abs(ζ)^2[n]=d abs(ζ_1)^2 dots d abs(ζ_(n-1))^2$ on the boundary, regarded as
a graph over these first $n-1$ squared moduli. Together with normalized angular
measure, it corresponds to the form
$
  frac(1, (2π i)^n) d abs(ζ)^2[n] ∧ frac(d ζ, ζ)
  =frac(1, (2π i)^n)
  d abs(ζ_1)^2 ∧ dots ∧ d abs(ζ_(n-1))^2
  ∧ frac(d ζ_1, ζ_1) ∧ dots ∧ frac(d ζ_n, ζ_n).
$
This measure satisfies the hypothesis of @th:szego-reproducing-representation.
Indeed, its support is the full radial boundary. For $R>1$ the first coordinate
is never cut off by the truncation; the maximum-modulus principle on its
coordinate discs shows that the original boundary is a boundary for the algebra
of functions holomorphic on $D^R$ and continuous on its closure. Thus
$S(D^R) subset.eq ∂ D$.

In the contour integrals below, $z=(z_1,dots,z_n)$, $v=(v_1,dots,v_m)$ and $w$
are integration variables, and $x$ is an independent parameter. For sufficiently
small $ρ>0$, set
$
  Γ_(ρ)^(1)=lr({z: abs(z_j)=ρ, quad j=1,dots,n}), \
  Γ_(ρ)^(2)=lr({v: abs(v_i)=ρ, quad i=1,dots,m}), quad
  Γ_(ρ)^(3)=lr({w: abs(w)=ρ}), \
  Γ(ρ)=Γ_(ρ)^(1) times Γ_(ρ)^(2) times Γ_(ρ)^(3).
$
All component circles are positively oriented. Write $δ(β,q)=exp(2π i β/q)$ for
$β=1,dots,q$.

#theorem[
  _The Szegő kernel is given by_
  #eq(
    $
      h(x) & =sum_(k in NN^n)
             frac((α_1 Q_1)^(α_2 Q_2), (α_2 Q_2)!) Q_1! Q_2!
             lr((product_(i=1)^m frac(T_i!, (γ_i T_i)!)))
             frac(x_n^(k_n), (p_n k_n)!) \
           & quad times product_(j=1)^(n-1)
             frac(x_j^(k_j), (p_j (k_j+1)-1)! p_j),
    $,
  ) <eq:szego-general-series>
  #keep-next[_where_]
  #eq(
    variant: <eq:szego-general-series>,
    $
      T_i & =sum_(j in B_i) p_j (k_j+1), quad i=1,dots,m-1, \
      T_m & =p_n k_n+sum_(j=ν_(m-1)+1)^(n-1) p_j (k_j+1), \
      Q_1 & =sum_(i=1)^s γ_i T_i, quad Q_2=sum_(i=s+1)^m γ_i T_i.
    $,
  ) <eq:szego-series-parameters>
  _The empty sum in $T_m$ is zero. For the following formulas, abbreviate_
  $
    D_x=frac(∂^(n-1), ∂ x_1 dots ∂ x_(n-1)).
  $
  #keep-next[
    _For fixed sufficiently small $ρ$ and $x$ sufficiently close to $0$,_
  ]
  #eq(
    $
      h(x) & =D_x lr(
               {frac(1, (2π i)^(n+m+1)) integral_(Γ(ρ)) \
                 & quad times product_(i=1)^s product_(j in B_i)
                 lr(
                   (1-frac(
                       x_j V_1^(γ_i p_j) Z_i^(p_j) e^(w α_1 γ_i p_j),
                       z_j^(p_j) v_i^(γ_i p_j)
                     ))
                 )^(-1) \
                 & quad times product_(i=s+1)^m product_(j in B_i)
                 lr(
                   (1-frac(
                       x_j V_2^(γ_i p_j) Z_i^(p_j),
                       z_j^(p_j) v_i^(γ_i p_j) w^(α_2 γ_i p_j)
                     ))
                 )^(-1)
                 frac(d z, z) ∧ frac(d v, v) ∧ frac(d w, w)}
             ),
    $,
  ) <eq:szego-general-integral>
  #source(206, "194")
  #keep-next[_where_]
  #eq(
    variant: <eq:szego-general-integral>,
    $
      Z_i=1+sum_(j in B_i) z_j, quad i=1,dots,m, \
      V_1=1+sum_(i=1)^s v_i, quad V_2=1+sum_(i=s+1)^m v_i.
    $,
  ) <eq:szego-integral-parameters>
  _A closed expression is_
  #eq(
    $
      h(x) & =frac(1, α_2 product_(j=1)^n p_j product_(i=1)^m γ_i)
             D_x lr(
               {sum_(t_1=1)^(p_1) dots sum_(t_n=1)^(p_n)
                 sum_(r_1=1)^(γ_1) dots sum_(r_m=1)^(γ_m) \
                 & quad times sum_(l=1)^(α_2)
                 lr((1-A(x) exp lr((α_1 δ(l,α_2) B(x)^(1/α_2)))))^(-1)}
             ),
    $,
  ) <eq:szego-root-sum>
  _where the summands use_
  $
    F_i (x)=sum_(j in B_i) δ(t_j,p_j) x_j^(1/p_j), quad i=1,dots,m, \
    A(x)=sum_(i=1)^s δ(r_i,γ_i) F_i (x)^(1/γ_i), quad
    B(x)=sum_(i=s+1)^m δ(r_i,γ_i) F_i (x)^(1/γ_i).
  $
  Changing a choice of a root merely permutes the corresponding complete sum.
  The averaged expression is single-valued and holomorphic near $x=0$; elsewhere
  it is understood by analytic continuation from that neighbourhood.
] <th:szego-general-series>
