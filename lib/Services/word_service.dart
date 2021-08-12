import 'dart:math';

import 'package:vocab/Data/Model/words.dart';
import 'package:vocab/Data/Repositories/word_repo.dart';

class WordService {
  WordRepo _wordRepo;
  late final List<Words> _words;
  int _currentWordIndex = -1;
  late final int _wordCount;
  final int _wordDoneInSession; // The number of word the user will do in this session.

  Words get current {
    return _words[_currentWordIndex];
  }

  WordService(this._wordRepo, this._wordDoneInSession, Function loaded) {
    _wordRepo.words().then((value) {
      this._words = value;
      this._wordCount = value.length;
      _pickWord();
      loaded();
    });
  }

  void next(bool success) {
    if (success) {
      _words[_currentWordIndex].score -= (_wordCount / (_wordDoneInSession)) * 1;
    } else {
      _words[_currentWordIndex].score += (_wordCount / (_wordDoneInSession)) * 3;
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

    int new_index = _currentWordIndex;
    while (new_index == _currentWordIndex) {
      final rnd = Random();
      final randNum = Random().nextDouble();
      for (final prob in probabilities) {
        if (prob[0] <= randNum && randNum < prob[1]) {
          new_index = probabilities.indexOf(prob);
        }
      }
    }

    _currentWordIndex = new_index;
  }
}
