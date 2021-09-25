import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vocab/Data/Model/theme.dart';
import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';

class WordService {
  WordRepo _wordRepo;
  late final List<Words> _words;
  late final int _wordCount; // Number of words that can be picked randomly.
  final int _wordDoneInSession; // The number of word the user will do in this session.

  Words current = Words("placeholder", "placeholder", "placeholder");

  WordService(this._wordRepo, this._wordDoneInSession, List<String> themes_chosen, Function loaded) {
    _wordRepo.get_themes(names: themes_chosen).then((value) {
      List<Words> word_temp = [];
      for (ThemeModel theme in value) {
        word_temp.addAll(theme.words);
      }
      _words = word_temp;
      this._wordCount = _words.length;
      if (this._wordCount <= 1) {
        throw Exception("Word count is less or equal to 1. Cannot continue as this will cause errors.");
      }
      _pickWord();
      loaded();
    });
  }

  /// Pick a new word.
  ///
  /// - success : Used to influence future probabilities of being picker for
  /// this word.
  void next(bool success) {
    if (success) {
      current.score -= (_wordCount / (_wordDoneInSession)) * 4;
    } else {
      current.score += (_wordCount / (_wordDoneInSession)) * 7;
    }
    if (current.score <= 0) {
      current.score = 0.5;
    }
    _pickWord();
  }

  void _pickWord() {
    double totalScore = _words.map((e) => e.score).fold(0, (previousValue, element) => previousValue + element);
    Words new_word = Words("placeholder", "placeholder", "placeholder");
    final rnd = Random();
    bool firstpass = true;
    while (firstpass || new_word == current) {
      firstpass = false;
      double randNum = rnd.nextDouble() * totalScore;
      double cumulativeProbability = 0.0;

      for (Words word in _words) {
        cumulativeProbability += word.score;
        if (cumulativeProbability > randNum) {
          new_word = word;
          break;
        }
      }
    }
    current = new_word;
  }
}
