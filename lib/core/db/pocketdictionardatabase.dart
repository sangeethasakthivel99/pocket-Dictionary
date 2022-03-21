import 'package:path/path.dart';
import 'package:pocket_dictionary/core/db/SearchResultEntity.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class PocketDictionaryDatabase {
  static final PocketDictionaryDatabase instance =
      PocketDictionaryDatabase.init();

  factory PocketDictionaryDatabase() => instance;
  static Database? _database;

  PocketDictionaryDatabase.init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "pocketDictionary.db");
    var db = await openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  _createDB(Database db, int version) async {
    await db
        .execute('CREATE TABLE Bookmarks (key TEXT PRIMARY KEY, data TEXT)');
    await db
        .execute('CREATE TABLE RecentSearch (key TEXT PRIMARY KEY, data TEXT)');
  }

  addToBookmarks(SearchResultEntity bookmarkData) async {
    var dbClient = await instance.database;
    int result = await dbClient.insert("Bookmarks", bookmarkData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  addToRecent(SearchResultEntity recentlySearchedData) async {
    var dbClient = await instance.database;
    int result = await dbClient.insert(
        "RecentSearch", recentlySearchedData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  getBookmark(String key) async {
    var dbClient = await instance.database;
    var data = await dbClient.query(
      "Bookmarks",
      where: 'key = ?',
      whereArgs: [key],
    );
    return data.map((json) => SearchResultEntity.fromJson(json)).toList();
  }

  getAllBookmarks() async {
    var dbClient = await instance.database;
    var data = await dbClient.query("Bookmarks");
    return data.map((json) => SearchResultEntity.fromJson(json)).toList();
  }

  getAllSearchHistory() async {
    var dbClient = await instance.database;
    var data = await dbClient.query("RecentSearch");
    return data.map((json) => SearchResultEntity.fromJson(json)).toList();
  }

  removeFromBookmark(String key) async {
    var dbClient = await instance.database;
    int result =
        await dbClient.delete("Bookmarks", where: 'key = ?', whereArgs: [key]);
    return result;
  }
}
