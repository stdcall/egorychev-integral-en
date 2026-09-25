#let editorial-notes = sys.inputs.at("editorial-notes", default: "on") != "off"
#let editorial-note-counter = counter("editorial-note")

#let editorial-note(id, body) = if editorial-notes {
  editorial-note-counter.step()
  context {
    let number = editorial-note-counter.get().first()
    let mark = "*" + str(number) + ")"
    footnote(
      numbering: _ => mark,
      {
        show cite: set text(hyphenate: false)
        [#body~— _Ed._]
      },
    )
    counter(footnote).update(n => n - 1)
    metadata((kind: "editorial-note", id: id, number: number))
  }
}
