import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure FailureCriterion where
  hoekBrownParameter : ℝ
  mohrCoulombCohesion : ℝ
  frictionAngle : ℝ
  tensileStrength : ℝ
  criterionValid : hoekBrownParameter ≥ 0 ∧ mohrCoulombCohesion ≥ 0 ∧ frictionAngle ≥ 0 ∧ tensileStrength ≤ 0

structure FailureEvidence (F : FailureCriterion) where
  criterionValidClosed : F.criterionValid

def FailureCriterionClosed (F : FailureCriterion) : Prop :=
  F.criterionValid

theorem failure_criterion_closed_from_evidence (F : FailureCriterion) (E : FailureEvidence F) : FailureCriterionClosed F := by
  exact E.criterionValidClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse