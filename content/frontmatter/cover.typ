#let cover() = {
  page(
    width: 176mm,
    height: 250mm,
    margin: 0pt,
    fill: rgb("ede4c5"),
    numbering: none,
  )[
    #set text(font: "TeX Gyre Heros", fill: rgb("8e1021"))
    #place(top + left, dx: 24mm, dy: 51mm)[
      #text(size: 24pt, weight: "bold")[
        Integral Representation\
        and the Computation\
        of Combinatorial Sums
      ]
      #v(12mm)
      #text(size: 16pt, weight: "bold")[G. P. EGORYCHEV]
    ]
    #place(bottom, rect(width: 100%, height: 57mm, fill: rgb("8e1021")))
    #place(bottom + left, dx: 24mm, dy: -65mm)[
      #text(size: 15pt, weight: "bold")[Volume 59]
    ]
    #place(bottom + left, dx: 24mm, dy: -19mm)[
      #set text(fill: rgb("ede4c5"))
      #text(size: 12pt, weight: "bold")[
        TRANSLATIONS OF\
        MATHEMATICAL MONOGRAPHS
      ]
      #v(8mm)
      #text(size: 11pt)[American Mathematical Society]
    ]
  ]
}

