import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.Tactic.Abel
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace Egorychev.AlternatingBoundary
open FreeAbelianGroup
variable {α : Type*}

noncomputable def prepend (a : α) :
    FreeAbelianGroup (List α) →+ FreeAbelianGroup (List α) :=
  FreeAbelianGroup.map (List.cons a)

noncomputable def faces : List α → FreeAbelianGroup (List α)
  | [] => 0
  | a :: l => of l - prepend a (faces l)

noncomputable def boundary :
    FreeAbelianGroup (List α) →+ FreeAbelianGroup (List α) :=
  FreeAbelianGroup.lift faces

@[simp] theorem boundary_of (l : List α) : boundary (of l) = faces l := by
  simp [boundary]

@[simp] theorem prepend_of (a : α) (l : List α) :
    prepend a (of l) = of (a :: l) := by
  simp [prepend]

theorem boundary_prepend (a : α) (x : FreeAbelianGroup (List α)) :
    boundary (prepend a x) = x - prepend a (boundary x) := by
  induction x using FreeAbelianGroup.induction_on with
  | zero => simp
  | of l => simp [faces]
  | neg l h => simp only [map_neg, h]; abel
  | add x y hx hy => simp only [map_add, hx, hy]; abel

theorem boundary_faces (l : List α) : boundary (faces l) = 0 := by
  induction l with
  | nil => simp [faces]
  | cons a l ih => simp [faces, boundary_prepend, ih]

theorem boundary_boundary (x : FreeAbelianGroup (List α)) :
    boundary (boundary x) = 0 := by
  induction x using FreeAbelianGroup.induction_on with
  | zero => simp
  | of l => simp [boundary_faces]
  | neg l h => simp only [map_neg, h, neg_zero]
  | add x y hx hy => simp only [map_add, hx, hy, add_zero]

theorem faces_eq_sum (l : List α) :
    faces l = ∑ i ∈ Finset.range l.length,
      ((-1 : ℤ) ^ i) • of (l.eraseIdx i) := by
  induction l with
  | nil => simp [faces]
  | cons a l ih =>
    simp only [faces, List.length_cons, Finset.sum_range_succ',
      List.eraseIdx_cons_zero, pow_zero, one_zsmul, List.eraseIdx_cons_succ]
    rw [ih, map_sum]
    simp only [map_zsmul, prepend_of, pow_succ, mul_neg_one, neg_zsmul]
    rw [Finset.sum_neg_distrib]
    abel

#print axioms faces_eq_sum
#print axioms boundary_prepend
#print axioms boundary_faces
#print axioms boundary_boundary
end Egorychev.AlternatingBoundary
