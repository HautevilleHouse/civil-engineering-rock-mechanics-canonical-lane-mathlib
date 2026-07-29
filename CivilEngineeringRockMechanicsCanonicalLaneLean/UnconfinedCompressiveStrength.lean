import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure UCSpecimenParameters where
  diameter : ℝ
  length : ℝ
  moistureContent : ℝ
  loadingRate : ℝ

structure UCSpecimen where
  parameters : UCSpecimenParameters
  failureLoad : ℝ
  intact : Prop

structure UCSpecimenEvidence (S : UCSpecimen) where
  diameterPositive : S.parameters.diameter > 0
  lengthPositive : S.parameters.length > 0
  loadingRatePositive : S.parameters.loadingRate > 0
  failureLoadPositive : S.failureLoad > 0
  intactClosed : S.intact

def UCSpecimenClosed (S : UCSpecimen) : Prop :=
  S.parameters.diameter > 0 ∧ S.parameters.length > 0 ∧ S.parameters.loadingRate > 0 ∧ S.failureLoad > 0 ∧ S.intact

theorem ucspecimen_closed_from_evidence (S : UCSpecimen) (E : UCSpecimenEvidence S) : UCSpecimenClosed S := by
  exact And.intro E.diameterPositive
    (And.intro E.lengthPositive
      (And.intro E.loadingRatePositive
        (And.intro E.failureLoadPositive E.intactClosed)))

structure UnconfinedCompressiveStrength (S : UCSpecimen) where
  ucsValue : ℝ
  ucsIsFailureLoadOverArea : ucsValue = S.failureLoad / (π * (S.parameters.diameter / 2)^2)

def UnconfinedCompressiveStrengthClosed {S : UCSpecimen} (U : UnconfinedCompressiveStrength S) : Prop :=
  U.ucsValue = U.ucsValue ∧ U.ucsIsFailureLoadOverArea

theorem ucs_closed (S : UCSpecimen) (U : UnconfinedCompressiveStrength S) : UnconfinedCompressiveStrengthClosed U := by
  exact And.intro rfl U.ucsIsFailureLoadOverArea

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse