import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringRockMechanicsCanonicalLaneLean.UnconfinedCompressiveStrength
import HautevilleHouse.CivilEngineeringRockMechanicsCanonicalLaneLean.TriaxialCompression
import HautevilleHouse.CivilEngineeringRockMechanicsCanonicalLaneLean.SlopeStability

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

def ConstrainedRockMechanicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_rock_mechanics_endgame (A : AdmissibleClass) : ConstrainedRockMechanicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse