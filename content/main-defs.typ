#import "equations.typ": eq

#let source(n, printed) = {
  metadata((
    kind: "source",
    file-page: n,
    printed-page: printed,
  ))
}

#let book-ref(target, body) = context {
  let found = query(label(target))
  metadata((
    kind: "cross-reference",
    target: target,
    resolved: found.len() == 1,
  ))
  let numbered = {
    show regex("[0-9]+(?:\\.[0-9]+)*|\\b[ivxlcdm]+\\b"): set text(
      weight: "semibold",
    )
    body
  }
  if found.len() == 1 { link(label(target), numbered) } else { numbered }
}

#let bib-ref(..keys) = context {
  let references = keys
    .pos()
    .map(key => {
      let target = "bib:" + key
      let entry = query(label(target)).first().value
      book-ref(target, entry.number)
    })
  [\[#references.join([, ])\]]
}

#let res = math.op("res", limits: true)
#let dw = $dif w$
#let dv = $dif v$
#let mathclap(body) = context {
  let small = $script(body)$
  let width = measure(small).width
  box(width: 0pt, inset: (left: -width / 2, right: -width / 2), small)
}
