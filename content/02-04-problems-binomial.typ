#import "index-style.typ": index-mark
#import "statements.typ": problem
#import "book-style.typ": keep-next
#import "main-defs.typ": bib-ref, res, source

#source(90, "78")
#heading(level: 2)[Problems] <sec:univariate-problems>

The problems broadly follow the order of the material in this chapter. Unless
otherwise indicated, prove the identities by finding integral representations of
the sums on the left. Compare your proofs with the original proofs and, where
possible, study the applications given in the sources.

The selection draws extensively on #bib-ref(
  "Gould1972a",
  "Kaucky1975",
  "Knuth1969",
), without claiming completeness either for the identities or for the
bibliography. For the history of individual identities and their proofs, see
#bib-ref(
  "Riordan1968",
  "Gould1972a",
  "Fuks1962",
  "Knuth1969",
  "Schwatt1924",
  "Kutlumuratov1964",
). Attributions follow mainly #bib-ref(
  "Riordan1968",
  "Gould1972a",
  "Kaucky1975",
). For example, @eq:davis-identities gives Moriarty's identities. When the
author is unknown, the source is given in parentheses. As in those sources,
errors of attribution may remain.

Summation limits are nonnegative integers unless otherwise specified. Displayed
quotients are understood where their denominators are nonzero; removable limits
may then be taken.

#problem[
  _Compute the sums:_

  #keep-next[a)]
  $
    sum_(i=1)^n i binom(n, i), quad
    sum_(i=0)^k binom(i+n-1, n-1), quad
    sum_(i=0)^p binom(alpha-i, q), quad n>=1;
  $
  #keep-next[b)]
  $
    sum_(i=0)^n (-1)^i binom(n, i)binom(n+i, m), quad m>=n, \
    sum_(i=0)^n (-1)^i binom(n, i)binom(m-2i, n-1), quad m>=2n, quad n>=1;
  $
  #keep-next[c)]
  $
    sum_(k=0)^(min(r, s)) binom(r, k)binom(s, k)k;
  $
  #keep-next[d)]
  $
    sum_(i=2n-2m)^(2n-m) (-1)^i binom(m, 2n-m-i)(2n-i)binom(i-1, n-1),
    quad n>m;
  $
  #keep-next[e)]
  $
    sum_(i=0)^k (-1)^(k-i)binom(k, i)(i+n)^(k+1), quad
    sum_(i=0)^k (-1)^(k-i)binom(k, i)(i+n)^(k+2);
  $
  #keep-next[f)]
  $
    sum_(ell=0)^p (-1)^(ell+p)binom(p, ell)binom(ell+h+s, h).
  $

  *Answers.* a) $n 2^(n-1)$, $binom(k+n, n)$,
  $binom(alpha+1, q+1)-binom(alpha-p, q+1)$ (#bib-ref("Feller1968"), Chapter 2,
  formulas (12.1), (12.8), and (12.6)). b) $(-1)^n binom(n, m-n)$, $0$ (cf.
  #bib-ref("Kaucky1966")). c) $s binom(r+s-1, r-1)$, with value $0$ when $r=0$
  (cf. #bib-ref("Knuth1969"), §1.2.6, Problem 1). d) $0$ (cf. Klee's identity
  #bib-ref("Kaucky1966")). e) $(n+k/2)(k+1)!$,
  #source(91, "79")
  $(k+2)!/24 (3k^2+(12n+1)k+12n^2)$ (an identity of Nguyen-Huu-Bong #bib-ref(
    "Nguyen1973",
  )). f) $res_x (1+x)^(h+s)x^(-h+p-1)$ (cf. Wu's identity in #bib-ref(
    "Srivastava1972",
  )).
] <prob:elementary-binomial-sums>
#index-mark([@prob:elementary-binomial-sums], group: [Identities])[Klee]
#index-mark(
  [@prob:elementary-binomial-sums],
  group: [Identities],
)[Nguyen-Huu-Bong]
#index-mark([@prob:elementary-binomial-sums], group: [Identities])[Wu]

