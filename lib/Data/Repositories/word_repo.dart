import 'package:flutter/foundation.dart';
import 'package:vocab/Data/Model/theme.dart';
import 'package:vocab/Data/Model/words.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class WordRepo {
  List<ThemeModel>? _themes;

  /// The current user of the application. This is set by the user, and depending on
  /// this, the same words won't be loaded.
  final String _currentUser;

  WordRepo(this._currentUser);

  /// Returns a list of themes.
  ///
  /// Note : The theme objects contains the words in a property called words.
  /// IMPORTANT NOTICE : The score is not set for words when getting this property.
  Future<List<ThemeModel>> get words_with_theme async {
    if (_themes != null) {
      return _themes!;
    } else {
      List<ThemeModel> _themes = [];

      final fullWord = await jsonDecode(await rootBundle.loadString("assets/${_currentUser}.json"));
      int numberOfWords = 0;

      for (Map<String, dynamic> element in fullWord["themes"]) {
        numberOfWords += element["words"]!.length as int;
      }
      for (Map<String, dynamic> theme in fullWord["themes"]) {
        final List<Words> _words = [];
        for (Map<String, dynamic> word in theme["words"]) {
          _words.add(
            Words(word["english"]! as String, word["spanish"]! as String, word["french"]! as String,
                comment: word["comment"] as String?, grammarRule: word["grammarRule"] as String?),
          );
        }
        _themes.add(ThemeModel(theme["name"], _words));
      }
      this._themes = _themes;
      return _themes;
    }
  }

  /// Return a list of themes where the name matches the names provided.
  Future<List<ThemeModel>> get_themes({required List<String> names}) async {
    final all_themes = await words_with_theme;
    final selected_themes = all_themes.where((element) => names.contains(element.name)).toList();
    int number_of_words = 0;
    for (ThemeModel i in selected_themes) {
      number_of_words += i.words.length;
    }
    for (ThemeModel i in selected_themes) {
      for (Words j in i.words) {
        j.score = number_of_words.toDouble();
      }
    }
    return selected_themes;
  }

  /// Returns a list of all the themes as string.
  Future<List<String>> get theme_names async {
    final themes = await this.words_with_theme;
    return themes.map((e) => e.name).toList();
  }
}
