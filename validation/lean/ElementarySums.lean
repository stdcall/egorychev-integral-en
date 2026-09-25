import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Tactic.Ring

open Finset

namespace Egorychev

/-- The integer case of (2.1), also valid when the prefix includes zero terms
beyond p. The source assumes q < p. -/
theorem alternating_binomial_prefix (p q : ℕ) (hp : 0 < p) :
    (∑ k ∈ range (q + 1), ((-1) ^ k * p.choose k : ℤ)) =
      (-1) ^ q * (p - 1).choose q := by
  obtain ⟨n, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt hp)
  simpa using (Int.alternating_sum_range_choose_eq_choose (n := n) (m := q))

/-- The polynomial re-expansion used to obtain the right side of (2.8).
Coefficient extraction after multiplication by (1+x)^q is reviewed separately. -/
theorem binomial_reexpansion {R : Type*} [CommRing R]
    (a b x : R) (p : ℕ) :
    (a * x + b) ^ p =
      ∑ k ∈ range (p + 1), (p.choose k : R) * (a - b) ^ (p - k) *
        b ^ k * x ^ (p - k) * (1 + x) ^ k := by
  have h : a * x + b = b * (1 + x) + (a - b) * x := by ring
  rw [h, add_pow]
  apply sum_congr rfl
  intro k _
  rw [mul_pow, mul_pow]
  ring

end Egorychev

#print axioms Egorychev.alternating_binomial_prefix
#print axioms Egorychev.binomial_reexpansion
