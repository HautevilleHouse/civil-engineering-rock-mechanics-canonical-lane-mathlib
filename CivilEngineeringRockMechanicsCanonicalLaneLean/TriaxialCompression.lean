import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure TriaxialSpecimen where
  confiningPressure : ℝ
  deviatorStress : ℝ
  porePressure : ℝ
  drained : Bool

structure TriaxialSpecimenEvidence (S : TriaxialSpecimen) where
  confiningPressurePositive : S.confiningPressure > 0
  deviatorStressPositive : S.deviatorStress > 0
  drainedCondition : S.drained

def TriaxialSpecimenClosed (S : TriaxialSpecimen) : Prop :=
  S.confiningPressure > 0 ∧ S.deviatorStress > 0 ∧ S.drained

theorem triaxial_specimen_closed_from_evidence (S : TriaxialSpecimen) (E : TriaxialSpecimenEvidence S) : TriaxialSpecimenClosed S := by
  exact And.intro E.confiningPressurePositive (And.intro E.deviatorStressPositive E.drainedCondition)

structure MohrCoulombFailureCriterion where
  cohesion : ℝ
  frictionAngle : ℝ
  cohesionPositive : cohesion > 0
  frictionAngleInRange : 0 < frictionAngle ∧ frictionAngle < π / 2

structure MohrCoulombFailureCriterionEvidence (M : MohrCoulombFailureCriterion) where
  cohesionPositiveClosed : M.cohesionPositive
  frictionAngleInRangeClosed : M.frictionAngleInRange

def MohrCoulombFailureCriterionClosed (M : MohrCoulombFailureCriterion) : Prop :=
  M.cohesionPositive ∧ M.frictionAngleInRange

theorem mohr_coulomb_closed_from_evidence (M : MohrCoulombFailureCriterion) (E : MohrCoulombFailureCriterionEvidence M) : MohrCoulombFailureCriterionClosed M := by
  exact And.intro E.cohesionPositiveClosed E.frictionAngleInRangeClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse