#import "../content/index-style.typ": index-mark, index-style, subject-index

#set page(width: 100mm, height: 100mm, margin: 10mm)
#set text(font: "Libertinus Serif", size: 10pt)
#text[First indexed passage.] <index-test:first>
#index-mark([@index-test:first], group: [Cases], after: [Zebra])[Alpha]
#index-mark([@index-test:first], group: [Cases], after: [Zebra])[Alpha]
#index-mark(none)[Unlisted term]
#index-mark(none, group: [Symbols])[$x_1$]
#index-mark(none, group: [Symbols])[$x_2$]

#if sys.inputs.at("insert", default: "off") == "on" {
  pagebreak()
  [Inserted page.]
  index-mark(none)[New term]
}
#pagebreak()
#text[Second indexed passage.] <index-test:second>
#index-mark([@index-test:second], group: [Cases], after: [Zebra])[Alpha]
#index-mark([@index-test:second], group: [Cases])[Zebra]

#pagebreak()
#show: index-style
#subject-index()
