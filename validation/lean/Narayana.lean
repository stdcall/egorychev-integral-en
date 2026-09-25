import Mathlib.Data.Nat.Choose.Vandermonde
import Mathlib.Tactic.Ring

open Finset
namespace Egorychev

/-- Corrected convolution preceding (2.36), after j=i-r.
The missing -r in the printed upper index is essential. -/
theorem subgroup_convolution (n r : ℕ) (hr : r < n) :
    (∑ j ∈ range (r + 1),
      (n - 1 - r).choose j * (r + 1).choose (r - j)) =
      n.choose r := by
  have h := Nat.add_choose_eq (n - 1 - r) (r + 1) r
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
  have hn : n - 1 - r + (r + 1) = n := by omega
  simpa only [hn] using h.symm

/-- The complete Narayana row sum used for (2.32), before division by n.
Here the positive book index n is represented by k+1. -/
theorem narayana_row_sum (k : ℕ) :
    (∑ r ∈ range (k + 1),
      (k + 1).choose (r + 1) * (k + 1).choose r) =
      (2 * (k + 1)).choose k := by
  have h := Nat.add_choose_eq (k + 1) (k + 1) k
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
  calc
    _ = ∑ r ∈ range (k + 1),
        (k + 1).choose r * (k + 1).choose (k - r) := by
      apply Finset.sum_congr rfl
      intro r hr
      have hrk := Finset.mem_range.mp hr
      have hs := Nat.choose_symm (n := k + 1) (k := r + 1)
        (by omega)
      have he : k + 1 - (r + 1) = k - r := by omega
      rw [he] at hs
      rw [hs]
      exact Nat.mul_comm _ _
    _ = ((k + 1) + (k + 1)).choose k := h.symm
    _ = _ := by congr 1; omega

end Egorychev
#print axioms Egorychev.subgroup_convolution
#print axioms Egorychev.narayana_row_sum
