import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstCode where
  length : ℕ
  dimension : ℕ
  burstCorrectionRadius : ℕ
  generatorMatrix : Type u
  parityCheckMatrix : Type v

def burstWeight (v : List ℕ) : ℕ :=
  match v with
  | [] => 0
  | _ => 1 + (List.length v - 1)

def isBurstError (v : List ℕ) (b : ℕ) : Prop :=
  burstWeight v ≤ b

def correctsBurstErrors (C : BurstCode) : Prop :=
  ∀ (e : List ℕ), isBurstError e C.burstCorrectionRadius →
    ∃ (c : List ℕ), c ∈ {x | True} ∧ (List.map (λ x y => (x + y) % 2) e (C.encode c)) = C.zeroCodeword

structure BurstCodeEvidence (C : BurstCode) where
  correctsBurstErrorsClosed : correctsBurstErrors C
  linearClosed : Prop

def BurstCodeAlgebraClosed (C : BurstCode) : Prop :=
  correctsBurstErrors C

theorem burst_code_algebra_closed_from_evidence (C : BurstCode)
    (E : BurstCodeEvidence C) : BurstCodeAlgebraClosed C := by
  exact E.correctsBurstErrorsClosed

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse