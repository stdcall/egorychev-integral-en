#import "../content/book-style.typ": book-style, supplement-numbering
#import "../content/equations.typ": eq, equation-alias

#show: book-style
#set heading(numbering: "1.")
= First chapter <ch:first>
#eq(series: "algorithm", $ a = b $) <eq:algorithm>
Forward reference @eq:later; its variant is @eq:variant.
== First section <sec:first>
#eq($ a = b $) <eq:first>
#if sys.inputs.at("insert", default: "off") == "on" {
  eq($ b = c $)
}
#eq(mark: "*", $ b = c $) <eq:star>
#eq(variant: <eq:later>, $ c = d $) <eq:variant>
$ e = f $
=== Subsection
#eq($ d = e $) <eq:later>
#equation-alias(<eq:pair>) <eq:pair-second>
#eq(count: 2, $ f = g $) <eq:pair>
#eq($ g = h $) <eq:after-pair>
== Next section
#eq($ h = i $) <eq:next-section>
= Next chapter <ch:next>
#eq(mark: "**", $ i = j $) <eq:leading-star>
#eq($ j = k $) <eq:next-chapter>
Earlier formula @eq:first belongs to @ch:first[Chapter], §@sec:first. The pair
is @eq:pair and @eq:pair-second; next is @eq:after-pair.

#counter(heading).update((0, 0))
#set heading(numbering: supplement-numbering)
== Supplement section <supp:first>
#eq(series: "supplement", $ a = b $) <eq:supp-first>
== Another Supplement section
#eq(series: "supplement", $ b = c $) <eq:supp-next>
#eq(series: "supplement", variant: <eq:supp-first>, $ c = d $) <eq:supp-variant>
Supplement references @eq:supp-first, @eq:supp-next and @eq:supp-variant.
