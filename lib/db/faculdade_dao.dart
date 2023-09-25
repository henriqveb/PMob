import 'dart:async';
import 'package:testandoprojetos/db/data_helper.dart';

import '../domain/principal/faculdade.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FaculdadeDao {
  Faculdade faculdade2 = Faculdade(nome: "UFAL", descricao: "Universidade Federal de Alagoas", id: 2, numEstrelas: 4, url: "images/UFAL.jpeg");
  Faculdade faculdade3 = Faculdade(nome: "UFAL", descricao: "Universidade Federal de Alagoas", id: 3, numEstrelas: 4, url: "images/UFAL.jpeg");
  Faculdade faculdade4 = Faculdade(nome: "UFAL", descricao: "Universidade Federal de Alagoas", id: 4, numEstrelas: 4, url: "images/UFAL.jpeg");
  Faculdade faculdade5 = Faculdade(nome: "UFAL", descricao: "Universidade Federal de Alagoas", id: 5, numEstrelas: 4, url: "images/UFAL.jpeg");
  Faculdade faculdade6 = Faculdade(nome: "UFAL", descricao: "Universidade Federal de Alagoas", id: 6, numEstrelas: 4, url: "images/UFAL.jpeg");
  String dbName = 'faculdade';
  String tableName = 'faculdade';
  String sqlFields = 'id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, descricao TEXT NOT NULL, numEstrelas INTEGER NOT NULL, url TEXT NOT NULL';

  Future<List<Faculdade>> findAll() async {
    DataHelper dbHelper = DataHelper(dbName: dbName, tableName: tableName, sqlFields: sqlFields);
    Database database = await dbHelper.initialize();
    database.insert(tableName, faculdade2.toJson());
    database.insert(tableName, faculdade3.toJson());
    database.insert(tableName, faculdade4.toJson());
    database.insert(tableName, faculdade5.toJson());
    database.insert(tableName, faculdade6.toJson());
    String sql = 'SELECT * FROM $tableName;';
    final resultSet = await database.rawQuery(sql);

    List<Faculdade> list = [];
    for (var json in resultSet) {
      var newFaculdade = Faculdade.fromJson(json);
      list.add(newFaculdade);
    }
    return list;
  }
}