import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure MohrCoulombParameters where
  cohesion : Float
  frictionAngle : Float
  tensileStrength : Float
  failureEnvelope : Float -> Float
  failureEnvelopeTerm : failureEnvelope = (fun sigma_n => cohesion + sigma_n * tan frictionAngle)

def MohrCoulombFailureClosed (M : MohrCoulombParameters) : Prop := M.failureEnvelopeTerm

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse