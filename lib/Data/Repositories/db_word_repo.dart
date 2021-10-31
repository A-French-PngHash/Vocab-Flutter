import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

/// Communicates with the db handler to add words, the user did, in the database.
/// This is basically used to log stuff, compared to the other word repo which
/// is used to get stuff from the jsons file.
class DbWordRepo {
  static Future<void> linkWordToSession({
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
    await DatabaseHandler().insertWord(wordObj);
  }

  static Future<List<WordDb>> getWords(int session_id) async {
    List<WordDb> word_list = [];
    final raw_result = await DatabaseHandler().getWordList(session_id);
    for (Map<String, Object?> element in raw_result) {
      word_list.add(WordDb.fromJson(element));
    }
    return word_list;
  }
}
