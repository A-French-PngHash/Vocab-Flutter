import 'dart:math';

import 'package:vocab/Data/Model/theme.dart';
import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';

class WordService {
  WordRepo _wordRepo;
  late final List<Words> _words;
  late final int _wordCount; // Number of words that can be picked randomly.
  final int _wordDoneInSession; // The number of word the user will do in this session.

  late Words current;

  WordService(this._wordRepo, this._wordDoneInSession, List<String> themes_chosen, Function loaded) {
    _wordRepo.get_themes(names: themes_chosen).then((value) {
      List<Words> word_temp = [];
      for (Theme theme in value) {
        word_temp.addAll(theme.words);
      }
      _words = word_temp;
      this._wordCount = _words.length;
      _pickWord();
      loaded();
    });
  }

  void next(bool success) {
    if (success) {
      current.score -= (_wordCount / (_wordDoneInSession)) * 4;
    } else {
      current.score += (_wordCount / (_wordDoneInSession)) * 7;
    }
    _pickWord();
  }

  void _pickWord() {
    double totalScore = _words.map((e) => e.score).fold(0, (previousValue, element) => previousValue + element);

    final rnd = Random();
    double randNum = rnd.nextDouble() * totalScore;
    double cumulativeProbability = 0.0;

    Words new_word = Words("placeholder", "placeholder", "placeholder");
    for (Words word in _words) {
      cumulativeProbability += word.score;
      if (cumulativeProbability > randNum) {
        new_word = word;
        break;
      }
    }

    current = new_word;
  }
}
