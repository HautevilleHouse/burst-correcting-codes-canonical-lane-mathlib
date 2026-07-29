import BurstCorrectingCodesCanonicalLaneLean.InterleavingTechniques

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BoundedDistanceDecodingPackage {C : CyclicBurstPackage}
    {I : InterleavingPackage C} where
  decodingAlgorithm : Type u
  boundedDistance : Nat
  uniqueDecodingRegime : Prop
  errorProbabilityBound : Prop
  complexityEstimate : Prop

structure BoundedDistanceDecodingEvidence {C : CyclicBurstPackage}
    {I : InterleavingPackage C} (D : BoundedDistanceDecodingPackage I) where
  uniqueDecodingRegimeClosed : D.uniqueDecodingRegime
  errorProbabilityBoundClosed : D.errorProbabilityBound
  complexityEstimateClosed : D.complexityEstimate

def BoundedDistanceDecodingClosed {C : CyclicBurstPackage}
    {I : InterleavingPackage C} (D : BoundedDistanceDecodingPackage I) : Prop :=
  D.uniqueDecodingRegime ∧ D.errorProbabilityBound ∧ D.complexityEstimate

theorem bounded_distance_decoding_closed_from_evidence {C : CyclicBurstPackage}
    {I : InterleavingPackage C} (D : BoundedDistanceDecodingPackage I)
    (E : BoundedDistanceDecodingEvidence D) : BoundedDistanceDecodingClosed D := by
  exact And.intro E.uniqueDecodingRegimeClosed
    (And.intro E.errorProbabilityBoundClosed E.complexityEstimateClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse