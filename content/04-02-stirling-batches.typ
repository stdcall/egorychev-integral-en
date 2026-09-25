#import "statements.typ": remark
#import "main-defs.typ": bib-ref, eq, res, source

#source(133, "121")
#heading(level: 3)[Other interpretations] <sec:other-interpretations>

We use combinatorial and analytic methods to prove several identities extending
familiar one-dimensional identities. These generalizations first arose from
distributions of objects and from graph theory; we also give analytic proofs.

*An identity involving Stirling numbers.* The identity proved in #bib-ref(
  "Lyamin1969",
) is #eq(
  $
    sum_(p=0)^r s_(2)(n-i,p)s_(2)^((p))(i,r-p)=s_(2)(n,r),
    quad i=0,1,dots,n,
  $,
) <eq:stirling-two-batches>
where $n,r$ are nonnegative integers and the generalized Stirling numbers have
the normalization specified in @sec:combinatorial-numbers. Here is the argument.

#source(134, "122")
The number $s_(2)(n,r)$ counts partitions of $n$ distinct objects into $r$
nonempty, unlabelled cells. Fix a division of the objects into two batches of
sizes $n-i$ and $i$. Classify the partitions by the number $p$ of cells met by
the first batch:

a) Fix $0<=p<=r$. Call these $p$ cells black and the other $r-p$ cells white.
Since the cells are unlabelled, their designation introduces no extra factor.

b) Partition the first batch among the black cells, all nonempty. There are
$s_(2)(n-i,p)$ choices. The resulting nonempty contents distinguish these $p$
cells from one another.

c) Distribute the second batch among these distinguishable black cells and the
$r-p$ unlabelled white cells, requiring every white cell to become nonempty.
There are $s_(2)^((p))(i,r-p)$ choices, by @sec:combinatorial-numbers.

Every final partition is obtained exactly once. Summing over $p$ proves
@eq:stirling-two-batches. The same interpretation includes $p=0,r$ and $i=0,n$,
with $s_(2)(0,0)=1$ and the usual zero values outside the range.

The argument extends to several batches. Fix positive integers $i_1,dots,i_k$
with $i_1+dots+i_k=n$. Divide the labelled objects into fixed batches of these
sizes and distribute them among $r$ unlabelled cells. Let $p_j$ be the number of
cells first occupied by batch $j$. Put $P_0=0$ and $P_j=p_1+dots+p_j$. We have
$p_1>=1$, $p_j>=0$ for $j>=2$, and $P_k=r$.

a) Fix these values $p_1,dots,p_k$ and give the $p_j$ cells first occupied at
step $j$ the color $c_j$. Since the cells are unlabelled, this coloring adds no
choices.

b) Partition the first batch among the $p_1$ cells of color $c_1$, making all of
them nonempty. This gives $s_(2)(i_1,p_1)$ choices.

c) Distribute the second batch among the occupied $p_1$ cells and the $p_2$ new
cells of color $c_2$, requiring all the new cells to be nonempty. There are
$s_(2)^((p_1))(i_2,p_2)$ choices.

#source(135, "123")
d) Continue in the same way. At step $j$, the $P_(j-1)$ previously occupied
cells are distinguished by their contents, whereas the $p_j$ new cells are
unlabelled and must become nonempty. The number of choices is
$s_(2)^((P_(j-1)))(i_j,p_j)$. The last step fills all remaining cells.

Thus, for the fixed values $p_j$, the number of distributions is
$
  s_(2)(i_1,p_1)s_(2)^((p_1))(i_2,p_2)dots
  s_(2)^((p_1+dots+p_(k-1)))(i_k,p_k).
$
Summing gives #eq(
  $
    sum_(p_1+dots+p_k=r) product_(j=1)^k s_(2)^((P_(j-1)))(i_j,p_j)
    =s_(2)(n,r),
  $,
) <eq:stirling-multiple-batches>
where the sum is over $p_1>=1$ and $p_2,dots,p_k>=0$.

