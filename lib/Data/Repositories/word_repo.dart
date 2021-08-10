import 'package:vocab/Data/Model/words.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WordRepo {
  List<Words>? _words;

  Future<List<Words>> words() async {
    if (_words != null) {
      return _words!;
    } else {
      List<Words> _words = [];

      final fullWord = await json.decode(await rootBundle.loadString("assets/words.json"));
      int numberOfWords = 0;

      for (Map<String, dynamic> element in fullWord.values) {
        numberOfWords += element.length;
      }

      for (Map<String, dynamic> element in fullWord.values) {
        for (Map<String, dynamic> word in element.values) {
          _words.add(
            Words(
              word["english"]! as String,
              word["spanish"]! as String,
              word["french"]! as String,
              numberOfWords,
              comment: word["comment"] as String?,
              grammarRule: word["grammarRule"] as String?
            ),
          );
        }
      }
      this._words = _words;
      return _words;
    }
  }

  WordRepo() {}
}
