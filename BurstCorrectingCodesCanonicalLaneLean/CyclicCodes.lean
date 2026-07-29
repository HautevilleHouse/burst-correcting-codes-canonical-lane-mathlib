import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure CyclicCodePackage where
  codeLength : Nat
  generatorPolynomial : Polynomial (ZMod 2)
  parityCheckPolynomial : Polynomial (ZMod 2)
  syndromeComputation : Type
  burstCorrectionCapability : Prop
  cyclicProperty : Prop
  efficientDecoding : Prop

structure CyclicCodeEvidence (C : CyclicCodePackage) where
  burstCorrectionCapabilityClosed : C.burstCorrectionCapability
  cyclicPropertyClosed : C.cyclicProperty
  efficientDecodingClosed : C.efficientDecoding

def CyclicCodeClosed (C : CyclicCodePackage) : Prop :=
  C.burstCorrectionCapability ∧ C.cyclicProperty ∧ C.efficientDecoding

theorem cyclic_code_closed_from_evidence
    (C : CyclicCodePackage) (E : CyclicCodeEvidence C) :
    CyclicCodeClosed C := by
  exact And.intro E.burstCorrectionCapabilityClosed
    (And.intro E.cyclicPropertyClosed E.efficientDecodingClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse