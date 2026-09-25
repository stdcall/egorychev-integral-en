import Mathlib.Data.Nat.Choose.Sum

open Finset
namespace Egorychev

/-- The central term must be retained when splitting an even binomial row.
This is the correction required by the reciprocal-residue argument in
Theorem 2.2.2; it is valid for every natural n, including zero. -/
theorem even_binomial_half (n : ℕ) :
    2 * (∑ j ∈ range n, (2 * n).choose j) + (2 * n).choose n =
      4 ^ n := by
  have hs : (∑ j ∈ range n, (2 * n).choose (2 * n - j)) =
      ∑ j ∈ range n, (2 * n).choose j := by
    apply sum_congr rfl
    intro j hj
    exact Nat.choose_symm (by have := mem_range.mp hj; omega)
  have hr : (∑ j ∈ range n, (2 * n).choose (2 * n - j)) =
      ∑ j ∈ Ico (n + 1) (2 * n + 1), (2 * n).choose j := by
    rw [range_eq_Ico, sum_Ico_reflect _ _ (by omega)]
    have he : 2 * n + 1 - n = n + 1 := by omega
    simp only [he, Nat.sub_zero]
  calc
    _ = (∑ j ∈ range (n + 1), (2 * n).choose j) +
        ∑ j ∈ Ico (n + 1) (2 * n + 1), (2 * n).choose j := by
      rw [sum_range_succ, ← hr, hs]
      omega
    _ = ∑ j ∈ range (2 * n + 1), (2 * n).choose j :=
      sum_range_add_sum_Ico _ (by omega)
    _ = 2 ^ (2 * n) := Nat.sum_range_choose (2 * n)
    _ = 4 ^ n := by rw [pow_mul]; rfl

/-- The odd row has no unpaired central term. -/
theorem odd_binomial_half (n : ℕ) :
    (∑ j ∈ range (n + 1), (2 * n + 1).choose j) = 4 ^ n :=
  Nat.sum_range_choose_halfway n

end Egorychev
#print axioms Egorychev.even_binomial_half
#print axioms Egorychev.odd_binomial_half
