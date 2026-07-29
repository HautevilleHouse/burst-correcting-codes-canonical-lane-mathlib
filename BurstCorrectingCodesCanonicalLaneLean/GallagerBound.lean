import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure GallagerBoundParameters where
  blockLength : ℕ
  burstLength : ℕ
  redundancy : ℕ
  boundValue : ℝ

structure GallagerBoundEstimate (P : GallagerBoundParameters) where
  boundSatisfied : Prop
  boundValueComputed : P.boundValue = (P.redundancy : ℝ) / (P.blockLength : ℝ)

def GallagerBoundClosed (P : GallagerBoundParameters) : Prop :=
  P.boundValue = (P.redundancy : ℝ) / (P.blockLength : ℝ)

theorem gallager_bound_closed_from_estimate (P : GallagerBoundParameters)
    (E : GallagerBoundEstimate P) : GallagerBoundClosed P := by
  exact E.boundValueComputed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse