import HautevilleHouse.BurstCorrectingCodesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstPattern where
  start : Nat
  length : Nat
  errorVector : List Bool

def burstLength (b : BurstPattern) : Nat := b.length

def burstIsContained (b : BurstPattern) (n : Nat) : Prop :=
  b.start + b.length ≤ n

structure CodeParameters where
  blockLength : Nat
  dimension : Nat
  minimumDistance : Nat

def burstCorrectingCapability (cp : CodeParameters) (bLen : Nat) : Prop :=
  cp.minimumDistance ≥ 2 * bLen + 1

structure FireCodeParameters extends CodeParameters where
  generatorPolynomial : Polynomial ℤ
  factorDegree : Nat
  burstLengthBound : Nat
  interleavingDepth : Nat

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse