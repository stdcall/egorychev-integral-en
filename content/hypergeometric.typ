#let hyper(symbol, left, right, upper, lower, argument) = {
  $
    #math.attach(symbol, bl: [#left], b: [#right])
    lr([#math.mat((upper,), (lower,), delim: none) ";" #argument])
  $
}
