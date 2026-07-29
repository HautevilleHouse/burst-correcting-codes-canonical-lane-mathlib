import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure CyclicCode (n k : ℕ) where
  generatorPolynomial : Polynomial (Fin 2)
  blockLength : ℕ := n
  dimension : ℕ := k
  checkPolynomial : Polynomial (Fin 2)
  conditionGeneratorDivides : generatorPolynomial ∣ (Polynomial.X ^ n - 1 : Polynomial (Fin 2))
  conditionDimensionCorrect : Polynomial.natDegree generatorPolynomial = n - k
  cosetLeaderTable : List (Polynomial (Fin 2))

def cyclicCodeClosed {n k : ℕ} (C : CyclicCode n k) : Prop :=
  C.conditionGeneratorDivides ∧ C.conditionDimensionCorrect

theorem cyclic_code_closed {n k : ℕ} (C : CyclicCode n k) :
    cyclicCodeClosed C := by
  exact And.intro C.conditionGeneratorDivides C.conditionDimensionCorrect

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse