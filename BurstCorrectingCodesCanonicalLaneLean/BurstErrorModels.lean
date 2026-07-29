import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstChannel where
  blockLength : ℕ
  burstLength : ℕ
  errorPattern : List ℕ → Prop
  channelMemory : Prop

structure BurstErrorModel where
  channel : BurstChannel
  burstErrorProbability : ℝ
  errorCorrelation : Prop
  burstErrorEvent : Prop

structure BurstErrorEvidence (M : BurstErrorModel) where
  burstErrorEventClosed : M.burstErrorEvent
  errorCorrelationClosed : M.errorCorrelation

def BurstErrorModelClosed (M : BurstErrorModel) : Prop :=
  M.burstErrorEvent ∧ M.errorCorrelation

theorem burst_error_model_closed_from_evidence (M : BurstErrorModel)
    (E : BurstErrorEvidence M) : BurstErrorModelClosed M := by
  exact And.intro E.burstErrorEventClosed E.errorCorrelationClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse