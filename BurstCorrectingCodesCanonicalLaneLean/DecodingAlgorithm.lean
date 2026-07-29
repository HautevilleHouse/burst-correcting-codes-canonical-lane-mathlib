import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstDecodingAlgorithm where
  code : BurstControlCode
  syndromeComputation : Prop
  errorLocatorPolynomial : Prop
  burstLocatorAlgorithm : Prop
  correctionDecision : Prop
  syndromeComputationClosed : syndromeComputation
  errorLocatorPolynomialClosed : errorLocatorPolynomial
  burstLocatorAlgorithmClosed : burstLocatorAlgorithm
  correctionDecisionClosed : correctionDecision

structure BurstDecodingEvidence (D : BurstDecodingAlgorithm) where
  syndromeComputationClosed : D.syndromeComputationClosed
  errorLocatorPolynomialClosed : D.errorLocatorPolynomialClosed
  burstLocatorAlgorithmClosed : D.burstLocatorAlgorithmClosed
  correctionDecisionClosed : D.correctionDecisionClosed

def BurstDecodingClosed (D : BurstDecodingAlgorithm) : Prop :=
  D.syndromeComputationClosed ∧ D.errorLocatorPolynomialClosed ∧
  D.burstLocatorAlgorithmClosed ∧ D.correctionDecisionClosed

theorem burst_decoding_closed_from_evidence (D : BurstDecodingAlgorithm) (E : BurstDecodingEvidence D) :
    BurstDecodingClosed D :=
  And.intro E.syndromeComputationClosed
    (And.intro E.errorLocatorPolynomialClosed
      (And.intro E.burstLocatorAlgorithmClosed E.correctionDecisionClosed))

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean