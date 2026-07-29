import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstErrorModel where
  burstLength : ℕ
  burstPosition : ℕ
  errorPattern : ℕ → ℕ  -- error pattern as polynomial coefficients
  burstLengthPositive : burstLength ≥ 1
  errorPatternNonzero : errorPattern ≠ λ _ => 0

structure BurstErrorModelEvidence (M : BurstErrorModel) where
  burstLengthClosed : M.burstLengthPositive
  errorPatternClosed : M.errorPatternNonzero

def BurstErrorModelClosed (M : BurstErrorModel) : Prop :=
  M.burstLengthPositive ∧ M.errorPatternNonzero

theorem burst_error_model_closed_from_evidence (M : BurstErrorModel) (E : BurstErrorModelEvidence M) :
    BurstErrorModelClosed M := by
  exact And.intro E.burstLengthClosed E.errorPatternClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse