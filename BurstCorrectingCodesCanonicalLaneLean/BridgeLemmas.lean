import canonicalLaneMathlib.AdmissibleClass
import hautevilleHouse.BurstCorrectingCodesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BurstCodeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse