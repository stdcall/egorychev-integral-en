import Mathlib.Algebra.Group.Basic
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Tactic.Group

/-!
Egorychev6.4, product identity used in6.61–6.65. The convention is
[a,b] = a⁻¹ b⁻¹ a b. The finite product expansion keeps the conjugations
by the full suffix, including an empty suffix. It assumes only a group;
no p-power collection or basis theorem is claimed here.
-/
namespace Egorychev.Collection
variable {G : Type*} [Group G]

def comm (a b : G) : G := a⁻¹ * b⁻¹ * a * b

theorem comm_mul_left (a b c : G) :
    comm (a * b) c = comm a c * comm (comm a c) b * comm b c := by
  unfold comm
  group

def factors (xs : List G) (f : G) : List G :=
  match xs with
  | [] => []
  | x :: ys => (comm x f * comm (comm x f) ys.prod) :: factors ys f

theorem comm_list_prod (xs : List G) (f : G) :
    comm xs.prod f = (factors xs f).prod := by
  induction xs with
  | nil => simp [factors, comm]
  | cons x xs ih =>
    simpa only [List.prod_cons, factors, ← ih] using
      comm_mul_left x xs.prod f

end Egorychev.Collection
#print axioms Egorychev.Collection.comm_mul_left
#print axioms Egorychev.Collection.comm_list_prod
