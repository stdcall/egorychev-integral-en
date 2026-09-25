#import "index-style.typ": index-mark
#import "statements.typ": example
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, eq, source

#source(168, "156")
#example(title: [])[
  Prove the identity (#bib-ref("Carlitz1969"), pp. 365–366) #eq(
    $
      & sum_(k=0)^m binom(p, k)binom(n, m-k)binom(q+n-k, n) \
      & =sum_(k=0)^m binom(q-p+n, k)binom(p, m-k)binom(q+n-k, n-k).
    $,
  ) <eq:carlitz-transformation>
  #index-mark([@eq:carlitz-transformation], group: [Identities])[Carlitz]
  Here $m,n>=0$ are integers and $p,q$ are arbitrary complex parameters. The
  binomial coefficients are generalized binomial coefficients, with value zero
  for a negative lower integer index. If $p,q$ are integers with $0<=p<=q$, the
  upper limits reduce to $min(p, q, m)$ and $min(q-p+n, n, m)$, respectively.

  As in the derivation of @eq:carlitz-double-generating-function, compare the
  generating functions of
  $
    A_(m n) & =sum_(k=0)^m binom(p, k)binom(n, m-k)binom(q+n-k, n), \
    B_(m n) & =sum_(k=0)^m binom(q-p+n, k)binom(p, m-k)binom(q+n-k, n-k).
  $
  Write $D=1-v(1+u)$. Summing first over $m$ and then over $n$ gives
  $
    sum_(m,n>=0)A_(m n)u^m v^n & =sum_(k>=0)binom(p, k)u^k D^(k-q-1) \
                               & =D^(-q-1)(1+u D)^p.
  $
  For the second sequence, terms with $k>n$ vanish. Setting $n=ell+k$ gives
  $
    & sum_(m,n>=0)B_(m n)u^m v^n \
    & =(1+u)^p sum_(ell,k>=0)binom(q-p+ell+k, k)
      binom(q+ell, ell)(u v)^k v^ell \
    & =(1+u)^p (1-u v)^(p-q-1)
      sum_(ell>=0)binom(q+ell, ell)lr((v/(1-u v)))^ell.
  $
  These are formal power series; every coefficient involves only finitely many
  terms in the rearrangements. Equivalently, one may use the branches analytic
  near $u=v=0$ and normalized to $1$ there.

  #source(169, "157")
  Since $1+u D=(1+u)(1-u v)$, both series are #eq(
    $
      sum_(m,n=0)^infinity A_(m n)u^m v^n
      &=((1+u)^p (1-u v)^p)/(lr([1-v(1+u)])^(q+1)) \
      &=sum_(m,n=0)^infinity B_(m n)u^m v^n.
    $,
  ) <eq:carlitz-common-generating-function>
  Comparison of coefficients gives $A_(m n)=B_(m n)$ and proves
  @eq:carlitz-transformation.
] <ex:carlitz-transformation>