*Analytic proof.* Let $S=S(i_1,dots,i_k)$ denote the sum in
@eq:stirling-multiple-batches. We may allow $i_j>=0$ for $j>=2$, but retain
$i_1>0$. If $i_1=0$, this particular sum would vanish because it restricts
$p_1>=1$.

Use the residue formulas $M_(7)$ and $M_(10)$ in the #link(
  <app:table-m>,
)[Appendix] for the ordinary and generalized Stirling numbers. Since $P_k=r$,
$
  product_(j=1)^k frac(1, p_j!)
  =frac(1, r!)binom(r, p_1, dots, p_k).
$
Formula $M_(1)$ represents this multinomial coefficient as a residue in
$w_1,dots,w_(k-1)$.
#block(sticky: true)[Set $I=product_(j=1)^k i_j!$. We obtain]
#eq(
  $
    S & =frac(I, r!)sum_(p_1+dots+p_k=r)
        lr(
          [product_(j=1)^k res_(z_j)
            frac((e^(z_j)-1)^(p_j)e^(P_(j-1)z_j), z_j^(i_j+1))]
        ) \
      & quad times res_(w_1 dots w_(k-1))
        frac(
          (1+w_1+dots+w_(k-1))^r,
          product_(j=1)^(k-1)w_j^(p_j+1)
        ).
  $,
) <eq:stirling-batch-residue>
Here all $p_j>=0$. The terms with $p_1=0$ vanish because $i_1>0$. Equivalently,
one may extend the $p_1,dots,p_(k-1)$ sums to infinity after extracting the
multinomial coefficient, which is zero when their sum exceeds $r$.

Performing the finite multinomial summation in @eq:stirling-batch-residue
collapses the numerator, since
$
  sum_(j=1)^k (e^(z_j)-1)e^(z_(j+1)+dots+z_k)=e^(z_1+dots+z_k)-1,
$
where the exponent in the final term is $0$. Consequently,
$
  S=frac(I, r!)res_(z_1 dots z_k)
  frac((e^(z_1+dots+z_k)-1)^r, product_(j=1)^k z_j^(i_j+1)).
$

#source(136, "124")
To reduce this to one variable, put $v=(v_1,dots,v_(k-1))$ and
$L(v)=1+v_1+dots+v_(k-1)$. The homogeneous coefficient identity
$
  [z_1^(i_1)dots z_k^(i_k)]F(z_1+dots+z_k)
  =frac(n!, I)[u^n]F(u)
$
for $i_1+dots+i_k=n$ gives the same reduction as the successive substitutions
$z_j=z_k v_j$ and $z_k=u/L(v)$. In residue form,
$
  S & =frac(I, r!)res_(v_1 dots v_(k-1))
      frac(L(v)^n, product_(j=1)^(k-1)v_j^(i_j+1))
      res_u frac((e^u-1)^r, u^(n+1)) \
    & =frac(n!, r!)res_u frac((e^u-1)^r, u^(n+1))=s_(2)(n,r).
$
For $k=1$ the residues and products over $v$ and $w$ are absent. This proves
@eq:stirling-multiple-batches, including zero values of $i_2,dots,i_k$.

#remark[
  If all batch sizes are allowed to be zero, define instead #eq(
    $
      T(i_1,dots,i_k)=sum_(p_1+dots+p_k=r)
      product_(j=1)^k s_(2)^((P_(j-1)))(i_j,p_j),
    $,
  ) <eq:stirling-batch-sum>
  where every $p_j>=0$ and every $i_j>=0$. The analytic proof applies directly.
  Alternatively, when $i_1=0$, only $p_1=0$ contributes, so a leading empty
  batch can be removed. For $k>=2$,
  $
    T(i_1,dots,i_k)=cases(
      s_(2)(n,r) & quad "if" i_1>=1,
      T(i_2,dots,i_k) & quad "if" i_1=0.
    )
  $
  The one-batch case is $T(i_1)=s_(2)(i_1,r)$, including $i_1=0$. Thus #eq(
    $ T(i_1,dots,i_k)=s_(2)(n,r), $,
  ) <eq:stirling-batch-value>
  for all nonnegative $i_j$ with sum $n$. Taking $k=2$ gives
  @eq:stirling-two-batches.
]
