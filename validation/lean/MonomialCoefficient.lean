import Mathlib.Algebra.GroupWithZero.Units.Basic
import Mathlib.Algebra.Ring.Int.Defs
import Mathlib.Logic.Function.Basic

/-!
Egorychev (AMS, 1984), §1.2, rule 3, formula (1.9), printed p. 14.

There are n+1 original variables and m independent auxiliary variables.
Their exponents are integers, including negative integers. Coefficients
are arbitrary functions: no finite-support or convergence assumption is
used. An injective exponent map transports each coefficient to its unique
image and assigns zero off the image, via Function.extend.

This certifies the coefficient-extraction step, not analytic substitution,
closure of a chosen Laurent-series ring, or the later change-of-variables
theorem. An identification of variables needs a separately injective map.
-/

namespace Egorychev

abbrev Exponents (n : ℕ) := ℤ × (Fin n → ℤ)

def monomialExponent {n m : ℕ} (beta : ℤ) (aux : Fin m → ℤ)
    (r : Exponents n) : Exponents n × (Fin m → ℤ) :=
  ((beta * r.1, r.2), fun j => aux j * r.1)

theorem monomialExponent_injective {n m : ℕ} {beta : ℤ}
    (hbeta : beta ≠ 0) (aux : Fin m → ℤ) :
    Function.Injective (monomialExponent (n := n) beta aux) := by
  intro r s h
  apply Prod.ext
  · exact mul_left_cancel₀ hbeta (congrArg (fun t => t.1.1) h)
  · exact congrArg (fun t => t.1.2) h

def shiftExponent {n : ℕ} (k r : Exponents n) : Exponents n :=
  (r.1 - k.1, fun i => r.2 i - k.2 i)

theorem shiftExponent_injective {n : ℕ} (k : Exponents n) :
    Function.Injective (shiftExponent k) := by
  intro r s h
  apply Prod.ext
  · exact sub_left_inj.mp (congrArg Prod.fst h)
  · funext i
    exact sub_left_inj.mp (congrArg (fun t => t.2 i) h)

noncomputable def substitutedCoefficient {n m : ℕ} {K : Type*}
    [MonoidWithZero K]
    (beta : ℤ) (aux : Fin m → ℤ) (alpha : Kˣ)
    (k : Exponents n) (a : Exponents n → K) :
    Exponents n × (Fin m → ℤ) → K :=
  Function.extend
    (fun r => monomialExponent beta aux (shiftExponent k r))
    (fun r => a r * ((alpha ^ (r.1 - k.1) : Kˣ) : K))
    (fun _ => 0)

/-- Formula (1.9) after moving the extraction factors into the exponents:
the coefficient of exponent zero after substitution is the original a_k.
The unit alpha models the required nonzero scalar over a field. -/
theorem monomial_substitution_constant_coefficient
    {n m : ℕ} {K : Type*} [MonoidWithZero K]
    {beta : ℤ} (hbeta : beta ≠ 0) (aux : Fin m → ℤ)
    (alpha : Kˣ) (k : Exponents n) (a : Exponents n → K) :
    substitutedCoefficient beta aux alpha k a
      ((0, fun _ => 0), fun _ => 0) = a k := by
  have hinj : Function.Injective
      (fun r => monomialExponent beta aux (shiftExponent k r)) :=
    (monomialExponent_injective hbeta aux).comp
      (shiftExponent_injective k)
  have hzero : monomialExponent beta aux (shiftExponent k k) =
      ((0, fun _ => 0), fun _ => 0) := by
    simp [monomialExponent, shiftExponent]
  unfold substitutedCoefficient
  rw [← hzero]
  simpa using hinj.extend_apply
    (fun r => a r * ((alpha ^ (r.1 - k.1) : Kˣ) : K))
    (fun _ => 0) k

end Egorychev

#print axioms Egorychev.monomialExponent_injective
#print axioms Egorychev.shiftExponent_injective
#print axioms Egorychev.monomial_substitution_constant_coefficient
