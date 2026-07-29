import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure CyclicBurstCode < BurstControlCode where
  generatorPolynomial : Polynomial Ring
  checkPolynomial : Polynomial Ring
  rootSet : Set Field
  bchBound : Nat
  generatorPolynomialClosed : generatorPolynomial ≠ 0
  checkPolynomialClosed : checkPolynomial * generatorPolynomial = X^codeLength - 1
  rootSetClosed : rootSet = {α^i | i ∈ Set.range bchBound}
  bchBoundClosed : bchBound ≥ burstCorrectionRadius

structure CyclicBurstCodeEvidence (C : CyclicBurstCode) where
  generatorPolynomialClosed : C.generatorPolynomialClosed
  checkPolynomialClosed : C.checkPolynomialClosed
  rootSetClosed : C.rootSetClosed
  bchBoundClosed : C.bchBoundClosed

def CyclicBurstCodeClosed (C : CyclicBurstCode) : Prop :=
  C.generatorPolynomialClosed ∧ C.checkPolynomialClosed ∧
  C.rootSetClosed ∧ C.bchBoundClosed

theorem cyclic_burst_code_closed_from_evidence (C : CyclicBurstCode) (E : CyclicBurstCodeEvidence C) :
    CyclicBurstCodeClosed C :=
  And.intro E.generatorPolynomialClosed
    (And.intro E.checkPolynomialClosed
      (And.intro E.rootSetClosed E.bchBoundClosed))

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean