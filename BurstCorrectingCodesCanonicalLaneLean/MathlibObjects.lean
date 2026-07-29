import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstCodeSpace where
  carrier : Type
  alphabet : Type

default instance
  [inst : DecidableEq (carrier)] (s : BurstCodeSpace) : DecidableEq s.carrier := inst

structure BurstCorrectingCodesAdmittedObject where
  codeSpace : BurstCodeSpace
  burstErrorCorrectingCapability : ℕ
  codeIsCyclic : Prop
  generatorPolynomial : Polynomial (Fin 2)
  conclusion : codeIsCyclic

def BurstCodeWitnessClosed (O : BurstCorrectingCodesAdmittedObject) : Prop :=
  O.codeIsCyclic

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse