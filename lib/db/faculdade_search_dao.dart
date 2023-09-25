import '../domain/search/faculdade_search.dart';

class FaculdadeSearchDao {
  List<FaculdadeSearch> faculdadeSearch = const [
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 3,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 4,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 2,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 1,
        url: 'images/UFAL.jpeg'),
    FaculdadeSearch(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 2,
        url: 'images/UFAL.jpeg'),
  ];

  Future<List<FaculdadeSearch>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return faculdadeSearch;
  }
}
