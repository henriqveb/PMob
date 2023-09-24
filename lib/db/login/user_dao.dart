import 'package:testandoprojetos/db/login/db_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao {

  Future<bool> autenticar(String username, String password) async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * '
        'FROM USER '
        'WHERE USERNAME = ? '
        'AND PASSWORD = ?;';

    final resultSet = await database.rawQuery(sql, [username, password]);

    return resultSet.isNotEmpty;
  }


}