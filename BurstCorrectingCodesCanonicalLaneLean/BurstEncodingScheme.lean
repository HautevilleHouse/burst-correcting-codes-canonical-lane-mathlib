import BurstCorrectingCodesCanonicalLaneLean.BurstErrorModel

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstEncodingScheme (G : BurstCorrectingAdmittedObject) (E : BurstErrorModel G) where
  generatorMatrix : Type
  systematicForm : Prop
  encodingEfficiency : Prop
  rateCalculation : Prop

def BurstEncodingSchemeClosed {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} (S : BurstEncodingScheme G E) : Prop :=
  S.systematicForm ∧ S.encodingEfficiency ∧ S.rateCalculation

structure BurstEncodingSchemeEvidence {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} (S : BurstEncodingScheme G E) where
  systematicFormClosed : S.systematicForm
  encodingEfficiencyClosed : S.encodingEfficiency
  rateCalculationClosed : S.rateCalculation

theorem burst_encoding_scheme_closed_from_evidence {G : BurstCorrectingAdmittedObject} {E : BurstErrorModel G} (S : BurstEncodingScheme G E) (ev : BurstEncodingSchemeEvidence S) :
    BurstEncodingSchemeClosed S := by
  exact And.intro ev.systematicFormClosed (And.intro ev.encodingEfficiencyClosed ev.rateCalculationClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse