import '../../domain/principal/faculdade.dart';

class FaculdadeDao {
  List<Faculdade> faculdades = const [
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 3,
        url: 'images/UFAL.jpeg'),
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 4,
        url: 'images/UFAL.jpeg'),
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 2,
        url: 'images/UFAL.jpeg'),
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
    Faculdade(
        descricao: "Universidade 1",
        nome: 'Ufal',
        numEstrelas: 5,
        url: 'images/UFAL.jpeg'),
  ];

  Future<List<Faculdade>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return faculdades;
  }
}
