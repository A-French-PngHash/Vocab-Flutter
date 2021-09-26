import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';
import 'package:vocab/Data/Repositories/db_word_repo.dart';
import 'package:vocab/Interface/Elements/correct.dart';

class DbSessionRepo {
  static final DbSessionRepo _singleton = DbSessionRepo._internal();
  factory DbSessionRepo() => _singleton;
  DbSessionRepo._internal();

  final DatabaseHandler _databaseHandler = DatabaseHandler();
  final DbWordRepo dbWordRepo = DbWordRepo();

  /// Create a blank session and adds it to the database.
  Future<Session> beginSession(int nbTranslationToDo) async {
    final session = Session(correct: 0, incorrect: 0, wordCount: nbTranslationToDo, beginDate: DateTime.now());
    int id = await _databaseHandler.insertNewSession(session);
    session.id = id;
    return session;
  }

  Future<Session?> getSession(int id) async {
    var session_map = await _databaseHandler.getSession(id);
    if (session_map == null) {
      return null;
    } else {
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

      return Session.fromJson(session_map, correct, incorrect);
    }
  }
}
