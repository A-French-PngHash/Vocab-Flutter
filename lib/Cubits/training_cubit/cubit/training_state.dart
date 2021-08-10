part of 'training_cubit.dart';

@freezed
abstract class TrainingState with _$TrainingState {
  const factory TrainingState.initial() = _Initial;

  factory TrainingState.word(String wordToTranslate, String? comment) = _Word;

  factory TrainingState.correction(String wordToTranslate, bool correct, String correctTranslation, String? comment, String? grammarRule) = _Correct;
}
