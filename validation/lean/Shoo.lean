import Mathlib.Data.Nat.Choose.Vandermonde
import Mathlib.Tactic.Ring

open Finset
namespace Egorychev

/-- English pp.51–52, final regrouped sum for (2.17), with k=m+j.
The initial residue extraction is reviewed separately. -/
theorem shoo_last_convolution (m n : ℕ) :
    (∑ j ∈ range (m + 1),
      (m + n).choose (m + j) * m.choose (m - j) *
        (m + j).choose m) = ((m + n).choose n) ^ 2 := by
  have factor (j : ℕ) :
      (m + n).choose (m + j) * m.choose (m - j) *
          (m + j).choose m =
        (m + n).choose m * (n.choose j * m.choose (m - j)) := by
    have h := Nat.choose_mul (n := m + n) (k := m + j)
      (s := m) (by omega)
    simp only [Nat.add_sub_cancel_left] at h
    calc
      _ = ((m + n).choose (m + j) * (m + j).choose m) *
          m.choose (m - j) := by ring
      _ = _ := by rw [h]; ring
  simp_rw [factor]
  rw [← Finset.mul_sum]
  have vand : (∑ j ∈ range (m + 1),
      n.choose j * m.choose (m - j)) = (n + m).choose m := by
    rw [Nat.add_choose_eq,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  rw [vand, Nat.add_comm n m]
  have symm : (m + n).choose m = (m + n).choose n := by
    have h := Nat.choose_symm (n := m + n) (k := m) (by omega)
    simpa only [Nat.add_sub_cancel_left] using h.symm
  rw [symm]
  ring

end Egorychev
#print axioms Egorychev.shoo_last_convolution
