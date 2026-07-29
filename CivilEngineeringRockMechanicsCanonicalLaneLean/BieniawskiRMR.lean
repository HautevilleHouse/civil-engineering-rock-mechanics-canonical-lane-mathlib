import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure BieniawskiRMRPackage where
  compressiveStrengthRating : Prop
  rqdRating : Prop
  jointSpacingRating : Prop
  jointConditionRating : Prop
  groundwaterRating : Prop

structure BieniawskiRMREvidence (B : BieniawskiRMRPackage) where
  compressiveStrengthRatingClosed : B.compressiveStrengthRating
  rqdRatingClosed : B.rqdRating
  jointSpacingRatingClosed : B.jointSpacingRating
  jointConditionRatingClosed : B.jointConditionRating
  groundwaterRatingClosed : B.groundwaterRating

def BieniawskiRMRClosed (B : BieniawskiRMRPackage) : Prop :=
  B.compressiveStrengthRating ∧ B.rqdRating ∧ B.jointSpacingRating ∧ B.jointConditionRating ∧ B.groundwaterRating

theorem bieniawski_rmr_closed_from_evidence
    (B : BieniawskiRMRPackage) (E : BieniawskiRMREvidence B) :
    BieniawskiRMRClosed B := by
  exact And.intro E.compressiveStrengthRatingClosed
    (And.intro E.rqdRatingClosed
      (And.intro E.jointSpacingRatingClosed
        (And.intro E.jointConditionRatingClosed E.groundwaterRatingClosed)))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse
