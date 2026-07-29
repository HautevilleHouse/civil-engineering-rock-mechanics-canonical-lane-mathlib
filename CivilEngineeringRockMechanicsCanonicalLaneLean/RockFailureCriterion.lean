import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure RockFailureCriterionPackage where
  mohrCoulombModel : Prop
  hoekBrownModel : Prop
  hoekBrownConstantMi : ℝ
  hoekBrownConstantGs : ℝ
  rockMassRating : ℝ
  geologicalStrengthIndex : ℝ
  disturbanceFactor : ℝ
  unconfinedCompressiveStrength : ℝ
  tensileStrength : ℝ
  shearStrength : ℝ
  failureEnvelopeComputed : Prop
  parameterConsistency : Prop

structure RockFailureCriterionEvidence (P : RockFailureCriterionPackage) where
  mohrCoulombModelClosed : P.mohrCoulombModel
  hoekBrownModelClosed : P.hoekBrownModel
  failureEnvelopeComputedClosed : P.failureEnvelopeComputed
  parameterConsistencyClosed : P.parameterConsistency

def RockFailureCriterionClosed (P : RockFailureCriterionPackage) : Prop :=
  P.mohrCoulombModel ∧ P.hoekBrownModel ∧ P.failureEnvelopeComputed ∧ P.parameterConsistency

theorem rock_failure_criterion_closed_from_evidence
    (P : RockFailureCriterionPackage) (E : RockFailureCriterionEvidence P) :
    RockFailureCriterionClosed P := by
  exact And.intro E.mohrCoulombModelClosed (And.intro E.hoekBrownModelClosed (And.intro E.failureEnvelopeComputedClosed E.parameterConsistencyClosed))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse