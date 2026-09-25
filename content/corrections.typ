#import "book-style.typ": book-style
#show: book-style
#set document(title: "Corrections — Egorychev (1984)", author: "", date: none)
#set par(first-line-indent: 0pt)
#heading(level: 1)[Corrections]
G. P. Egorychev, _Integral Representation and the Computation of Combinatorial
Sums_, American Mathematical Society, 1984.

Page numbers below refer to the printed English edition. Confirmed corrections
and editorial clarifications are incorporated in the accompanying setting.

#let entries = json("../corrections.json")
#for item in entries {
  block(breakable: false)[
    #heading(level: 2)[#item.id · Page #item.printed_page]
    *Location:* #item.location

    *Printed:* #if "original_typst" in item {
      eval(item.original_typst, mode: "markup")
    } else { item.original }

    *Corrected:* #if "corrected_typst" in item {
      eval(item.corrected_typst, mode: "markup")
    } else { item.corrected }

    #if "reason_typst" in item {
      eval(item.reason_typst, mode: "markup")
    } else { item.reason }
  ]
}
