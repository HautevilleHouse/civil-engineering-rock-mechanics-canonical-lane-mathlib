import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure NumericalSimulation where
  meshType : String
  elementCount : ℕ
  solverConverged : Prop
  displacementField : ℝ → ℝ → ℝ
  stressField : ℝ → ℝ → ℝ
  simulationValid : solverConverged ∧ elementCount > 0

structure SimulationEvidence (N : NumericalSimulation) where
  simulationValidClosed : N.simulationValid

def NumericalSimulationClosed (N : NumericalSimulation) : Prop :=
  N.simulationValid

theorem numerical_simulation_closed_from_evidence (N : NumericalSimulation) (E : SimulationEvidence N) : NumericalSimulationClosed N := by
  exact E.simulationValidClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse