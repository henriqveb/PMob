import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'database_service.dart';

class DataHelper {
  final String dbName;
  final String tableName;
  final String sqlFields;

  DataHelper(
      {required this.dbName, required this.tableName, required this.sqlFields});

  Future<String> _fullPath(String dbName) async {
    String name = '$dbName.db';
    final dbPath = await getDatabasesPath();
    return join(dbPath, name);
  }

  Future<Database> initialize() async {
    final path = await _fullPath(dbName);
    var database = await openDatabase(path, version: 2,
      onCreate: onCreate,
    );
    return database;
  }

  Future<void> onCreate(Database database, int version) async {
    await DatabaseService().createTable(database, tableName, sqlFields);
    if (version != 1) {
      onUpgrade(database, 1, version);
    }
  }

  Future<FutureOr<void>> onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      await DatabaseService().createTable(database, tableName, sqlFields);
    }
  }
}