import canonicalLaneMathlib.AdmissibleClass
import BurstCorrectingCodesCanonicalLaneLean.BurstErrorModels
import BurstCorrectingCodesCanonicalLaneLean.BurstCodesAlgebra
import BurstCorrectingCodesCanonicalLaneLean.GallagerBound
import BurstCorrectingCodesCanonicalLaneLean.ReigerBound
import BurstCorrectingCodesCanonicalLaneLean.FireCodeConstruction

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

def ConstrainedBurstCodeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_burst_code_endgame (A : AdmissibleClass) :
    ConstrainedBurstCodeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse