import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure SupportPressurePackage where
  tunnelDepth : ℝ
  rockMassRating : Nat
  supportPressure : ℝ
  deformationModulus : ℝ
  empiricalFormulaValid : Prop

structure SupportPressureEvidence (S : SupportPressurePackage) where
  tunnelDepthClosed : S.tunnelDepth > 0.0
  rockMassRatingClosed : S.rockMassRating ≥ 0
  supportPressureClosed : S.supportPressure ≥ 0.0
  deformationModulusClosed : S.deformationModulus > 0.0
  empiricalFormulaValidClosed : S.empiricalFormulaValid

def SupportPressureClosed (S : SupportPressurePackage) : Prop :=
  S.tunnelDepth > 0.0 ∧ S.rockMassRating ≥ 0 ∧
  S.supportPressure ≥ 0.0 ∧ S.deformationModulus > 0.0 ∧ S.empiricalFormulaValid

theorem support_pressure_closed_from_evidence
    (S : SupportPressurePackage) (E : SupportPressureEvidence S) :
    SupportPressureClosed S := by
  exact And.intro E.tunnelDepthClosed
    (And.intro E.rockMassRatingClosed
      (And.intro E.supportPressureClosed
        (And.intro E.deformationModulusClosed E.empiricalFormulaValidClosed)))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse