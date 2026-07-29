import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringRockMechanicsCanonicalLaneLean

structure HoekBrownParameters where
  sig_ci : Float
  GSI : Float
  mi : Float
  D : Float
  mb : Float
  s : Float
  a : Float
  mbTerm : mb = mi * exp ((GSI - 100) / (28 - 14 * D))
  sTerm : s = exp ((GSI - 100) / (9 - 3 * D))
  aTerm : a = 0.5 + (1/6) * (exp (-GSI/15) - exp (-20/3))

def HoekBrownCriterionClosed (H : HoekBrownParameters) : Prop :=
  H.mbTerm ∧ H.sTerm ∧ H.aTerm

end CivilEngineeringRockMechanicsCanonicalLaneLean
end HautevilleHouse