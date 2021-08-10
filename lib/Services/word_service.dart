import 'dart:math';

import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';

class WordService {
  WordRepo _wordRepo;
  late List<Words> _words;
  late int _currentWordIndex;

  Words get current {
    return _words[_currentWordIndex];
  }

  WordService(this._wordRepo, Function loaded) {
    _wordRepo.words().then((value) {
      this._words = value;
      _pickWord();
      loaded();
    });
  }

  void next(bool success) {
    if (success) {
      _words[_currentWordIndex].score -= 1;
    } else {
      _words[_currentWordIndex].score += 2;
    }
    _pickWord();
  }

  void _pickWord() {
    double totalProbabilityCount =
        _words.map((e) => e.score).fold(0, (previousValue, element) => previousValue + element);
    List<double> probs = _words.map((e) => e.score / totalProbabilityCount).toList();
    double currentInterval = 0;
    List<List<double>> probabilities = [];
    for (final e in probs) {
      probabilities.add([currentInterval, currentInterval + e]);
      currentInterval += e;
    }
    probabilities.last[1] += 1;

    final rnd = Random();
    final randNum = Random().nextDouble();
    for (final prob in probabilities) {
      if (prob[0] <= randNum && randNum < prob[1]) {
        _currentWordIndex = probabilities.indexOf(prob);
      }
    }
  }
}
