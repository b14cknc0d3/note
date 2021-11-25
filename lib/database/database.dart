import 'dart:developer';
import 'dart:io';
//import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:note/model/note.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "note.db";
  static const _databaseVersion = 1;
  static const table = 'Notedb';
  static const columnId = '_id';
  static const columnTitle = 'title';
  static const columnNote = 'note';
  static const columnDate = 'createAt';
  static const columnFavourite = 'favourite';
  static const columnIsInTrash = 'isInTrash';
  static const columnFolderName = 'folderName';
  static const columnUpdatedAt = 'updatedAt';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String dataPath = p.join(dbPath, _databaseName);

    log(dataPath);

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, _databaseName);
    log(path);

    return await openDatabase(dataPath,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
	  $columnId INTEGER PRIMARY KEY
  , $columnTitle  TEXT
  ,$columnNote TEXT      
  ,$columnDate  VARCHAR(20)
  , $columnUpdatedAt VARCHAR(20)
  ,$columnFolderName VARCHAR(100) NOT NULL DEFAULT "default"
  ,$columnIsInTrash INT NOT NULL DEFAULT 0
  ,$columnFavourite INT NOT NULL DEFAULT 0

);
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row,
        conflictAlgorithm: ConflictAlgorithm.replace, nullColumnHack: "");
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Note>> queryAllRows() async {
    Database db = await instance.database;
    final data = await db.query(table);
    log(data.toString());
    final List<Note> noteList =
        data.map<Note>((e) => Note.fromJson(e)).toList();
    log(noteList.toString());
    return noteList;
  }

  // Future<List<Map<String, dynamic>>> queryAllRowOrderByTabId() async {
  //   Database db = await instance.database;
  //   return await db.rawQuery('SELECT  * FROM ApiMan ORDER  BY "tabId" ASC ');
  // }

//TODO :ADD WORKSPACE support [AND workspace = "$input"]
  // Future<List<Map<String, dynamic>>> queryAllApiRowOrderByTabId() async {
  //   Database db = await instance.database;
  //   return await db.rawQuery(
  //       'SELECT  * FROM ApiMan WHERE "backend_type" = "http" ORDER  BY "tabId" ASC ');
  // }

  // Future<List<Map<String, dynamic>>> queryAllWsRowOrderByTabId() async {
  //   Database db = await instance.database;
  //   return await db.rawQuery(
  //       'SELECT  * FROM ApiMan WHERE "backend_type" = "ws" ORDER  BY "tabId" ASC ');
  // }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    var i = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(i);
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row, int id) async {
    Database db = await instance.database;

    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<Map<String, Object?>> selectRowById(int id) async {
    Database db = await instance.database;
    var result = await db.query(table, where: '$columnId = ?', whereArgs: [id]);

    log(result.toString());
    if (result.isNotEmpty) {
      return result[0];
    } else {
      throw Exception("Empty Result");
    }
  }

  Future deleleAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
