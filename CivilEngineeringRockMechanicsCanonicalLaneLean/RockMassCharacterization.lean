import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure RockMassCharacterizationPackage where
  jointOrientationData : Prop
  jointSpacingMeasured : Prop
  jointConditionAssessed : Prop
  groundwaterConditions : Prop
  rockQualityDesignation : ℝ
  rockMassRatingComputed : ℝ
  geologicalStrengthIndexComputed : ℝ
  intactRockStrength : ℝ
  modulusOfDeformation : ℝ
  hoekBrownConstantsDerived : Prop
  classificationConsistency : Prop

structure RockMassCharacterizationEvidence (P : RockMassCharacterizationPackage) where
  jointOrientationDataClosed : P.jointOrientationData
  jointSpacingMeasuredClosed : P.jointSpacingMeasured
  jointConditionAssessedClosed : P.jointConditionAssessed
  groundwaterConditionsClosed : P.groundwaterConditions
  hoekBrownConstantsDerivedClosed : P.hoekBrownConstantsDerived
  classificationConsistencyClosed : P.classificationConsistency

def RockMassCharacterizationClosed (P : RockMassCharacterizationPackage) : Prop :=
  P.jointOrientationData ∧ P.jointSpacingMeasured ∧ P.jointConditionAssessed ∧
  P.groundwaterConditions ∧ P.hoekBrownConstantsDerived ∧ P.classificationConsistency

theorem rock_mass_characterization_closed_from_evidence
    (P : RockMassCharacterizationPackage) (E : RockMassCharacterizationEvidence P) :
    RockMassCharacterizationClosed P := by
  exact And.intro E.jointOrientationDataClosed (And.intro E.jointSpacingMeasuredClosed (And.intro E.jointConditionAssessedClosed (And.intro E.groundwaterConditionsClosed (And.intro E.hoekBrownConstantsDerivedClosed E.classificationConsistencyClosed))))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse