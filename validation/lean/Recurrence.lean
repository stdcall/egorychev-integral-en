import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Tactic.Ring

/-!
Egorychev (1984), (1.60)–(1.65), printed pp. 35–36.
The polynomial continuation of (x^n-y^n)/(x-y) gives the unique solution
of the recurrence for arbitrary roots, including coincident or zero roots.
Here beta=x+y and gamma=-x*y. This does not formalize the generating-function
or analytic contour derivation, or the earlier inverse-series formulas.
-/
namespace Egorychev
open scoped BigOperators

def dividedPower {R : Type*} [CommRing R] (x y : R) (n : ℕ) : R :=
  ∑ i ∈ Finset.range n, x ^ i * y ^ (n - 1 - i)

private theorem dividedPower_succ {R : Type*} [CommRing R]
    (x y : R) (n : ℕ) :
    dividedPower x y (n + 1) = x ^ n + y * dividedPower x y n := by
  simpa [dividedPower] using (geom_sum₂_succ_eq x y (n := n))

private theorem dividedPower_rec {R : Type*} [CommRing R]
    (x y : R) (n : ℕ) :
    dividedPower x y (n + 2) =
      (x + y) * dividedPower x y (n + 1) - x * y * dividedPower x y n := by
  calc
    _ = x ^ (n + 1) + y * dividedPower x y (n + 1) :=
      dividedPower_succ x y (n + 1)
    _ = _ := by rw [dividedPower_succ, pow_succ]; ring

def recurrenceSolution {R : Type*} [CommRing R]
    (a0 a1 x y : R) (n : ℕ) : R :=
  (a1 - (x + y) * a0) * dividedPower x y n + a0 * dividedPower x y (n + 1)

private theorem solution_zero {R : Type*} [CommRing R] (a0 a1 x y : R) :
    recurrenceSolution a0 a1 x y 0 = a0 := by
  simp [recurrenceSolution, dividedPower]

private theorem solution_one {R : Type*} [CommRing R] (a0 a1 x y : R) :
    recurrenceSolution a0 a1 x y 1 = a1 := by
  simp [recurrenceSolution, dividedPower, Finset.sum_range_succ]
  ring

theorem recurrenceSolution_rec {R : Type*} [CommRing R]
    (a0 a1 x y : R) (n : ℕ) :
    recurrenceSolution a0 a1 x y (n + 2) =
      (x + y) * recurrenceSolution a0 a1 x y (n + 1) -
      x * y * recurrenceSolution a0 a1 x y n := by
  dsimp [recurrenceSolution]
  rw [show n + 2 + 1 = (n + 1) + 2 by omega]
  rw [dividedPower_rec x y (n + 1), dividedPower_rec x y n]
  ring

theorem recurrenceSolution_unique {R : Type*} [CommRing R]
    (a0 a1 x y : R) (a : ℕ → R) (h0 : a 0 = a0) (h1 : a 1 = a1)
    (hr : ∀ n, a (n + 2) = (x + y) * a (n + 1) - x * y * a n) :
    ∀ n, a n = recurrenceSolution a0 a1 x y n := by
  intro n
  induction n using Nat.twoStepInduction with
  | zero => rw [h0, solution_zero]
  | one => rw [h1, solution_one]
  | more n ih0 ih1 => rw [hr, ih0, ih1, recurrenceSolution_rec]

theorem dividedPower_mul {R : Type*} [CommRing R] (x y : R) (n : ℕ) :
    dividedPower x y n * (x - y) = x ^ n - y ^ n :=
  geom_sum₂_mul x y n

theorem dividedPower_diagonal {R : Type*} [CommRing R] (x : R) (n : ℕ) :
    dividedPower x x n = (n : R) * x ^ (n - 1) :=
  geom_sum₂_self x n

end Egorychev

#print axioms Egorychev.recurrenceSolution_rec
#print axioms Egorychev.recurrenceSolution_unique
#print axioms Egorychev.dividedPower_mul
#print axioms Egorychev.dividedPower_diagonal
