#import "main-defs.typ": source
#import "supp-statements.typ": example

#source(278, "266")
#heading(level: 3)[Examples] <supp:implicit-examples>
#example(title: [])[
  Find the implicit function $z=phi(w)$ near $(0,0) in CC^2$ determined by
  $
    z-w+z^p w^q=0,
  $
  where $p>=1$ and $q>=0$ are integers with $p+q>=2$. Taking $m=1$,
  $Phi(w, z)=z$ and $g(w,z)=-w+z^p w^q$ in @eq:implicit-taylor-series and
  @eq:implicit-coefficients-univariate gives
  $
    z=phi(w)=sum_(n=1)^infinity c_n w^n,
  $
  where
  $
    c_n & =sum_(k=1)^(2n) frac(1, k! n!)
          frac(partial^(n+k-1), partial z^(k-1) partial w^n)
          lr([(w-z^p w^q)^k])|_(w=0,z=0) \
        & =cases(
            frac((-1)^r (p r)!, r! [(p-1)r+1]!) & "if" n=(p+q-1)r+1,
            0 & "otherwise."
          )
  $
  Here $r=0,1,dots$ in the nonzero case. The coefficient of $z^(k-1)$ comes from
  choosing $r$ copies of $-z^p w^q$, so $k-1=p r$ and $n=k-r+q r$. Hence
  $
    z=phi(w)=sum_(r=0)^infinity
    frac((-1)^r (p r)!, r! [(p-1)r+1]!) w^((p+q-1)r+1).
  $
] <ex:implicit-binomial-example>

#example(title: [])[
  Find the regular branches at $(0,0) in CC^2$ of
  $
    z^3-3w z+w^3=0.
  $
  #source(279, "267")
  By Corollaries @cor:regular-branch-series[] and
  @cor:univariate-regular-branch[], a single-valued branch tangent to $z=0$ has
  the form
  $
    z=sum_(n=2)^infinity c_n w^n.
  $
  Normalize the equation as $F(w,z)=w z-(z^3+w^3)/3$, so that $g=-(z^3+w^3)/3$
  and $J=w-z^2$. Formula @eq:branched-series-coefficients, or its integral form,
  gives
  $
    c_n=sum_(k>=0) frac(1, (2 pi i)^2)
    integral_(abs(w)=sigma) integral_(abs(zeta)=epsilon)
    frac((zeta^3+w^3)^k (w-zeta^2), 3^k zeta^k w^(k+n+2))
    dif w ∧ dif zeta,
  $
  where the product torus is oriented in the order $(arg w,arg zeta)$, and the
  radii are small enough that $epsilon^3+sigma^3<3sigma epsilon$. The resulting
  series is
  $
    z & =sum_(r=0)^infinity
        frac((3r)!, 3^(3r+1) r! (2r+1)!) w^(3r+2) \
      & =frac(w^2, 3)+frac(w^5, 3^4)+frac(w^8, 3^6)
        +frac(4w^11, 3^9)+dots.
  $
  The substitution $z=w^2 u/3$ gives $u=1+w^3 u^3/27$, which also yields this
  series and its local convergence by the implicit function theorem. Any
  holomorphic branch through $0$ has vanishing linear term; this is therefore
  the unique regular branch there.
] <ex:cubic-branch-example>
