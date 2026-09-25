import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.Ring.Basic

open Finset

namespace Egorychev

/-- A nonconstant real projection of positively weighted support has strictly
positive squared deviation about any centre. This is the finite-support
positivity step for the covariance Hessian in (4.53), not the analytic
saddle-point estimate or a claim about an infinite sum. -/
theorem weighted_projection_variance_pos {ι R : Type*} [Fintype ι]
    [CommRing R] [LinearOrder R] [IsStrictOrderedRing R]
    (w x : ι → R) (centre : R) (hw : ∀ i, 0 < w i)
    (hx : ∃ i j, x i ≠ x j) :
    0 < ∑ i, w i * (x i - centre) ^ 2 := by
  classical
  apply Finset.sum_pos'
  · intro i _
    exact mul_nonneg (le_of_lt (hw i)) (sq_nonneg _)
  · obtain ⟨i, j, hij⟩ := hx
    have h : ∃ k, x k ≠ centre := by
      by_cases hi : x i = centre
      · exact ⟨j, fun hj => hij (hi.trans hj.symm)⟩
      · exact ⟨i, hi⟩
    obtain ⟨k, hk⟩ := h
    exact ⟨k, Finset.mem_univ k, mul_pos (hw k)
      (sq_pos_of_ne_zero (sub_ne_zero.mpr hk))⟩

end Egorychev

#print axioms Egorychev.weighted_projection_variance_pos
