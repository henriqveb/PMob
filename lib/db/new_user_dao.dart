

import 'package:sqflite/sqflite.dart';

import '../domain/login/new_user.dart';
import 'data_helper.dart';
import 'database_service.dart';

class NewUserDao{
  String sqlFields = 'username varchar(100) PRIMARY KEY, password varchar(100), email varchar(100), fullName varchar(100)';

  Future<void> insertUserInDatabase(NewUser user) async{
    Database database = await DataHelper(dbName: 'faculdades', tableName: 'user', sqlFields: sqlFields).initialize();
    DatabaseService().createTable(database, 'user', sqlFields);
    database.insert('user', user.toJson());
  }
}