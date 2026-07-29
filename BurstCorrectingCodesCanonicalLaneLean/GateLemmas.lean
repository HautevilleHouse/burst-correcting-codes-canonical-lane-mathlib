import canonicalLaneMathlib.AdmissibleClass
import hautevilleHouse.BurstCorrectingCodesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse