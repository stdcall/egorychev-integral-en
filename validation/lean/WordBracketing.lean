import Mathlib.Data.List.Basic

/-!
Egorychev6.3.1, proof of6.46–6.47. A nonassociative word has a unique
leftmost letter and ordered list of right subtrees along its left spine.
This formalizes the structural inverse used when undoing the initial
bracketing. Regularity, ordering, and the partition of the image are not
formalized here, nor is any Lie-algebra basis theorem.
-/
namespace Egorychev

inductive BracketWord (α : Type*) where
  | leaf : α → BracketWord α
  | node : BracketWord α → BracketWord α → BracketWord α

namespace BracketWord
variable {α : Type*}

def spine : BracketWord α → α × List (BracketWord α)
  | leaf a => (a, [])
  | node u v => ((spine u).1, (spine u).2 ++ [v])

def join (a : α) (xs : List (BracketWord α)) : BracketWord α :=
  xs.foldl node (leaf a)

theorem spine_foldl (w : BracketWord α) (xs : List (BracketWord α)) :
    spine (xs.foldl node w) = ((spine w).1, (spine w).2 ++ xs) := by
  induction xs generalizing w with
  | nil => simp
  | cons v xs ih => simp [List.foldl_cons, ih, spine, List.append_assoc]

theorem spine_join (a : α) (xs : List (BracketWord α)) :
    spine (join a xs) = (a, xs) := by
  simp [join, spine_foldl, spine]

theorem join_spine (w : BracketWord α) :
    join (spine w).1 (spine w).2 = w := by
  induction w with
  | leaf a => rfl
  | node u v ihu ihv =>
    simpa [join, spine, List.foldl_append] using
      congrArg (fun t => node t v) ihu

theorem join_injective :
    Function.Injective (fun p : α × List (BracketWord α) => join p.1 p.2) := by
  intro p q h
  have := congrArg spine h
  simpa only [spine_join, Prod.eta] using this

end BracketWord
end Egorychev
#print axioms Egorychev.BracketWord.spine_foldl
#print axioms Egorychev.BracketWord.spine_join
#print axioms Egorychev.BracketWord.join_spine
#print axioms Egorychev.BracketWord.join_injective
