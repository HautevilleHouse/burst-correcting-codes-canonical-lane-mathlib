import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure FireCode where
  generatorPolynomial : Type
  degree : Nat
  burstErrorCorrectingCapability : Nat
  guardBandLength : Nat
  cyclicStructure : Prop
  syndromeComputation : Prop
  fireCodeTrapdoor : Prop

structure FireCodeEvidence (F : FireCode) where
  cyclicStructureClosed : F.cyclicStructure
  syndromeComputationClosed : F.syndromeComputation
  fireCodeTrapdoorClosed : F.fireCodeTrapdoor

def FireCodeClosed (F : FireCode) : Prop :=
  F.cyclicStructure ∧ F.syndromeComputation ∧ F.fireCodeTrapdoor

theorem fire_code_closed_from_evidence
    (F : FireCode) (E : FireCodeEvidence F) : FireCodeClosed F := by
  exact And.intro E.cyclicStructureClosed
    (And.intro E.syndromeComputationClosed E.fireCodeTrapdoorClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse