import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocab/Data/Model/language.dart';
import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:vocab/Services/word_service.dart';

part 'training_state.dart';
part 'training_cubit.freezed.dart';

class TrainingCubit extends Cubit<TrainingState> {
  late WordService _wordService;
  Language originLanguage;
  Language outputLanguage;

  Words get currentWord {
    return _wordService.current;
  }

  String get correctTranslation {
    switch (originLanguage) {
      case Language.french:
        return currentWord.french.trim();
      case Language.english:
        return currentWord.english.trim();
      case Language.spanish:
        return currentWord.spanish.trim();
      default:
        return "Unknown Language";
    }
  }

  String get wordToTranslate {
    switch (outputLanguage) {
      case Language.french:
        return currentWord.french.trim();
      case Language.english:
        return currentWord.english.trim();
      case Language.spanish:
        return currentWord.spanish.trim();
      default:
        return "Unknown Language";
    }
  }

  TrainingCubit(WordRepo _wordRepo, this.originLanguage, this.outputLanguage) : super(TrainingState.initial()) {
    _wordService = WordService(_wordRepo, () {
      // The service is loaded.
      nextButtonPressed();
    });
  }

  void userInputedWord(String word) {
    final success = word.toLowerCase().trim() == correctTranslation.toLowerCase().trim();
    emit(TrainingState.correction(wordToTranslate, success, correctTranslation, currentWord.comment, currentWord.grammarRule));
    _wordService.next(success);
  }

  void nextButtonPressed() {
    emit(TrainingState.word(wordToTranslate, currentWord.comment));
  }
}
