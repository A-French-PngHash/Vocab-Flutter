import 'dart:ui';
import 'package:flutter/material.dart';

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
import 'package:vocab/Services/capextension_string.dart';
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
  late final DateTime beginTime;
  bool waitingCorrection =
      false; // If the user already submitted his translation, got it wrong, and now has to input the correct translation.

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

  TrainingCubit(WordRepo _wordRepo, this.originLanguage, this.outputLanguage, this.nbTranslationToDo,
      List<String> themesChosen, String user)
      : super(TrainingState.initial()) {
    this.beginTime = DateTime.now();
    _wordService = WordService(_wordRepo, nbTranslationToDo, themesChosen, () async {
      // The service is loaded.
      this.session = await DbSessionRepo.beginSession(nbTranslationToDo, user);

      nextWord(success: true);
    });
  }

  /// Sanitasizes the given string.
  ///
  /// Puts it to lower case, trims it, replaces ' with ’
  String sanitizeWord(String word) {
    return word.toLowerCase().trim().replaceAll(RegExp(r"'"), '’');
  }

  void keyboardSubmit(String input) {
    if (waitingCorrection) {
      userSubmittedCorrection(correctionInputed: input);
    } else {
      userSubmittedInitialTranslation(input);
    }
  }

  void nextWord({required bool success}) {
    _wordService.next(success);
    waitingCorrection = false;
    if (wordCount + 1 == nbTranslationToDo) {
      emit(TrainingState.finished(correct, incorrect));
      return;
    } else {
      wordCount += 1;
      String text = "ÉCRIRE EN ${outputLanguage.fullCaps}";

      emit(TrainingState.word(wordToTranslate, currentWord.comment, wordCount, text, Colors.blueGrey));
    }
  }

  void userSubmittedInitialTranslation(String input) {
    final success = sanitizeWord(input) == correctTranslation;
    Color textFieldColor = Colors.black;
    String textUnderTextField = "";
    if (success) {
      correct += 1;
      textFieldColor = Colors.green;
      textUnderTextField = "RÉPONSE CORRECTE";
      waitingCorrection = false;
    } else {
      incorrect += 1;
      textFieldColor = Colors.red;
      textUnderTextField = "ÉCRIVEZ LA BONNE RÉPONSE";
      waitingCorrection = true;
    }

    DbWordRepo.linkWordToSession(
      session: session,
      wordShown: wordToTranslate,
      expectedTranslation: sanitizeWord(correctTranslation),
      inputedTranslation: sanitizeWord(input),
      scoreWhenShown: currentWord.score,
    );

    emit(TrainingState.correction(wordToTranslate, success, correctTranslation, input, wordCount, currentWord.comment,
        currentWord.grammarRule, textUnderTextField, textFieldColor));
  }

  void userSubmittedCorrection({correctionInputed = ""}) {
    if (sanitizeWord(correctionInputed) != correctTranslation) {
      // Words are not matching.
      return;
    }
    nextWord(success: false);
  }
}
