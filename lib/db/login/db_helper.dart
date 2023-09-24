import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    // /users/data/0/ifal
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    print('$dbPath');
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE pacote (id INTEGER PRIMARY KEY, nome varchar(100), imagem varchar(100), cidade varchar(100), titulo varchar(100), transporte varchar(100), validade varchar(100), precoAnterior integer, precoAtual integer, numDiarias integer, desconto integer, numPessoas integer, politicaCancelamento varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO pacote (id, nome, imagem, cidade, titulo, transporte, validade, precoAnterior, precoAtual, numDiarias, desconto, numPessoas, politicaCancelamento) VALUES (1, 'Pacote Amsterdam', 'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-amsterda-capa2019-03.jpg', 'AMSTERDAM, NLD', 'Pacote Amsterdam - 2023/2024', 'Aéreo + Hospedagem', '01 Ago 2023 a 31 Dez 2024', '5486', '4389', 8, 20, 2, 'Cancelamento grátis');";
    await db.execute(sql);

    sql =
    "INSERT INTO pacote (id, nome, imagem, cidade, titulo, transporte, validade, precoAnterior, precoAtual, numDiarias, desconto, numPessoas, politicaCancelamento) VALUES (2, 'Pacote Cancún', 'https://blogmaladeviagem.com.br/wp-content/uploads/2016/11/Blog-Mala-de-Viagem-cancun.jpg', 'CANCÚN, MEX', 'Pacote Cancún 2023/2024', 'Aéreo + Transfer Grátis', '01 Nov 2023 a 31 Dez 2024', '6500', '3854', 5, 28, 1, 'Cancelamento grátis');";
    await db.execute(sql);

    sql =
    "INSERT INTO pacote (id, nome, imagem, cidade, titulo, transporte, validade, precoAnterior, precoAtual, numDiarias, desconto, numPessoas, politicaCancelamento) VALUES (3, 'Pacote Maragogi', 'https://upload.wikimedia.org/wikipedia/commons/b/b8/Gal%C3%A9s_de_maragogi.jpg', 'MARAGOGI, BRA', 'Pacote Maragogi 2024', 'Aéreo + Transfer Grátis', '01 Jan 2024 a 31 Dez 2024', '4600', '2650', 7, 36, 2, '07 dias p/ Cancelamento grátis');";
    await db.execute(sql);

    if(version != 1){
      onUpgrade(db, 1, version);
    }
  }

  Future<FutureOr<void>> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql = "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))";
      await db.execute(sql);

      sql = "INSERT INTO user (username, password) VALUES ('joao@gmail.com', '123456')";
      await db.execute(sql);
    }
  }
}