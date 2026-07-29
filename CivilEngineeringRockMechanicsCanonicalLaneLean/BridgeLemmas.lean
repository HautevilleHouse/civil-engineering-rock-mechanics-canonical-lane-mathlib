import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringRockMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RockMassClassificationClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.rmrValid

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse