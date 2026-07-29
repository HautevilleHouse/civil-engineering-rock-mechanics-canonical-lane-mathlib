import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure QSystemTunnelingPackage where
  rqdRating : Prop
  jointSetNumber : Prop
  jointRoughnessNumber : Prop
  jointAlterationNumber : Prop
  jointWaterReduction : Prop
  stressReductionFactor : Prop

structure QSystemTunnelingEvidence (Q : QSystemTunnelingPackage) where
  rqdRatingClosed : Q.rqdRating
  jointSetNumberClosed : Q.jointSetNumber
  jointRoughnessNumberClosed : Q.jointRoughnessNumber
  jointAlterationNumberClosed : Q.jointAlterationNumber
  jointWaterReductionClosed : Q.jointWaterReduction
  stressReductionFactorClosed : Q.stressReductionFactor

def QSystemTunnelingClosed (Q : QSystemTunnelingPackage) : Prop :=
  Q.rqdRating ∧ Q.jointSetNumber ∧ Q.jointRoughnessNumber ∧ Q.jointAlterationNumber ∧ Q.jointWaterReduction ∧ Q.stressReductionFactor

theorem q_system_tunneling_closed_from_evidence
    (Q : QSystemTunnelingPackage) (E : QSystemTunnelingEvidence Q) :
    QSystemTunnelingClosed Q := by
  exact And.intro E.rqdRatingClosed
    (And.intro E.jointSetNumberClosed
      (And.intro E.jointRoughnessNumberClosed
        (And.intro E.jointAlterationNumberClosed
          (And.intro E.jointWaterReductionClosed E.stressReductionFactorClosed))))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse
