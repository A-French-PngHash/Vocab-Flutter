part of 'training_cubit.dart';

@freezed
class TrainingState with _$TrainingState {
  const factory TrainingState.initial() = _Initial;

  factory TrainingState.word(String wordToTranslate, String? comment, int wordNumber) = _Word;

  /// The correction state for after the user inputed and validated the word.
  /// 
  /// wordToTranslate: The orignal word to translate. In the origin language.
  /// correct: If the translation done by the user was correct.
  /// correctTranslation: The translation of the word. In the translation language.
  /// translationInputed: The translation the user inputed. Supposed to be in the translation language.
  /// wordNumber: The current word count done on the session.
  /// comment: Eventual comment. The comment is shown under the original word, and is used to specify, and prevent ambiguity.
  /// grammarRule: A small indication on the word, and its grammar rules.
  factory TrainingState.correction(String wordToTranslate, bool correct, String correctTranslation, String translationInputed, int wordNumber,
      String? comment, String? grammarRule) = _Correct;

  factory TrainingState.finished(int nbCorrect, int nbIncorrect) = _Finished;
}
