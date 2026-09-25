#let index-style(body) = {
  set text(size: 10.5pt)
  set par(first-line-indent: 0pt, hanging-indent: 1em, justify: false)
  set block(above: 0.45em, below: 0.45em)
  columns(2, gutter: 5mm, body)
}

#let index-group(body) = block(sticky: true, above: 0.9em)[
  #text(weight: "semibold", body)
]

// The term belongs at its passage. A native reference can name the start of
// a long environment; without it, the mark itself is the destination.
#let index-mark(
  target,
  group: none,
  major: false,
  sort: auto,
  after: none,
  body,
) = [#metadata((
  term: body,
  target: if target == none { none } else { target.target },
  group: group,
  major: major,
  sort: sort,
  after: after,
)) <index-mark>]

#let index-text(body) = {
  if body == none { return "" }
  if type(body) == str { return body.replace(regex("\\s+"), " ") }
  if body.has("text") { return index-text(body.text) }
  if body.has("children") { return body.children.map(index-text).join() }
  if body.has("body") { return index-text(body.body) }
  if body.has("base") {
    let value = index-text(body.base)
    for field in ("tl", "bl", "t", "b", "tr", "br") {
      if body.has(field) and body.at(field) != none {
        value += "[" + field + ":" + index-text(body.at(field)) + "]"
      }
    }
    return value
  }
  if body == [ ] { return " " }
  ""
}

// English word order, ignoring hyphens and accents. The
// author's conceptual exceptions use a named predecessor, never an ordinal.
#let index-key(body) = {
  let value = lower(index-text(body))
  for (letters, base) in (
    ("[áä]", "a"),
    ("[ćč]", "c"),
    ("[éě]", "e"),
    ("[íĭ]", "i"),
    ("[öő]", "o"),
    ("[š]", "s"),
    ("[üű]", "u"),
    ("[ý]", "y"),
  ) { value = value.replace(regex(letters), base) }
  value.replace(regex("[–’'-]"), "").replace(regex("[^a-z0-9]+"), " ").trim()
}

#let index-order(entries) = {
  let remaining = entries.sorted(key: e => index-key(
    if e.sort == auto { e.term } else { e.sort },
  ))
  let ordered = ()
  while remaining.len() > 0 {
    let next = remaining.position(e => (
      e.after == none
        or ordered.any(
          previous => index-text(previous.term) == index-text(e.after),
        )
    ))
    assert(
      next != none,
      message: "Missing or cyclic index predecessor: "
        + repr(remaining.map(e => (index-text(e.term), index-text(e.after)))),
    )
    ordered.push(remaining.remove(next))
  }
  ordered
}

#let index-entries() = {
  let entries = (:)
  for mark in query(<index-mark>) {
    let data = mark.value
    let key = (index-text(data.group), index-text(data.term))
    let loc = if data.target == none {
      mark.location()
    } else {
      let found = query(data.target)
      assert(found.len() == 1, message: "Index target: " + repr(data.target))
      found.first().location()
    }
    let occurrence = (
      location: loc,
      page: counter(page).at(loc).first(),
      target: if data.target == none { none } else { str(data.target) },
    )
    let key = repr(key)
    if key not in entries {
      entries.insert(key, (..data, occurrences: (occurrence,)))
    } else {
      let entry = entries.at(key)
      assert(
        entry.major == data.major
          and index-text(entry.after) == index-text(data.after)
          and entry.sort == data.sort,
        message: "Conflicting index marks",
      )
      entry.occurrences.push(occurrence)
      entries.insert(key, entry)
    }
  }
  entries.values()
}

#let subject-index() = context {
  let entries = index-entries()
  let groups = entries
    .map(e => index-text(e.group))
    .filter(g => g != "")
    .dedup()
  let top = entries.filter(e => e.group == none)
  for group in groups {
    top.push((term: group, group: group, sort: auto, after: none))
  }
  let render(entry) = {
    let occurrences = entry.occurrences.sorted(key: o => o.page)
    let pages = occurrences.map(o => o.page).dedup()
    metadata((
      kind: "index-entry",
      term: index-text(entry.term),
      group: index-text(entry.group),
      pages: pages,
      destinations: occurrences.map(o => o.location.position()),
      targets: occurrences.map(o => o.target).dedup(),
    ))
    block(breakable: false, above: if entry.major { 0.9em } else { 0.45em })[
      #text(
        weight: if entry.major { "semibold" } else { "regular" },
        entry.term,
      ), #(
        pages
          .map(n => {
            let loc = occurrences.find(o => o.page == n).location
            link(loc, text(weight: "semibold", str(n)))
          })
          .join([, ])
      )
    ]
  }
  for entry in index-order(top) {
    if entry.group == none {
      render(entry)
    } else {
      index-group(entry.term)
      for child in index-order(entries.filter(e => (
        index-text(e.group) == entry.group
      ))) {
        render(child)
      }
    }
  }
}
