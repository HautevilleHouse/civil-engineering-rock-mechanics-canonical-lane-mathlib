import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure HoekBrownFailurePackage where
  intactParameterMi : ℝ
  gsiValue : Nat
  disturbanceFactorD : ℝ
  materialConstantMb : ℝ
  uniaxialStrengthSigmaci : ℝ
  failureEnvelope : Prop

structure HoekBrownFailureEvidence (H : HoekBrownFailurePackage) where
  intactParameterMiClosed : H.intactParameterMi = 5.0 -- example
  gsiValueClosed : H.gsiValue ≥ 10
  disturbanceFactorDClosed : H.disturbanceFactorD ≥ 0.0
  materialConstantMbClosed : H.materialConstantMb > 0.0
  uniaxialStrengthSigmaciClosed : H.uniaxialStrengthSigmaci > 0.0
  failureEnvelopeClosed : H.failureEnvelope

def HoekBrownFailureClosed (H : HoekBrownFailurePackage) : Prop :=
  H.intactParameterMi = 5.0 ∧ H.gsiValue ≥ 10 ∧ H.disturbanceFactorD ≥ 0.0 ∧
  H.materialConstantMb > 0.0 ∧ H.uniaxialStrengthSigmaci > 0.0 ∧ H.failureEnvelope

theorem hoek_brown_failure_closed_from_evidence
    (H : HoekBrownFailurePackage) (E : HoekBrownFailureEvidence H) :
    HoekBrownFailureClosed H := by
  exact And.intro E.intactParameterMiClosed
    (And.intro E.gsiValueClosed
      (And.intro E.disturbanceFactorDClosed
        (And.intro E.materialConstantMbClosed
          (And.intro E.uniaxialStrengthSigmaciClosed E.failureEnvelopeClosed))))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse