import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocab/Data/Model/session.dart';

class DatabaseHandler {
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
            "CREATE TABLE Session(correct INTEGER, incorrect INTEGER, beginDate TEXT, endDate TEXT, wordCount INTEGER, completed BOOLEAN NOT NULL DEFAULT(1));",
          );
          await db.execute(
              "CREATE TABLE Word (wordShown TEXT NOT NULL, expectedTranslation TEXT NOT NULL, inputedTranslation  TEXT NOT NULL, scoreWhenShown DOUBLE );");
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion == 1 && newVersion == 2) {
            await db.execute("ALTER TABLE Session ADD COLUMN completed BOOLEAN NOT NULL DEFAULT(1);");
            await db.execute(
                "CREATE TABLE Word (wordShown TEXT NOT NULL, expectedTranslation TEXT NOT NULL, inputedTranslation  TEXT NOT NULL, scoreWhenShown DOUBLE );");
          }
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 2,
      );
    }
    return Future.value(_database);
  }

  Future<void> insertNewSession(Session session) async {
    final db = await database;
    await db.insert("Session", session.toJson());
  }
}
