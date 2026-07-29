import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstControlCode where
  codeLength : Nat
  dimension : Nat
  generatorMatrix : Type
  parityCheckMatrix : Type
  burstCorrectionRadius : Nat
  codeLengthClosed : codeLength > 0
  dimensionClosed : dimension ≤ codeLength
  generatorMatrixClosed : GeneratorMatrixValid generatorMatrix
  parityCheckMatrixClosed : ParityCheckMatrixValid parityCheckMatrix
  burstCorrectionRadiusClosed : burstCorrectionRadius ≥ 1

def GeneratorMatrixValid (G : Type) : Prop := True
def ParityCheckMatrixValid (H : Type) : Prop := True

structure BurstControlCodeEvidence (C : BurstControlCode) where
  codeLengthClosed : C.codeLengthClosed
  dimensionClosed : C.dimensionClosed
  generatorMatrixClosed : C.generatorMatrixClosed
  parityCheckMatrixClosed : C.parityCheckMatrixClosed
  burstCorrectionRadiusClosed : C.burstCorrectionRadiusClosed

def BurstControlCodeClosed (C : BurstControlCode) : Prop :=
  C.codeLengthClosed ∧ C.dimensionClosed ∧ C.generatorMatrixClosed ∧
  C.parityCheckMatrixClosed ∧ C.burstCorrectionRadiusClosed

theorem burst_control_code_closed_from_evidence (C : BurstControlCode) (E : BurstControlCodeEvidence C) :
    BurstControlCodeClosed C :=
  And.intro E.codeLengthClosed
    (And.intro E.dimensionClosed
      (And.intro E.generatorMatrixClosed
        (And.intro E.parityCheckMatrixClosed E.burstCorrectionRadiusClosed)))

end HautevilleHouse
end BurstCorrectingCodesCanonicalLaneLean