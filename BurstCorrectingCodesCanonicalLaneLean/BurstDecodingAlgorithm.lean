import BurstCorrectingCodesCanonicalLaneLean.BurstEncodingScheme

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstDecodingAlgorithm {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} {S : BurstEncodingScheme G E} where
  syndromeComputation : Type
  errorLocatorPolynomial : Prop
  burstDetectionCapability : Prop
  uniqueDecodability : Prop

def BurstDecodingAlgorithmClosed {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} {S : BurstEncodingScheme G E} (D : BurstDecodingAlgorithm G E S) : Prop :=
  D.burstDetectionCapability ∧ D.uniqueDecodability

structure BurstDecodingAlgorithmEvidence {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} {S : BurstEncodingScheme G E} (D : BurstDecodingAlgorithm G E S) where
  burstDetectionCapabilityClosed : D.burstDetectionCapability
  uniqueDecodabilityClosed : D.uniqueDecodability

theorem burst_decoding_algorithm_closed_from_evidence {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} {S : BurstEncodingScheme G E} (D : BurstDecodingAlgorithm G E S) (ev : BurstDecodingAlgorithmEvidence D) :
    BurstDecodingAlgorithmClosed D := by
  exact And.intro ev.burstDetectionCapabilityClosed ev.uniqueDecodabilityClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse