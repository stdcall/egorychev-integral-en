import Mathlib.Data.Nat.Choose.Sum
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.Tactic.Ring

/-!
Egorychev (AMS, 1984), §1.5.2–1.5.3, printed pp. 27–28.

Two algebraic steps, for arbitrary finite size and a commutative ring:
* Grosswald (1.41), after clearing its powers of 1+v. This proves the
  polynomial reduction, not the original reindexing or residue extraction.
* The transpose/row versus column scaling in the Carlitz Jacobian.
  This proves equality of the determinant conventions, not convergence or
  the multivariate coefficient theorem and not its reciprocal placement.
-/

namespace Egorychev
open scoped BigOperators

theorem grosswald_polynomial_reduction {R : Type*} [CommRing R]
    (n : ℕ) (v : R) :
    (∑ k ∈ Finset.range (n + 1),
      (n.choose k : R) * (-2 * v) ^ k * (1 + v) ^ (2 * n - k)) =
    (1 - v ^ 2) ^ n := by
  calc
    _ = (1 + v) ^ n * ∑ k ∈ Finset.range (n + 1),
        (-2 * v) ^ k * (1 + v) ^ (n - k) * (n.choose k : R) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro k hk
      have hk' : k ≤ n := Nat.le_of_lt_succ (Finset.mem_range.mp hk)
      have hexp : 2 * n - k = n + (n - k) := by omega
      rw [hexp, pow_add]
      ring
    _ = (1 + v) ^ n * (-2 * v + (1 + v)) ^ n := by rw [← add_pow]
    _ = ((1 + v) * (-2 * v + (1 + v))) ^ n := by rw [mul_pow]
    _ = (1 - v ^ 2) ^ n := by congr 1; ring

theorem carlitz_jacobian_transpose {ι R : Type*}
    [Fintype ι] [DecidableEq ι] [CommRing R]
    (A : Matrix ι ι R) (x : ι → R) :
    Matrix.det (1 - Matrix.diagonal x * A.transpose) =
    Matrix.det (1 - Matrix.diagonal x * A) := by
  rw [← Matrix.det_transpose]
  simp only [Matrix.transpose_sub, Matrix.transpose_one,
    Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.diagonal_transpose]
  exact Matrix.det_one_sub_mul_comm A (Matrix.diagonal x)

end Egorychev

#print axioms Egorychev.grosswald_polynomial_reduction
#print axioms Egorychev.carlitz_jacobian_transpose
