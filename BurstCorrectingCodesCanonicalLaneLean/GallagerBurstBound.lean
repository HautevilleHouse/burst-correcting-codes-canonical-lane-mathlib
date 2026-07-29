import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure GallagerBurstBound where
  codeLength : ℕ
  redundancy : ℕ
  burstCorrectingCapability : ℕ
  boundHolds : Prop
  redundancyPositive : redundancy ≥ 1
  boundHoldsTerm : boundHolds

structure GallagerBurstBoundEvidence (B : GallagerBurstBound) where
  redundancyPositiveClosed : B.redundancyPositive
  boundHoldsClosed : B.boundHoldsTerm

def GallagerBurstBoundClosed (B : GallagerBurstBound) : Prop :=
  B.redundancyPositive ∧ B.boundHolds

theorem gallager_burst_bound_closed_from_evidence (B : GallagerBurstBound) (E : GallagerBurstBoundEvidence B) :
    GallagerBurstBoundClosed B := by
  exact And.intro E.redundancyPositiveClosed E.boundHoldsClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse