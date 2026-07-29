import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure ReigerBoundParameters where
  blockLength : ℕ
  burstLength : ℕ
  redundancy : ℕ

def reigerBound (P : ReigerBoundParameters) : Prop :=
  P.redundancy ≥ 2 * P.burstLength

def reigerBoundSatisfied (P : ReigerBoundParameters) : Prop :=
  P.redundancy ≥ 2 * P.burstLength

structure ReigerBoundEvidence (P : ReigerBoundParameters) where
  reigerBoundSatisfiedClosed : reigerBoundSatisfied P

def ReigerBoundClosed (P : ReigerBoundParameters) : Prop :=
  reigerBoundSatisfied P

theorem reiger_bound_closed_from_evidence (P : ReigerBoundParameters)
    (E : ReigerBoundEvidence P) : ReigerBoundClosed P := by
  exact E.reigerBoundSatisfiedClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse