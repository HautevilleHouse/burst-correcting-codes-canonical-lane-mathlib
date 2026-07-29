import BurstCorrectingCodesCanonicalLaneLean.BurstCorrectingAdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstErrorDetection (A : AdmissibleClass) where
  detectableBurstPatterns : Set (List (Fin (A.object.alphabetSize)))
  syndromeMapping : Fin (2 ^ (A.object.codeLength - A.object.codeLength)) → Fin (2 ^ (A.object.codeLength - A.object.codeLength))
  detectionComplete : Prop
  falsePositiveFree : Prop
  detectionCompleteTerm : detectionComplete
  falsePositiveFreeTerm : falsePositiveFree

structure BurstErrorDetectionEvidence (A : AdmissibleClass) (D : BurstErrorDetection A) where
  detectionCompleteClosed : D.detectionComplete
  falsePositiveFreeClosed : D.falsePositiveFree

def BurstErrorDetectionClosed (A : AdmissibleClass) (D : BurstErrorDetection A) : Prop :=
  D.detectionComplete ∧ D.falsePositiveFree

theorem burst_error_detection_closed (A : AdmissibleClass) (D : BurstErrorDetection A) (E : BurstErrorDetectionEvidence A D) :
    BurstErrorDetectionClosed A D :=
  And.intro E.detectionCompleteClosed E.falsePositiveFreeClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse
