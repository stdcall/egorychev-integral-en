import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Ring

open Finset
namespace Egorychev

/-- Division-free finite Lerch identity, for every prefix length. The
recurrence is the ratio of successive binomial-quotient summands, not the
summation conclusion. Its interpretation in the book is checked separately. -/
theorem lerch_prefix {K : Type*} [CommRing K] (u v : K) (b : ℕ → K)
    (m : ℕ)
    (h : ∀ i < m, (v - (i : K)) * b (i + 1) = (u - (i : K)) * b i) :
    (v - u + 1) * (∑ i ∈ range m, b i) =
      (v + 1) * b 0 - (v - (m : K) + 1) * b m := by
  induction m with
  | zero => simp
  | succ m ih =>
    have hp := ih (fun i hi => h i (Nat.lt_trans hi (Nat.lt_succ_self m)))
    have hs := h m (Nat.lt_succ_self m)
    rw [sum_range_succ, mul_add, hp]
    push_cast
    calc
      _ = (v + 1) * b 0 - (v - m) * b (m + 1) := by
        rw [hs]
        ring
      _ = _ := by ring

end Egorychev
#print axioms Egorychev.lerch_prefix
