import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstErrorModel where
  blockLength : Nat
  maxBurstLength : Nat
  burstPositions : List Nat
  errorInsertion : Prop
  allowedPatterns : Prop
  burstInsertionClosed : errorInsertion
  allowedPatternsClosed : allowedPatterns

structure BurstErrorEvidence (E : BurstErrorModel) where
  burstInsertionClosed : E.burstInsertionClosed
  allowedPatternsClosed : E.allowedPatternsClosed

def BurstErrorClosed (E : BurstErrorModel) : Prop :=
  E.errorInsertion ∧ E.allowedPatterns

theorem burst_error_closed_from_evidence (E : BurstErrorModel) (Ev : BurstErrorEvidence E) :
    BurstErrorClosed E :=
  And.intro Ev.burstInsertionClosed Ev.allowedPatternsClosed

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean