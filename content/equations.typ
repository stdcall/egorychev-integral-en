// Labels attach to native equations; references use ordinary @label syntax.
#let equation-scope(config, loc) = if config.series == "main" {
  (counter(heading).at(loc).first(),)
} else { () }

#let equation-counter(config, scope) = counter(
  "equations:" + config.series + ":" + repr(scope),
)

#let equation-at(target, offset: 0) = {
  let element = query(target).first()
  if element.func() == metadata {
    return equation-at(element.value.target, offset: element.value.offset)
  }
  let config = element.supplement.value
  let scope = equation-scope(config, element.location())
  let n = equation-counter(config, scope).at(element.location()).first() + 1
  (
    number: if config.mark != none { config.mark } else if config.variant
      != none {
      equation-at(config.variant).number + "′"
    } else { numbering("1.1", ..scope, n + offset) },
  )
}

#let equation-number(config, scope, n) = {
  if config.mark != none { return config.mark }
  if config.variant != none {
    return equation-at(config.variant).number + "′"
  }
  numbering("1.1", ..scope, n)
}

#let eq(body, series: "main", variant: none, mark: none, count: 1) = {
  let config = (
    series: series,
    variant: variant,
    mark: mark,
    count: count,
  )
  math.equation(
    block: true,
    supplement: metadata(config),
    numbering: _ => context {
      let scope = equation-scope(config, here())
      let n = equation-counter(config, scope).get().first()
      let numbers = if variant != none or mark != none {
        (equation-number(config, scope, n),)
      } else {
        range(n - count + 1, n + 1).map(n => equation-number(config, scope, n))
      }
      metadata((kind: "equation-number", numbers: numbers))
      numbers.map(n => [(#n)]).join(linebreak())
    },
    body,
  )
}

// An explicit second name for a display carrying two consecutive numbers.
#let equation-alias(target, offset: 1) = metadata((
  kind: "equation-alias",
  target: target,
  offset: offset,
))

#let equation-rules(body) = {
  show math.equation: it => {
    if type(it.supplement) == content and it.supplement.func() == metadata {
      let config = it.supplement.value
      if config.variant == none and config.mark == none {
        equation-counter(config, equation-scope(config, it.location())).update(
          n => n + config.count,
        )
      }
    }
    it
  }
  body
}