#problem[
  _Prove:_

  #keep-next[a) the graph theory identities (#bib-ref(
      "Mullin1967",
      "Austin1960",
    )), for $n>=2$,]
  $
    sum_(i=1)^(n-1) binom(n, i)i^(n-i-1)(n-i)^(i-1)=2n^(n-2),
  $
  $
    sum_(i=1)^(n-1) binom(n-1, i)i^(i-1)(n-i)^(n-i-1)=(n-1)n^(n-2);
  $
  #keep-next[b) the identity (#bib-ref("Bhaskaranada1968", "Csorgo1965"))]
  $
    (alpha-1)(beta-n)sum_(i=0)^n
    frac(1, 1+i)binom(n, i)(alpha+i)^i (beta-i)^(n-i-1) \
    =frac(1, n+1)lr(
      [
        (alpha+beta)^n (alpha+beta-n-1)-(1+beta)^n (beta-n)
      ]
    ).
  $
  #keep-next[c) the identity (#bib-ref("Kaucky1975"), p. 278), for $n>=1$,]
  $
    sum_(v=0)^(n-1) binom(n, v)(alpha+n-v)^(n-v-1)(x+v)^v \
    =frac((x+alpha+n)^n-(x+n)^n, alpha);
  $
  #keep-next[d) the identity (#bib-ref("Kaucky1975"), p. 464, (26))]
  $
    sum_(v=0)^n binom(n, v)(x+v a)^v (y-v a)^(n-v)
    =n! sum_(v=0)^n frac((x+y)^v, v!)a^(n-v).
  $
] <prob:graph-identities>

#problem[
  _Prove:_

  #metadata((kind: "index-anchor")) <idx:hagen-2>
  #index-mark([@idx:hagen-2], group: [Identities])[Hagen]
  #metadata((kind: "index-anchor")) <idx:engelberg>
  #index-mark([@idx:engelberg], group: [Identities])[Engelberg]
  #metadata((kind: "index-anchor")) <idx:hagen-1>
  #index-mark([@idx:hagen-1], group: [Identities])[Hagen]
  #keep-next[a) Hagen's identity #bib-ref("Hagen1891")]
  $
    sum_(s=0)^n frac(a+b s, (p-s d)(q+s d))
    binom(p-s d, n-s)binom(q+s d, s) \
    =frac(a(p+q-n d)+b n q, (p+q)q(p-n d))binom(p+q, n);
  $
  #keep-next[b) Engelberg's identity #bib-ref("Engelberg1965"), for $b>=1$,]
  $
    sum_(i=0)^(b-1) frac(1, 1+mu i)
    binom((1+mu)(b-i)-2, b-i-1)binom((1+mu)i, i) \
    =frac(1, 1+mu)binom((1+mu)b, b);
  $
  #keep-next[c) the identity (#bib-ref("Kaucky1975"), p. 462, (12))]
  $
    sum_(s=0)^n binom(p-s d, n-s)binom(q+s d, s)
    =sum_(v=0)^n binom(p+q-v, n-v)d^v;
  $
  #keep-next[d) the identity (#bib-ref("Kaucky1975"), p. 467, (42)), for
    integers $0<=r<n$,]
  $
    sum_(s=0)^n binom(q+s d, s)binom(r-q-s d, n-s)
    =d^(r+1)(d-1)^(n-r-1);
  $
  #source(92, "80")
  #keep-next[e) Hagen's identity (#bib-ref("Kaucky1975"), p. 462, (13))]
  $
    sum_(s=0)^n frac(1, q+d s)binom(p-s d, n-s)binom(q+s d, s)
    =frac(1, q)binom(p+q, n);
  $
  #keep-next[f) the identity (#bib-ref("Kaucky1975"), p. 320), for $n>=1$,]
  $
    sum_(k=0)^n (-1)^k binom(n, k)binom(x-k m, n-1)=0;
  $
  #keep-next[g) the identity (#bib-ref("Kaucky1975"), p. 319)]
  $
    sum_(k=0)^n (-1)^k binom(n, k)binom(x-k m, n)=m^n.
  $
] <prob:hagen-identities>
