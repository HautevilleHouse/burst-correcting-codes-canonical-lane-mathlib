import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure ReedSolomonCode (n k : ℕ) where
  fieldSize : ℕ
  generatorPolynomial : Polynomial (Fin (fieldSize))
  blockLength : ℕ := n
  dimension : ℕ := k
  parityCheckMatrix : Matrix (Fin (fieldSize)) (Fin (fieldSize)) (Fin (fieldSize))
  syndromeDecoder : List (Fin (fieldSize)) → List (Fin (fieldSize))

def reedSolomonClosed {n k : ℕ} (RS : ReedSolomonCode n k) : Prop :=
  RS.generatorPolynomial.degree = (RS.blockLength - RS.dimension : ℕ)

theorem reed_solomon_code_closed {n k : ℕ} (RS : ReedSolomonCode n k) (hdegree : RS.generatorPolynomial.degree = (RS.blockLength - RS.dimension : ℕ)) :
    reedSolomonClosed RS := by
  exact hdegree

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse