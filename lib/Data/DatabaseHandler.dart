import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocab/Data/Model/session.dart';
import 'package:vocab/Data/Model/word_db.dart';

class DatabaseHandler {
  static final DatabaseHandler _singleton = DatabaseHandler._internal();
  factory DatabaseHandler() => _singleton;
  DatabaseHandler._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'session_database.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) async {
          // Run the CREATE TABLE statement on the database.
          await db.execute(
            "CREATE TABLE Session ( id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, beginDate TEXT, endDate TEXT, wordCount INTEGER, completed BOOLEAN NOT NULL DEFAULT (1), user TEXT NOT NULL);",
          );
          await db.execute(
              "CREATE TABLE Word (wordShown TEXT NOT NULL, expectedTranslation TEXT NOT NULL, inputedTranslation TEXT NOT NULL, scoreWhenShown DOUBLE, sessionId BIGINT REFERENCES Session (id) NOT NULL);");
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          await db.execute("DROP TABLE IF EXISTS Word;");
          await db.execute("DROP TABLE IF EXISTS Session;");
          await db.execute(
            "CREATE TABLE Session ( id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, beginDate TEXT, endDate TEXT, wordCount INTEGER, completed BOOLEAN NOT NULL DEFAULT (1), user TEXT NOT NULL);",
          );
          await db.execute(
              "CREATE TABLE Word (wordShown TEXT NOT NULL, expectedTranslation TEXT NOT NULL, inputedTranslation TEXT NOT NULL, scoreWhenShown DOUBLE, sessionId BIGINT REFERENCES Session (id) NOT NULL);");
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 4,
      );
    }
    return Future.value(_database);
  }

  /// Insert the given session object and returns its id in the database.
  Future<int> insertNewSession(Session session) async {
    final db = await database;
    int id = await db.insert("Session", session.toJson());
    return id;
  }

  Future<Map<String, Object?>?> getSession(int id) async {
    final db = await database;
    final result = await db.query("Session", where: "id = $id");
    if (result.length == 0) {
      return null;
    }

    return result[0];
  }

  Future<Map<String, Object?>?> lastSessionFrom(String user) async {
    final db = await database;
    final result = await db.query("Session", where: "user = '$user'", limit: 1, orderBy: "beginDate DESC");
    if (result.length == 0) {
      return null;
    }
    return result[0];
  }

  Future<void> insertWord(WordDb word) async {
    final db = await database;
    await db.insert("Word", word.toJson());
  }

  Future<List<Map<String, Object?>>> getWordList(int session_id) async {
    final db = await database;
    final result = db.query("Word", where: "sessionId = $session_id");
    return result;
  }

  Future<void> printAllWord() async {
    final db = await database;
    List<Map<String, Object?>> result = await db.query("Word");
    for (Map<String, Object?> e in result) {
      print(e);
    }
  }
}
