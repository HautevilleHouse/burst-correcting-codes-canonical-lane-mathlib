import BurstCorrectingCodesCanonicalLaneLean.CyclicBurstCodes

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure InterleavingPackage {C : CyclicBurstPackage} where
  interleavingDepth : Nat
  interleavingPattern : Type u
  burstErrorDispersion : Prop
  errorCorrectionImprovement : Prop
  deinterleavingAlgorithm : Type v

structure InterleavingEvidence {C : CyclicBurstPackage} (I : InterleavingPackage C) where
  burstErrorDispersionClosed : I.burstErrorDispersion
  errorCorrectionImprovementClosed : I.errorCorrectionImprovement

def InterleavingClosed {C : CyclicBurstPackage} (I : InterleavingPackage C) : Prop :=
  I.burstErrorDispersion ∧ I.errorCorrectionImprovement

theorem interleaving_closed_from_evidence {C : CyclicBurstPackage}
    (I : InterleavingPackage C) (E : InterleavingEvidence I) : InterleavingClosed I := by
  exact And.intro E.burstErrorDispersionClosed E.errorCorrectionImprovementClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse