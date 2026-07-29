import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure FireCodePackage (C : CyclicCodePackage) where
  fireGenerator : Polynomial (ZMod 2)
  burstLengthCorrectable : Nat
  guardBandLength : Nat
  fireCodeConstruction : Prop
  singleBurstCorrection : Prop
  burstErrorDetection : Prop

structure FireCodeEvidence {C : CyclicCodePackage} (F : FireCodePackage C) where
  fireCodeConstructionClosed : F.fireCodeConstruction
  singleBurstCorrectionClosed : F.singleBurstCorrection
  burstErrorDetectionClosed : F.burstErrorDetection

def FireCodeClosed {C : CyclicCodePackage} (F : FireCodePackage C) : Prop :=
  F.fireCodeConstruction ∧ F.singleBurstCorrection ∧ F.burstErrorDetection

theorem fire_code_closed_from_evidence
    {C : CyclicCodePackage} (F : FireCodePackage C) (E : FireCodeEvidence F) :
    FireCodeClosed F := by
  exact And.intro E.fireCodeConstructionClosed
    (And.intro E.singleBurstCorrectionClosed E.burstErrorDetectionClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse