import 'package:flutter/material.dart';
import 'package:testandoprojetos/db/principal/faculdade_dao.dart';
import 'package:testandoprojetos/domain/principal/faculdade.dart';
import '../principal/card_faculdade.dart';

class ListaFaculdades extends StatelessWidget {
  final Future<List<Faculdade>> futureFaculdades = FaculdadeDao().findAll();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Faculdade>>(
      future: futureFaculdades,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao carregar as faculdades."),
          );
        } else if (snapshot.hasData) {
          List<Faculdade> faculdades = snapshot.data!;
          return ListView.separated( // Usando ListView.separated para adicionar um espaçamento entre os itens da lista
            separatorBuilder: (context, index) => SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: faculdades.length,
            itemBuilder: (context, index) => CardFaculdade(
              faculdade: faculdades[index],
            ),
          );
        } else {
          return Center(
            child: Text("Nenhum dado encontrado."),
          );
        }
      },
    );
  }
}