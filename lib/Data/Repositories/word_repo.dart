import 'package:flutter/foundation.dart';
import 'package:vocab/Data/Model/theme.dart';
import 'package:vocab/Data/Model/user.dart';
import 'package:vocab/Data/Model/words.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WordRepo {
  List<Theme>? _themes;

  /// The current user of the application. This is set by the user, and depending on
  /// this, the same words won't be loaded.
  User _currentUser;

  WordRepo(this._currentUser);

  Future<List<Theme>> words() async {
    if (_themes != null) {
      return _themes!;
    } else {
      List<Theme> _themes = [];

      final fullWord = await jsonDecode(await rootBundle.loadString("assets/${_currentUser.currentlySelected}.json"));
      int numberOfWords = 0;

      for (Map<String, dynamic> element in fullWord.values) {
        numberOfWords += element.length;
      }
      for (Map<String, dynamic> theme in fullWord){
        //final _themeName = theme
        for (Map<String, dynamic> element in theme.values) {
          List<Words> _words = [];
          for (Map<String, dynamic> word in element.values) {
            _words.add(
              Words(word["english"]! as String, word["spanish"]! as String, word["french"]! as String,
                  numberOfWords.toDouble(),
                  comment: word["comment"] as String?, grammarRule: word["grammarRule"] as String?),
            );
          }
        }
      } 
      this._themes = _themes;
      return _themes;
    }
  }
}
