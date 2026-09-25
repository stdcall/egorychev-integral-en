// A figure supplies a labelable, referenceable environment. Its body stays
// in the text flow; counters belong to each section and statement family.
#let statement-scope(config, loc) = {
  let scope = counter(heading).at(loc)
  scope = (scope + (0,) * config.depth).slice(0, config.depth)
  if config.nested {
    let parent = counter("main-Problem:" + repr(scope)).at(loc).first()
    scope += (parent,)
  }
  scope
}

#let statement-counter(config, scope) = counter(
  config.family + ":" + repr(scope),
)

#let statement-number(config, scope, n) = {
  let prefix = if config.nested { scope.slice(1) } else if (
    config.prefix != auto
  ) { config.prefix } else if config.flat { () } else { scope }
  numbering("1.1", ..prefix, n)
}

// Keep the opening paragraph with the first display or following paragraph.
// The rest of a long statement can flow freely onto subsequent pages.
#let statement-body(head, body) = {
  let parts = if body.has("children") { body.children } else { (body,) }
  let boundary = parts.position(it => (
    it.func()
      in (
        parbreak,
        block,
        enum,
        list,
        figure,
        table,
      )
      or (it.func() == math.equation and it.block)
  ))
  if boundary == none {
    [#head #body]
  } else {
    block(sticky: true)[#head #parts.slice(0, boundary).sum(default: [])]
    parts.slice(boundary).sum(default: [])
  }
}

#let statement(
  kind,
  body,
  numbered: true,
  supplement: false,
  prefix: auto,
  base-level: auto,
  nested: false,
  title: auto,
  name: none,
  title-format: strong,
  suffix: auto,
) = {
  let group = if nested { "Subproblem" } else if (
    supplement
      and kind
        in (
          "Theorem",
          "Proposition",
          "Corollary",
        )
  ) { "Theorem" } else { kind }
  let config = (
    family: (if supplement { "supp-" } else { "main-" }) + group,
    supplement: kind,
    numbered: numbered,
    depth: if base-level != auto { base-level } else if kind == "Rule" {
      3
    } else { 2 },
    flat: supplement or kind in ("Example", "Rule", "Remark"),
    prefix: prefix,
    nested: nested,
  )
  figure(
    metadata(config)
      + context {
        let scope = statement-scope(config, here())
        let count = statement-counter(config, scope)
        if numbered { count.step() }
        context {
          let number = if numbered {
            statement-number(config, scope, count.get().first())
          } else { none }
          block(breakable: true)[
            #metadata((kind: "statement", supplement: kind, number: number))
            #let title = if title == auto { kind } else { title }
            #let head = [#title#if number != none {
                if title != [] { [ ] }
                number
              }#if name != none { [ (#name)] }]
            #let head = (
              title-format(head)
                + if suffix == auto {
                  title-format([.])
                } else { suffix }
            )
            #statement-body(head, body)
          ]
        }
      },
    kind: "statement",
    supplement: kind,
    numbering: none,
    outlined: false,
  )
}

#let theorem = statement.with("Theorem")
#let lemma = statement.with("Lemma")
#let proposition = statement.with("Proposition")
#let definition = statement.with("Definition")
#let corollary = statement.with("Corollary", numbered: false)
#let example = statement.with("Example")
#let problem = statement.with("Problem", title: [])
#let subproblem = statement.with(
  "Problem",
  title: [],
  nested: true,
  base-level: 1,
)
#let rule = statement.with("Rule")
#let remark = statement.with("Remark", numbered: false)
#let proof = statement.with("Proof", numbered: false)
#let solution = statement.with("Solution", numbered: false)
#let exercise = statement.with("Exercise", numbered: false)

#let statement-at(target) = {
  let element = query(label(target)).first()
  assert(element.func() == figure and element.kind == "statement")
  let config = element.body.children.first().value
  let scope = statement-scope(config, element.location())
  // The step is inside the figure, immediately after its own location.
  let n = statement-counter(config, scope).at(element.location()).first() + 1
  (
    supplement: config.supplement,
    number: if config.numbered { statement-number(config, scope, n) } else {
      none
    },
  )
}

#let statement-rules(body) = {
  show figure.where(kind: "statement"): it => {
    set block(breakable: true)
    set align(left)
    it.body
  }
  body
}
