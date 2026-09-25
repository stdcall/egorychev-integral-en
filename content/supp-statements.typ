#import "statements.typ": statement

#let theorem = statement.with("Theorem", supplement: true)
#let lemma = statement.with("Lemma", supplement: true)
#let proposition = statement.with("Proposition", supplement: true)
#let corollary = statement.with("Corollary", supplement: true)
#let example = statement.with("Example", supplement: true)
#let remark = statement.with("Remark", supplement: true)
#let proof = statement.with(
  "Proof",
  numbered: false,
  title-format: emph,
  suffix: [.],
)
