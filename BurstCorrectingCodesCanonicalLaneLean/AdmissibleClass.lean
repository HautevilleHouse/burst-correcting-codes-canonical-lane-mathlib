import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure AdmissibleClass where
  object : BurstCorrectingCodesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BurstCodeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse