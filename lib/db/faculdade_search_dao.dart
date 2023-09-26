import '../domain/search/faculdade_search.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../db/data_helper.dart';
import 'package:path/path.dart';

import 'database_service.dart';

class FaculdadeSearchDao {
  FaculdadeSearch faculdadeSearch = FaculdadeSearch(
      id: 1,
      nome: "Uneal",
      numEstrelas: 3,
      descricao: "Universidade Estadual de Alagoas",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch2 = FaculdadeSearch(
      id: 2,
      nome: "Unicamp",
      numEstrelas: 5,
      descricao: "Universidade de Campinas",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch3 = FaculdadeSearch(
      id: 3,
      nome: "PUC-RS",
      numEstrelas: 4,
      descricao: "Pontifícia Universidade Católica do Rio Grande do Sul",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch4 = FaculdadeSearch(
      id: 4,
      nome: "UniNassau",
      numEstrelas: 4,
      descricao: "Universidade Maurício de Nassau",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch5 = FaculdadeSearch(
      id: 5,
      nome: "UFRJ",
      numEstrelas: 3,
      descricao: "Universidade Federal do Rio de Janeiro",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch6 = FaculdadeSearch(
      id: 6,
      nome: "PUC-SP",
      numEstrelas: 5,
      descricao: "Pontifícia Universidade Católica de São Paulo",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch7 = FaculdadeSearch(
      id: 7,
      nome: "PUC-Minas",
      numEstrelas: 4,
      descricao: "Pontifícia Universidade Católica de Minas Gerais",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch8 = FaculdadeSearch(
      id: 8,
      nome: "USP",
      numEstrelas: 5,
      descricao: "Universidade de São Paulo",
      url: "images/UFAL.jpeg");
  FaculdadeSearch faculdadeSearch9 = FaculdadeSearch(
      id: 9,
      nome: "UFMG",
      numEstrelas: 4,
      descricao: "Universidade Federal de Minas Gerais",
      url: "images/UFAL.jpeg");
  String dbname = 'faculdadeSearch';
  String tableName = 'faculdadeSearch';
  String sqlFields =
      'id INTEGER PRIMARY KEY, nome TEXT NOT NULL, descricao TEXT NOT NULL, numEstrelas INTEGER NOT NULL, url TEXT NOT NULL';

  Future<List<FaculdadeSearch>> searchFaculdades(String searchText) async {
    DataHelper dbHelperSearch =
    DataHelper(dbName: dbname, tableName: tableName, sqlFields: sqlFields);
    Database databaseSearch = await dbHelperSearch.initialize();
    //await DatabaseService().createTable(databaseSearch, tableName, sqlFields);

    databaseSearch.insert(tableName, faculdadeSearch.toJson());
    databaseSearch.insert(tableName, faculdadeSearch2.toJson());
    databaseSearch.insert(tableName, faculdadeSearch3.toJson());
    databaseSearch.insert(tableName, faculdadeSearch4.toJson());
    databaseSearch.insert(tableName, faculdadeSearch5.toJson());
    databaseSearch.insert(tableName, faculdadeSearch6.toJson());
    databaseSearch.insert(tableName, faculdadeSearch7.toJson());
    databaseSearch.insert(tableName, faculdadeSearch8.toJson());
    databaseSearch.insert(tableName, faculdadeSearch9.toJson());


    String sql = 'SELECT * FROM $tableName WHERE nome LIKE "%$searchText%";';
    print("Consulta SQL: $sql");

    final resultSearch = await databaseSearch.rawQuery(sql);
    print("Resultado da Consulta: $resultSearch");

    sql = 'SELECT * FROM $tableName;';
    print("Consulta SQL: $sql");

    final result = await databaseSearch.rawQuery(sql);
    print("Resultado da Consulta: $result");

    List<FaculdadeSearch> list = [];
    for (var json in resultSearch) {
      var newFaculdadeSearch = FaculdadeSearch.fromJson(json);
      list.add(newFaculdadeSearch);
    }
    return list;
  }

}
