import 'package:sqflite/sqflite.dart';

class DatabaseService {

  Future<void> createTable(Database database, String tableName, String sqlFields) async {
    await database.execute('CREATE TABLE IF NOT EXISTS $tableName ($sqlFields);');
  }
}