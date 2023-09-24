import 'package:flutter/material.dart';
import 'package:testandoprojetos/db/search/faculdade_search_dao.dart';
import 'package:testandoprojetos/domain/search/faculdade_search.dart';
import 'package:testandoprojetos/widgets/search/card_faculdades_search.dart';

class ListaFaculdadesSearch extends StatefulWidget {
  const ListaFaculdadesSearch({super.key});

  @override
  State<ListaFaculdadesSearch> createState() => _ListaFaculdadesSearchState();
}

class _ListaFaculdadesSearchState extends State<ListaFaculdadesSearch> {
  final Future<List<FaculdadeSearch>> futureFaculdades = FaculdadeSearchDao().findAll();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FaculdadeSearch>>(
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
          List<FaculdadeSearch> faculdades = snapshot.data!;
          return ListView.separated( // Usando ListView.separated para adicionar um espaçamento entre os itens da lista
            separatorBuilder: (context, index) => SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: faculdades.length,
            itemBuilder: (context, index) => CardFaculdadesSearch(
              faculdadeSearch: faculdades[index],
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
