#let qbinom(upper, lower, base) = math.attach(
  math.mat((upper,), (lower,), delim: "["),
  b: base,
)
