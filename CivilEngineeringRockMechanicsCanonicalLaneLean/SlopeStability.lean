import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure RockSlopeGeometry where
  slopeHeight : ℝ
  slopeAngle : ℝ
  unitWeight : ℝ

structure RockSlopeGeometryEvidence (G : RockSlopeGeometry) where
  slopeHeightPositive : G.slopeHeight > 0
  slopeAngleInRange : 0 < G.slopeAngle ∧ G.slopeAngle < π / 2
  unitWeightPositive : G.unitWeight > 0

def RockSlopeGeometryClosed (G : RockSlopeGeometry) : Prop :=
  G.slopeHeight > 0 ∧ (0 < G.slopeAngle ∧ G.slopeAngle < π / 2) ∧ G.unitWeight > 0

theorem rock_slope_geometry_closed_from_evidence (G : RockSlopeGeometry) (E : RockSlopeGeometryEvidence G) : RockSlopeGeometryClosed G := by
  exact And.intro E.slopeHeightPositive (And.intro E.slopeAngleInRange E.unitWeightPositive)

structure PlanarFailureAnalysis (G : RockSlopeGeometry) where
  jointDip : ℝ
  jointCohesion : ℝ
  jointFrictionAngle : ℝ
  factorOfSafety : ℝ
  safetyFormula : factorOfSafety = (jointCohesion + (G.unitWeight * G.slopeHeight * cos(jointDip) * tan(jointFrictionAngle))) / (G.unitWeight * G.slopeHeight * sin(jointDip))

structure PlanarFailureAnalysisEvidence {G : RockSlopeGeometry} (P : PlanarFailureAnalysis G) where
  jointDipPositive : P.jointDip > 0
  jointCohesionPositive : P.jointCohesion > 0
  jointFrictionAngleInRange : 0 < P.jointFrictionAngle ∧ P.jointFrictionAngle < π / 2
  factorOfSafetyPositive : P.factorOfSafety > 0

def PlanarFailureAnalysisClosed {G : RockSlopeGeometry} (P : PlanarFailureAnalysis G) : Prop :=
  P.jointDip > 0 ∧ P.jointCohesion > 0 ∧ (0 < P.jointFrictionAngle ∧ P.jointFrictionAngle < π / 2) ∧ P.factorOfSafety > 0 ∧ P.safetyFormula

theorem planar_failure_analysis_closed_from_evidence
    {G : RockSlopeGeometry} (P : PlanarFailureAnalysis G)
    (E : PlanarFailureAnalysisEvidence P) : PlanarFailureAnalysisClosed P := by
  exact And.intro E.jointDipPositive
    (And.intro E.jointCohesionPositive
      (And.intro E.jointFrictionAngleInRange
        (And.intro E.factorOfSafetyPositive P.safetyFormula)))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse