import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure StressStrainModel where
  elasticModulus : ℝ
  poissonRatio : ℝ
  uniaxialCompressiveStrength : ℝ
  stressStrainCurve : ℝ → ℝ
  modelValid : elasticModulus > 0 ∧ poissonRatio > 0 ∧ uniaxialCompressiveStrength > 0

structure StressStrainEvidence (S : StressStrainModel) where
  modelValidClosed : S.modelValid

def StressStrainModelClosed (S : StressStrainModel) : Prop :=
  S.modelValid

theorem stress_strain_model_closed_from_evidence (S : StressStrainModel) (E : StressStrainEvidence S) : StressStrainModelClosed S := by
  exact E.modelValidClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse