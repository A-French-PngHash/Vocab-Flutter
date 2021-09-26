import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';
import 'package:vocab/Data/Repositories/db_word_repo.dart';
import 'package:vocab/Interface/Elements/correct.dart';

class DbSessionRepo {
  static DatabaseHandler _databaseHandler = DatabaseHandler();
  static DbWordRepo dbWordRepo = DbWordRepo();

  /// Create a blank session and adds it to the database.
  static Future<Session> beginSession(int nbTranslationToDo, String user) async {
    final session =
        Session(correct: 0, incorrect: 0, wordCount: nbTranslationToDo, beginDate: DateTime.now(), user: user);
    int id = await _databaseHandler.insertNewSession(session);
    session.id = id;
    return session;
  }

  static Future<Session?> getSession(int id) async {
    var session_map = await _databaseHandler.getSession(id);
    if (session_map == null) {
      return null;
    } else {
      final correctAndIncorrectCount = await _getCorrectAndIncorrectFor(id);
      return Session.fromJson(session_map, correctAndIncorrectCount[0], correctAndIncorrectCount[1]);
    }
  }

  static Future<Session?> lastSessionFromUser(String user) async {
    final json = await _databaseHandler.lastSessionFrom(user);
    if (json == null) {
      return null;
    }
    print(json["id"]);
    final correctAndIncorrectCount = await _getCorrectAndIncorrectFor(json["id"]! as int);
    return Session.fromJson(json, correctAndIncorrectCount[0], correctAndIncorrectCount[1]);
  }

  static Future<List> _getCorrectAndIncorrectFor(int id) async {
    final words = await dbWordRepo.getWords(id);
    int correct = 0;
    int incorrect = 0;
    for (WordDb word in words) {
      if (word.expectedTranslation == word.inputedTranslaton) {
        correct += 1;
      } else {
        incorrect += 1;
      }
    }
    return [correct, incorrect];
  }
}
