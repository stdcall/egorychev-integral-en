#import "../content/book-style.typ": book-style
#import "../content/statements.typ": *
#import "../content/supp-statements.typ" as supp

#show: book-style
#set heading(numbering: "1.")
= Chapter
== First section
#theorem[First statement.] <first>
#lemma[An independent counter.] <lemma>
#corollary[An unnumbered statement.] <unnumbered>
The reference @unnumbered has no number.
#if sys.inputs.at("insert", default: "off") == "on" {
  theorem[Inserted statement.]
}
=== A subsection
#theorem[A subsection does not reset the theorem counter.] <later>
Both @later and @later refer to this statement. #rule[First rule.] <rule-first>
=== Another subsection
#rule[The rules restart.] <rule-next>
== Second section
#theorem[The theorems restart.] <section-next>
#definition(prefix: (1, 1))[The retained prefix is an explicit exception.] <def>

#counter(heading).update((0, 1))
#supp.theorem[The first statement in the Supplement.] <supp-first>
#supp.proposition[Propositions share the theorem counter.] <supp-prop>
#supp.corollary[So do corollaries.] <supp-cor>
#supp.lemma[Lemmas have their own counter.] <supp-lemma>
#counter(heading).update((0, 2))
#supp.theorem[The next section restarts the shared counter.] <supp-next>

#counter(heading).update(7)
#problem(base-level: 1, prefix: ())[An open problem.] <open-first>
#subproblem[A subproblem.] <open-sub>
#problem(base-level: 1, prefix: ())[Another open problem.] <open-next>
#subproblem[The subproblem counter restarts.] <open-sub-next>

// A long nested body must remain breakable and reach the PDF intact.
#set page(height: 100mm)
#proof[
  #enum(
    [#lorem(250) #text(hyphenate: false)[FLOWFIRSTEND]],
    [#lorem(250) #text(hyphenate: false)[FLOWSECONDEND]],
    [#lorem(250) #text(hyphenate: false)[FLOWTHIRDEND]],
  )
]
