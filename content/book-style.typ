#import "equations.typ": equation-rules
#import "references.typ": reference-rules
#import "statements.typ": statement-rules

#let book-style(body) = {
  show: statement-rules
  show: equation-rules
  show: reference-rules
  set page(
    width: 176mm,
    height: 250mm,
    margin: (x: 20mm, top: 20mm, bottom: 20mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: "Libertinus Serif", size: 12pt, lang: "en")
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1.2em,
    spacing: 0.85em,
  )
  set heading(numbering: none, hanging-indent: 0pt)
  show heading.where(level: 1): set text(size: 23pt, weight: "semibold")
  show heading.where(level: 2): set text(size: 16pt, weight: "semibold")
  show heading.where(level: 3): set text(size: 13pt, weight: "semibold")
  show heading: set block(above: 1.5em, below: 0.9em)
  show heading: set text(hyphenate: false)
  show heading: set par(justify: false)
  show link: set text(fill: black)
  show footnote.entry: it => block(breakable: false, it)
  show math.equation: set text(font: "STIX Two Math")
  show math.equation.where(block: true): set block(breakable: false)
  show math.equation.where(block: false): box
  set math.equation(numbering: none, supplement: none)
  set enum(numbering: "1)")
  body
}

#let keep-next(body) = block(sticky: true, body)

#let keep-together(body) = block(breakable: false, body)


#let original-reference(key, body, number: auto) = {
  if number == auto { counter("original-bibliography").step() }
  context {
    let number = if number == auto {
      str(counter("original-bibliography").get().first())
    } else { number }
    block(breakable: false)[
      #par(first-line-indent: 0pt, hanging-indent: 2em)[
        #metadata((kind: "bibliography-entry", key: key, number: number))#label(
          "bib:" + key,
        )\[#number\] #body
      ]
    ]
  }
}

#let supplement-numbering(..numbers) = {
  let n = numbers.pos().slice(1)
  if n.len() == 1 { "§" + numbering("1.", ..n) } else { numbering("1.", ..n) }
}

#let table-numbering(..numbers) = {
  let n = numbers.pos()
  if n.len() == 2 { numbering("I.", n.at(1)) } else { numbering("a)", n.at(2)) }
}
