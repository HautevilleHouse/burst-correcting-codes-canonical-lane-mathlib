import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesCanonicalLaneLean.DecodingAlgorithm
import BurstCorrectingCodesCanonicalLaneLean.PerformanceBounds

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BurstDecodingClosed (decodeObject A)

def gateClosed (A : AdmissibleClass) : Prop :=
  BurstErrorPerformanceClosed (performanceObject A)

def ConstrainedBurstClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  decodeClosed_from_object A

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  performanceClosed_from_object A

theorem constrained_burst_endgame (A : AdmissibleClass) :
    ConstrainedBurstClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean