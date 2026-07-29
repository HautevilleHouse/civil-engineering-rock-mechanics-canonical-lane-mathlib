import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure RockMassDeformationPackage where
  modulusOfDeformation : Prop
  poissonRatio : Prop

structure RockMassDeformationEvidence (D : RockMassDeformationPackage) where
  modulusOfDeformationClosed : D.modulusOfDeformation
  poissonRatioClosed : D.poissonRatio

def RockMassDeformationClosed (D : RockMassDeformationPackage) : Prop :=
  D.modulusOfDeformation ∧ D.poissonRatio

theorem rock_mass_deformation_closed_from_evidence
    (D : RockMassDeformationPackage) (E : RockMassDeformationEvidence D) :
    RockMassDeformationClosed D := by
  exact And.intro E.modulusOfDeformationClosed E.poissonRatioClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse
