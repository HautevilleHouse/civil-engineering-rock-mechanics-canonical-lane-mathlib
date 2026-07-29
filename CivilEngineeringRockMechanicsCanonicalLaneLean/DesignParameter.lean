import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure DesignParameter where
  excavationDepth : ℝ
  supportPressure : ℝ
  factorOfSafety : ℝ
  parameterValid : excavationDepth ≥ 0 ∧ supportPressure ≥ 0 ∧ factorOfSafety ≥ 1

structure DesignEvidence (D : DesignParameter) where
  parameterValidClosed : D.parameterValid

def DesignParameterClosed (D : DesignParameter) : Prop :=
  D.parameterValid

theorem design_parameter_closed_from_evidence (D : DesignParameter) (E : DesignEvidence D) : DesignParameterClosed D := by
  exact E.parameterValidClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse