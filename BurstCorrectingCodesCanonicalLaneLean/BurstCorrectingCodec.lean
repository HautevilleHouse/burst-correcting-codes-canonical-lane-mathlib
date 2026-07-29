import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BurstCorrectingCodesCanonicalLaneLean

structure BurstCorrectingCodec where
  encoder : ℕ → ℕ  -- encode message to codeword
  decoder : ℕ → ℕ  -- decode received word to message
  correctableBurst : ℕ
  encodingInjective : Function.Injective encoder
  decoderCorrects : ∀ (c : ℕ) (e : ℕ → ℕ), (∀ i, i < correctableBurst → e i ≠ 0) → decoder (encoder c + ∑ i in Finset.range correctableBurst, e i) = c
  correctableBurstPositive : correctableBurst ≥ 1

structure BurstCorrectingCodecEvidence (C : BurstCorrectingCodec) where
  encodingInjectiveClosed : C.encodingInjective
  decoderCorrectsClosed : C.decoderCorrects
  correctableBurstPositiveClosed : C.correctableBurstPositive

def BurstCorrectingCodecClosed (C : BurstCorrectingCodec) : Prop :=
  C.encodingInjective ∧ C.decoderCorrects ∧ C.correctableBurstPositive

theorem burst_correcting_codec_closed_from_evidence (C : BurstCorrectingCodec) (E : BurstCorrectingCodecEvidence C) :
    BurstCorrectingCodecClosed C := by
  exact And.intro E.encodingInjectiveClosed (And.intro E.decoderCorrectsClosed E.correctableBurstPositiveClosed)

end BurstCorrectingCodesCanonicalLaneLean
end HautevilleHouse