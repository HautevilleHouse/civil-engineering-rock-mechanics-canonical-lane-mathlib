import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure JointRoughnessPackage where
  jointRoughnessCoefficientJRC : ℝ
  basicFrictionAnglePhib : ℝ
  roughnessAngleIr : ℝ
  shearStrength : Prop

structure JointRoughnessEvidence (J : JointRoughnessPackage) where
  jrcClosed : J.jointRoughnessCoefficientJRC ≥ 0.0
  basicFrictionAngleClosed : J.basicFrictionAnglePhib ≥ 0.0
  roughnessAngleClosed : J.roughnessAngleIr ≥ 0.0
  shearStrengthClosed : J.shearStrength

def JointRoughnessClosed (J : JointRoughnessPackage) : Prop :=
  J.jointRoughnessCoefficientJRC ≥ 0.0 ∧ J.basicFrictionAnglePhib ≥ 0.0 ∧
  J.roughnessAngleIr ≥ 0.0 ∧ J.shearStrength

theorem joint_roughness_closed_from_evidence
    (J : JointRoughnessPackage) (E : JointRoughnessEvidence J) :
    JointRoughnessClosed J := by
  exact And.intro E.jrcClosed
    (And.intro E.basicFrictionAngleClosed
      (And.intro E.roughnessAngleClosed E.shearStrengthClosed))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse