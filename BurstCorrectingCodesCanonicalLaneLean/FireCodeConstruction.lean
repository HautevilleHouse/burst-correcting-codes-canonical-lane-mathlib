import BurstCorrectingCodesCanonicalLaneLean.BurstCorrectingAdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure FireCodeConstruction (A : AdmissibleClass) where
  generatorPolynomial : FiniteField (A.object.alphabetSize) → FiniteField (A.object.alphabetSize)
  degree : Nat
  burstLengthCovered : Prop
  redundancyOptimal : Prop
  generatorPolynomialDefined : generatorPolynomial ≠ λ _ => 0
  burstLengthCoveredTerm : burstLengthCovered
  redundancyOptimalTerm : redundancyOptimal

structure FireCodeEvidence (A : AdmissibleClass) (F : FireCodeConstruction A) where
  burstLengthCoveredClosed : F.burstLengthCovered
  redundancyOptimalClosed : F.redundancyOptimal

def FireCodeClosed (A : AdmissibleClass) (F : FireCodeConstruction A) : Prop :=
  F.burstLengthCovered ∧ F.redundancyOptimal

theorem fire_code_closed (A : AdmissibleClass) (F : FireCodeConstruction A) (E : FireCodeEvidence A F) :
    FireCodeClosed A F :=
  And.intro E.burstLengthCoveredClosed E.redundancyOptimalClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse
