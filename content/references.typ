#import "statements.typ": statement-at
#import "equations.typ": equation-at

#let reference-rules(body) = {
  show ref: it => {
    let element = it.element
    if element == none or it.form != "normal" { return it }
    let prefix = if it.supplement == auto { [] } else { it.supplement }
    let number = none
    let equation = false
    if element.func() == heading {
      let n = counter(heading).at(element.location())
      if str(it.target).starts-with("supp:") { n = n.slice(1) }
      // The Bergman subsection is called an example in the later discussion.
      if prefix == [Example] { n = (n.last(),) }
      number = if str(it.target).starts-with("table:") {
        numbering(
          element.numbering,
          ..counter(heading).at(element.location()),
        ).trim(".")
      } else { numbering("1.1", ..n) }
    } else if element.func() == figure and element.kind == "statement" {
      let value = statement-at(str(it.target))
      number = value.number
      if it.supplement == auto { prefix = value.supplement }
      metadata((
        kind: "statement-reference",
        target: str(it.target),
        number: number,
      ))
    } else if (
      element.func() == math.equation
        or (
          element.func() == metadata
            and element.value.at("kind", default: none) == "equation-alias"
        )
    ) {
      number = equation-at(it.target).number
      equation = true
      metadata((
        kind: "equation-reference",
        target: str(it.target),
        number: number,
      ))
    } else { return it }
    metadata((kind: "cross-reference", target: str(it.target), resolved: true))
    link(it.target)[#prefix#if prefix != [] { [ ] }#if number != none {
        if equation { [(] }
        text(
          weight: if number.contains(regex("[0-9IVX]")) { "semibold" } else {
            "regular"
          },
          number,
        )
        if equation { [)] }
      }]
  }
  body
}
