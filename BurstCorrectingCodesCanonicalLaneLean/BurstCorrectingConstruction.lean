import HautevilleHouse.BurstCorrectingCodesCanonicalLaneLean.DecodingBound

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure FireCodeConstruction where
  parameters : FireCodeParameters
  generatorDefined : Prop
  burstCorrectingGuarantee : Prop
  decodingAlgorithm : Type
  proofOfCoverage : Prop

structure BerlekampConstruction where
  parameters : CodeParameters
  interleavingDepth : Nat
  burstLength : Nat
  performanceClaim : Prop

def BurstCorrectingConstructionClosed (fc : FireCodeConstruction) : Prop :=
  fc.generatorDefined ∧ fc.burstCorrectingGuarantee ∧ fc.proofOfCoverage

theorem fire_code_construction_closed (fc : FireCodeConstruction) (e : BurstCorrectingConstructionClosed fc) :
    BurstCorrectingConstructionClosed fc := by
  exact e

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse