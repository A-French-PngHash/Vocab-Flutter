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

  final _databaseHandler = DatabaseHandler();

  /// Both of these repos are used to log the sessions, and words, the user did.
  final dbSessionRepo = DbSessionRepo();
  final dbWordRepo = DbWordRepo();

  /// Current session.
  late Session session;

  Words get currentWord {
    return _wordService.current;
  }

  /// Return the correct translation of the current word. Note : this string is
  /// already sanitized using the [sanitizeWord] function.
  String get correctTranslation {
    String word = "Unknown Language";
    switch (outputLanguage) {
      case "french":
        word = currentWord.french.trim();
        break;
      case "english":
        word = currentWord.english.trim();
        break;
      case "spanish":
        word = currentWord.spanish.trim();
        break;
      default:
        return "Unknown Language";
    }
    return sanitizeWord(word);
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

  /// Sanitasizes the given string.
  ///
  /// Puts it to lower case, trims it, replaces ' with ’
  String sanitizeWord(String word) {
    return word.toLowerCase().trim().replaceAll(RegExp(r"'"), '’');
  }

  void userValidatedWord(String input) {
    currentInputInTextField = input;
    final success = sanitizeWord(input) == correctTranslation;
    if (success) {
      correct += 1;
    } else {
      incorrect += 1;
    }

    dbWordRepo.linkWordToSession(
      session: session,
      wordShown: wordToTranslate,
      expectedTranslation: correctTranslation,
      inputedTranslation: input,
      scoreWhenShown: currentWord.score,
    );

    emit(TrainingState.correction(wordToTranslate, success, correctTranslation, currentInputInTextField, wordCount,
        currentWord.comment, currentWord.grammarRule));
  }

  /// Called when the next button was pressed. This button appear after the
  /// valide button. It's shown along a screen that tells the user whether he
  /// got the word right.
  ///
  /// If the user got the word wrong, he has to type it again in order to
  /// continue. In that case, set [wasIncorrect] to true and set
  /// [correctionInputed] to the current word in the text field.
  void nextButtonPressed({wasIncorrect = false, correctionInputed = ""}) {
    if (wasIncorrect && sanitizeWord(correctionInputed) != correctTranslation) {
      // Words are not matching.
      return;
    }
    _wordService.next(!wasIncorrect);
    if (wordCount + 1 == nbTranslationToDo) {
      emit(TrainingState.finished(correct, incorrect));
      return;
    } else {
      wordCount += 1;

      emit(TrainingState.word(wordToTranslate, currentWord.comment, wordCount));
    }
  }

  void finishedSession() async {
    await _databaseHandler.insertNewSession(Session(
        correct: correct,
        incorrect: incorrect,
        wordCount: nbTranslationToDo,
        beginDate: beginTime,
        endDate: DateTime.now()));
    emit(TrainingState.finished(correct, incorrect));
  }
}
