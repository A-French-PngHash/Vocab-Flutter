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

  /// Returns a list of themes.
  ///
  /// The theme objects contains the words.
  Future<List<Theme>> get words_with_theme async {
    if (_themes != null) {
      return _themes!;
    } else {
      List<Theme> _themes = [];

      final fullWord = await jsonDecode(await rootBundle.loadString("assets/${_currentUser.currentlySelected}.json"));
      int numberOfWords = 0;

      for (Map<String, dynamic> element in fullWord.values) {
        numberOfWords += element.length;
      }
      for (dynamic theme in fullWord.values) {
        final List<Words> _words = [];
        for (Map<String, dynamic> word in theme["words"]) {
          _words.add(
            Words(word["english"]! as String, word["spanish"]! as String, word["french"]! as String,
                numberOfWords.toDouble(),
                comment: word["comment"] as String?, grammarRule: word["grammarRule"] as String?),
          );
        }
        _themes.add(Theme(theme["name"], _words));
      }
      this._themes = _themes;
      return _themes;
    }
  }

  /// Return a list of themes where the name matches the names provided.
  Future<List<Theme>> get_themes({required List<String> names}) async {
    final all_themes = await words_with_theme;
    return all_themes.where((element) => names.contains(element.name)).toList();
  }

  /// Returns a list of all the theme as string.
  Future<List<String>> get theme_names async {
    final themes = await this.words_with_theme;
    return themes.map((e) => e.name).toList();
  }
}
