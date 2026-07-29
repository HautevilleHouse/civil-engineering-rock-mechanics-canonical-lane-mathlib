import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure SlopeStability where
  slopeAngle : Float
  jointDip : Float
  jointDipDir : Float
  slopeDipDir : Float
  frictionAngle : Float
  planarFailurePossible : Prop
  wedgeFailurePossible : Prop
  topplingFailurePossible : Prop
  planarCondition : planarFailurePossible ↔ (abs (jointDipDir - slopeDipDir) < 20 ∧ jointDip < slopeAngle)
  wedgeCondition : wedgeFailurePossible ↔ (abs (jointDipDir - slopeDipDir) > 20 ∧ jointDip < slopeAngle)
  topplingCondition : topplingFailurePossible ↔ (jointDip > 90 - slopeAngle + frictionAngle)

def SlopeStabilityKinematicsClosed (S : SlopeStability) : Prop :=
  S.planarCondition ∧ S.wedgeCondition ∧ S.topplingCondition

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse