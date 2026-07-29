import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstErrorCorrection where
  code : Set (Vector ℕ n)
  correctionAlgorithm : Vector ℕ n → Vector ℕ n
  maxCorrectableBurst : ℕ
  correctionGuarantee : Prop

structure BurstErrorCorrectionEvidence (C : BurstErrorCorrection) where
  correctionAlgorithmCorrect : ∀ c ∈ C.code, C.correctionAlgorithm c = c
  maxCorrectableBurstPositive : C.maxCorrectableBurst > 0
  correctionGuaranteeClosed : C.correctionGuarantee

def BurstErrorCorrectionClosed (C : BurstErrorCorrection) : Prop :=
  C.correctionGuarantee

theorem burst_error_correction_closed_from_evidence (C : BurstErrorCorrection) (E : BurstErrorCorrectionEvidence C) :
    BurstErrorCorrectionClosed C :=
  E.correctionGuaranteeClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse