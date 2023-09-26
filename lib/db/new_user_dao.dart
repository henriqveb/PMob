import 'package:sqflite/sqlite_api.dart';
import 'package:testandoprojetos/db/data_helper.dart';
import 'package:testandoprojetos/db/database_service.dart';
import 'package:testandoprojetos/domain/login/user.dart';

class NewUserDao{
  String sqlFields = 'username TEXT NOT NULL PRIMARY KEY, password TEXT NOT NULL, fullName TEXT NOT NULL, email TEXT NOT NULL';


}