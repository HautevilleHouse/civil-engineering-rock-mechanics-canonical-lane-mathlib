import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure UndergroundExcavationPackage where
  excavationGeometry : Prop
  inSituStressField : Prop
  inducedStressesComputed : Prop
  supportSystemDesigned : Prop
  factorOfSafety : ℝ
  convergenceConfinementApplied : Prop
  rockSupportInteraction : Prop
  displacementPrediction : Prop
  stressReductionFactor : ℝ

structure UndergroundExcavationEvidence (P : UndergroundExcavationPackage) where
  excavationGeometryClosed : P.excavationGeometry
  inSituStressFieldClosed : P.inSituStressField
  inducedStressesComputedClosed : P.inducedStressesComputed
  supportSystemDesignedClosed : P.supportSystemDesigned
  convergenceConfinementAppliedClosed : P.convergenceConfinementApplied
  rockSupportInteractionClosed : P.rockSupportInteraction
  displacementPredictionClosed : P.displacementPrediction

def UndergroundExcavationClosed (P : UndergroundExcavationPackage) : Prop :=
  P.excavationGeometry ∧ P.inSituStressField ∧ P.inducedStressesComputed ∧
  P.supportSystemDesigned ∧ P.convergenceConfinementApplied ∧
  P.rockSupportInteraction ∧ P.displacementPrediction

theorem underground_excavation_closed_from_evidence
    (P : UndergroundExcavationPackage) (E : UndergroundExcavationEvidence P) :
    UndergroundExcavationClosed P := by
  exact And.intro E.excavationGeometryClosed (And.intro E.inSituStressFieldClosed (And.intro E.inducedStressesComputedClosed (And.intro E.supportSystemDesignedClosed (And.intro E.convergenceConfinementAppliedClosed (And.intro E.rockSupportInteractionClosed E.displacementPredictionClosed)))))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse