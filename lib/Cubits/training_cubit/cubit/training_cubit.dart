import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';
import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/db_session_repo.dart';
import 'package:vocab/Data/Repositories/db_word_repo.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';
import 'package:vocab/Services/word_service.dart';

part 'training_state.dart';
part 'training_cubit.freezed.dart';

class TrainingCubit extends Cubit<TrainingState> {
  late WordService _wordService;
  String originLanguage;
  String outputLanguage;
  int wordCount = -1;
  int correct = 0;
  int incorrect = 0;
  int nbTranslationToDo;
  String currentInputInTextField = "";
  late final DateTime beginTime;

  /// Both of these repos are used to log the sessions, and words, the user did.
  final dbSessionRepo = DbSessionRepo();
  final dbWordRepo = DbWordRepo();

  /// Current session.
  late Session session;

  Words get currentWord {
    return _wordService.current;
  }

  String get correctTranslation {
    switch (outputLanguage) {
      case "french":
        return currentWord.french.trim();
      case "english":
        return currentWord.english.trim();
      case "spanish":
        return currentWord.spanish.trim();
      default:
        return "Unknown Language";
    }
  }

  String get wordToTranslate {
    switch (originLanguage) {
      case "french":
        return currentWord.french.trim();
      case "english":
        return currentWord.english.trim();
      case "spanish":
        return currentWord.spanish.trim();
      default:
        return "Unknown Language";
    }
  }

  TrainingCubit(
      WordRepo _wordRepo, this.originLanguage, this.outputLanguage, this.nbTranslationToDo, List<String> themesChosen)
      : super(TrainingState.initial()) {
    this.beginTime = DateTime.now();
    _wordService = WordService(_wordRepo, nbTranslationToDo, themesChosen, () async {
      // The service is loaded.
      this.session = await dbSessionRepo.beginSession(nbTranslationToDo);

      nextButtonPressed();
    });
  }

  void userValidatedWord(String input) {
    currentInputInTextField = input;
    final success = input.toLowerCase().trim().replaceAll(RegExp(r"'"), '’') ==
        correctTranslation.toLowerCase().trim().replaceAll(RegExp(r"'"), '’');
    if (success) {
      correct += 1;
    } else {
      incorrect += 1;
    }

    // TODO : Put this code in nextButtonPressed
    dbWordRepo.linkWordToSession(
      session: session,
      wordShown: wordToTranslate,
      expectedTranslation: correctTranslation,
      inputedTranslation: input,
      scoreWhenShown: currentWord.score,
    );
    emit(TrainingState.correction(
      wordToTranslate,
      success,
      correctTranslation,
      currentInputInTextField,
      wordCount,
      currentWord.comment,
      currentWord.grammarRule,
    ));
    _wordService.next(success);
  }

  void nextButtonPressed() {
    if (wordCount + 1 == nbTranslationToDo) {
      emit(TrainingState.finished(correct, incorrect));
      return;
    } else {
      wordCount += 1;

      emit(TrainingState.word(wordToTranslate, currentWord.comment, wordCount));
    }
  }

  /// Called when the user changed the word currently in the text field.
  void userChangedWord(String new_word) async {
    currentInputInTextField = new_word;
  }
}
