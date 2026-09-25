import Mathlib.LinearAlgebra.Matrix.SchurComplement

/-!
Egorychev (AMS, 1984), (5.18)–(5.19), printed p. 153.
The derivative of v_i = w_i - t_i * sum_j w_j has entries delta_ij - t_i.
This proves its determinant for any finite index set and commutative ring.
The contour homology and nonlinear Jacobian are separate written arguments.
-/
namespace Egorychev
open scoped BigOperators

theorem dyson_linear_determinant {ι R : Type*}
    [Fintype ι] [DecidableEq ι] [CommRing R] (t : ι → R) :
    Matrix.det (1 - (Matrix.of (fun i _ : ι => t i))) = 1 - ∑ i, t i := by
  have h := Matrix.det_one_add_replicateCol_mul_replicateRow
    (ι := Unit) (fun i => -t i) (fun _ => (1 : R))
  have hmat : Matrix.replicateCol Unit (fun i => -t i) *
      Matrix.replicateRow Unit (fun _ => (1 : R)) =
      -(Matrix.of (fun i _ : ι => t i)) := by
    ext i j
    simp [Matrix.mul_apply]
  rw [hmat] at h
  simpa [dotProduct, sub_eq_add_neg] using h
end Egorychev
#print axioms Egorychev.dyson_linear_determinant
