import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure RockMassClassification where
  rmrValue : ℝ
  rmrRange : ℝ × ℝ
  gsiValue : ℝ
  jointCondition : Prop
  intactRockStrength : Prop
  rmrValid : rmrValue ≥ fst rmrRange ∧ rmrValue ≤ snd rmrRange
  gsiPositive : gsiValue ≥ 0

structure RockMassEvidence (R : RockMassClassification) where
  rmrValidClosed : R.rmrValid
  gsiPositiveClosed : R.gsiPositive

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse