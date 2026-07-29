import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstErrorPerformance where
  code : BurstControlCode
  burstErrorProbability : ℝ
  undetectedBurstProbability : ℝ
  residualBurstRate : ℝ
  burstErrorProbabilityClosed : burstErrorProbability ≥ 0 ∧ burstErrorProbability ≤ 1
  undetectedBurstProbabilityClosed : undetectedBurstProbability ≥ 0 ∧ undetectedBurstProbability ≤ 1
  residualBurstRateClosed : residualBurstRate ≥ 0 ∧ residualBurstRate ≤ 1
  probabilityBoundProven : Prop
  boundWitness : probabilityBoundProven

structure BurstErrorPerformanceEvidence (P : BurstErrorPerformance) where
  burstErrorProbabilityClosed : P.burstErrorProbabilityClosed
  undetectedBurstProbabilityClosed : P.undetectedBurstProbabilityClosed
  residualBurstRateClosed : P.residualBurstRateClosed
  boundWitness : P.boundWitness

def BurstErrorPerformanceClosed (P : BurstErrorPerformance) : Prop :=
  P.burstErrorProbabilityClosed ∧ P.undetectedBurstProbabilityClosed ∧
  P.residualBurstRateClosed ∧ P.probabilityBoundProven

theorem burst_error_performance_closed_from_evidence (P : BurstErrorPerformance) (E : BurstErrorPerformanceEvidence P) :
    BurstErrorPerformanceClosed P :=
  And.intro E.burstErrorProbabilityClosed
    (And.intro E.undetectedBurstProbabilityClosed
      (And.intro E.residualBurstRateClosed E.boundWitness))

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean