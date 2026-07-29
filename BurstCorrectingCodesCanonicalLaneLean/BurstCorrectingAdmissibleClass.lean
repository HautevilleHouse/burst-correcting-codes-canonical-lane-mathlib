import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstAdmittedObject where
  codeLength : Nat
  burstLength : Nat
  alphabetSize : Nat
  isLinearCode : Prop
  correctsBurstErrors : Prop
  conclusion : correctsBurstErrors

structure AdmissibleClass where
  object : BurstAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse
