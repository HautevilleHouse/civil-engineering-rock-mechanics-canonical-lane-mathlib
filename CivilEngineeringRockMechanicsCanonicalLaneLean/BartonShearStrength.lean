import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure BartonShearParameters where
  JRC : Float
  JCS : Float
  phi_r : Float
  shearStress : Float -> Float
  shearStressTerm : shearStress = (fun sigma_n => sigma_n * tan (phi_r + JRC * log10 (JCS / sigma_n)))

def BartonShearStrengthClosed (B : BartonShearParameters) : Prop := B.shearStressTerm

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse