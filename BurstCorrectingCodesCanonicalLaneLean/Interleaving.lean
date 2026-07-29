import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure InterleavingPackage (C : CyclicCodePackage) where
  interleavingDepth : Nat
  blockStructure : Type u
  interleavedCode : Prop
  burstLengthImprovement : Prop
  errorDistribution : Prop
  deinterleavingProcedure : Type v

structure InterleavingEvidence {C : CyclicCodePackage} (I : InterleavingPackage C) where
  interleavedCodeClosed : I.interleavedCode
  burstLengthImprovementClosed : I.burstLengthImprovement
  errorDistributionClosed : I.errorDistribution

def InterleavingClosed {C : CyclicCodePackage} (I : InterleavingPackage C) : Prop :=
  I.interleavedCode ∧ I.burstLengthImprovement ∧ I.errorDistribution

theorem interleaving_closed_from_evidence
    {C : CyclicCodePackage} (I : InterleavingPackage C) (E : InterleavingEvidence I) :
    InterleavingClosed I := by
  exact And.intro E.interleavedCodeClosed
    (And.intro E.burstLengthImprovementClosed E.errorDistributionClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse