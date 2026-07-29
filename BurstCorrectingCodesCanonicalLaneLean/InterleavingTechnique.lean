import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure InterleavingScheme where
  interleavingDepth : Nat
  originalCode : BurstControlCode
  interleavedCode : BurstControlCode
  interleavingMapping : Prop
  burstErrorDispersion : Prop
  interleavingDepthClosed : interleavingDepth ≥ 1
  interleavingMappingClosed : interleavingMapping
  burstErrorDispersionClosed : burstErrorDispersion

structure InterleavingEvidence (I : InterleavingScheme) where
  interleavingDepthClosed : I.interleavingDepthClosed
  interleavingMappingClosed : I.interleavingMappingClosed
  burstErrorDispersionClosed : I.burstErrorDispersionClosed

def InterleavingClosed (I : InterleavingScheme) : Prop :=
  I.interleavingDepthClosed ∧ I.interleavingMappingClosed ∧ I.burstErrorDispersionClosed

theorem interleaving_closed_from_evidence (I : InterleavingScheme) (E : InterleavingEvidence I) :
    InterleavingClosed I :=
  And.intro E.interleavingDepthClosed
    (And.intro E.interleavingMappingClosed E.burstErrorDispersionClosed)

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean