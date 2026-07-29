import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure FieldMeasurement where
  measurementType : String
  location : ℝ × ℝ × ℝ
  value : ℝ
  uncertainty : ℝ
  measurementValid : uncertainty ≥ 0

structure MeasurementEvidence (M : FieldMeasurement) where
  measurementValidClosed : M.measurementValid

def FieldMeasurementClosed (M : FieldMeasurement) : Prop :=
  M.measurementValid

theorem field_measurement_closed_from_evidence (M : FieldMeasurement) (E : MeasurementEvidence M) : FieldMeasurementClosed M := by
  exact E.measurementValidClosed

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse