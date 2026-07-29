import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure InterleavingConstruction (n : ℕ) where
  baseCode : Type u
  interleavingDepth : ℕ
  interleavedBlockLength : ℕ := n * interleavingDepth
  inputSequence : List (Fin 2)
  interleavedSequence : List (Fin 2)
  deinterleavedSequence : List (Fin 2)
  interleavingMapping : ℕ → ℕ
  deinterleavingMapping : ℕ → ℕ

def interleavingClosed {n : ℕ} (I : InterleavingConstruction n) : Prop :=
  I.interleavingDepth ≥ 1 ∧ I.interleavedBlockLength = n * I.interleavingDepth

theorem interleaving_construction_closed {n : ℕ} (I : InterleavingConstruction n) (hdepth : I.interleavingDepth ≥ 1) :
    interleavingClosed I := by
  exact And.intro hdepth (by
    rfl)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse