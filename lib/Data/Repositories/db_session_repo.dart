import 'package:vocab/Data/DatabaseHandler.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

class DbSessionRepo {
  static final DbSessionRepo _singleton = DbSessionRepo._internal();
  factory DbSessionRepo() => _singleton;
  DbSessionRepo._internal();

  DatabaseHandler _databaseHandler = DatabaseHandler();

  /// Create a blank session and adds it to the database.
  Future<Session> beginSession(int nbTranslationToDo) async {
    final session = Session(correct: 0, incorrect: 0, wordCount: nbTranslationToDo, beginDate: DateTime.now());
    int id = await _databaseHandler.insertNewSession(session);
    session.id = id;
    return session;
  }

  Future<Session?> getSession(int id) async {
    final session_map = await _databaseHandler.getSession(id);
    if (session_map == null) {
      return null;
    } else {
      return Session.fromJson(session_map);
    }
  }

}
