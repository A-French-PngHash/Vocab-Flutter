import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

/// Comunicates with the db handler to add words, the user did, in the database.
/// This is basically used to log stuff, compared to the other word repo which
/// is used to get stuff from the jsons file.
class DbWordRepo {
  static final DbWordRepo _singleton = DbWordRepo._internal();
  factory DbWordRepo() => _singleton;
  DbWordRepo._internal();

  DatabaseHandler _databaseHandler = DatabaseHandler();

  Future<void> linkWordToSession({
    required Session session,
    required String wordShown,
    required String expectedTranslation,
    required String inputedTranslation,
    required double scoreWhenShown,
  }) async {
    final wordObj = WordDb(
      sessionId: session.id!,
      wordShown: wordShown,
      expectedTranslation: expectedTranslation,
      inputedTranslaton: inputedTranslation,
      scoreWhenShown: scoreWhenShown,
    );
    await this._databaseHandler.insertWord(wordObj);
  }
}