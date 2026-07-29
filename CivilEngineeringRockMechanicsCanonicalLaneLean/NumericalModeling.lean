import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure NumericalModelingPackage where
  continuumModelFormulated : Prop
  discontinuumModelFormulated : Prop
  boundaryConditionsApplied : Prop
  constitutiveModelSelected : Prop
  meshConverged : Prop
  solutionConverged : Prop
  stressStrainFieldComputed : Prop
  displacementFieldComputed : Prop
  modelCalibrated : Prop
  sensitivityAnalysisPerformed : Prop

structure NumericalModelingEvidence (P : NumericalModelingPackage) where
  continuumModelFormulatedClosed : P.continuumModelFormulated
  discontinuumModelFormulatedClosed : P.discontinuumModelFormulated
  boundaryConditionsAppliedClosed : P.boundaryConditionsApplied
  constitutiveModelSelectedClosed : P.constitutiveModelSelected
  meshConvergedClosed : P.meshConverged
  solutionConvergedClosed : P.solutionConverged
  stressStrainFieldComputedClosed : P.stressStrainFieldComputed
  displacementFieldComputedClosed : P.displacementFieldComputed
  modelCalibratedClosed : P.modelCalibrated
  sensitivityAnalysisPerformedClosed : P.sensitivityAnalysisPerformed

def NumericalModelingClosed (P : NumericalModelingPackage) : Prop :=
  P.continuumModelFormulated ∧ P.discontinuumModelFormulated ∧ P.boundaryConditionsApplied ∧
  P.constitutiveModelSelected ∧ P.meshConverged ∧ P.solutionConverged ∧
  P.stressStrainFieldComputed ∧ P.displacementFieldComputed ∧ P.modelCalibrated ∧
  P.sensitivityAnalysisPerformed

theorem numerical_modeling_closed_from_evidence
    (P : NumericalModelingPackage) (E : NumericalModelingEvidence P) :
    NumericalModelingClosed P := by
  exact And.intro E.continuumModelFormulatedClosed (And.intro E.discontinuumModelFormulatedClosed (And.intro E.boundaryConditionsAppliedClosed (And.intro E.constitutiveModelSelectedClosed (And.intro E.meshConvergedClosed (And.intro E.solutionConvergedClosed (And.intro E.stressStrainFieldComputedClosed (And.intro E.displacementFieldComputedClosed (And.intro E.modelCalibratedClosed E.sensitivityAnalysisPerformedClosed))))))))

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse