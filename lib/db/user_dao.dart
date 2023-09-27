import 'package:sqflite/sqlite_api.dart';
import 'package:testandoprojetos/db/data_helper.dart';
import 'package:testandoprojetos/db/database_service.dart';
import 'package:testandoprojetos/domain/login/new_user.dart';

class UserDao {
  String sqlFields = 'username varchar(100) PRIMARY KEY, password varchar(100), email varchar(100), fullName varchar(100)';

  Future<bool> autenticar(String username, String password) async {
    Database database = await DataHelper(dbName: 'faculdade', tableName: 'user', sqlFields: sqlFields).initialize();
    DatabaseService().createTable(database, 'user', sqlFields);
    NewUser user = NewUser(username: 'ai calica', password: '1234', fullName: 'teste campo', email: 'teste@gmail.com');
    database.insert('user', user.toJson());
    String sql = 'SELECT * '
        'FROM USER '
        'WHERE USERNAME = ? '
        'AND PASSWORD = ?;';

    final resultSet = await database.rawQuery(sql, [username, password]);

    return resultSet.isNotEmpty;
  }
}

