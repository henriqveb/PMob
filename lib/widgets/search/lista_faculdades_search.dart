import 'package:flutter/material.dart';
import 'package:testandoprojetos/db/faculdade_search_dao.dart';
import 'package:testandoprojetos/domain/search/faculdade_search.dart';
import 'package:testandoprojetos/widgets/search/card_faculdades_search.dart';
import 'campo_texto.dart';

class ListaFaculdadesSearch extends StatefulWidget {
  const ListaFaculdadesSearch({Key? key}) : super(key: key);

  @override
  State<ListaFaculdadesSearch> createState() => _ListaFaculdadesSearchState();
}

class _ListaFaculdadesSearchState extends State<ListaFaculdadesSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<FaculdadeSearch> searchResults = [];

  void searchColleges(String searchText) async {
    final results = await FaculdadeSearchDao().searchFaculdades(searchText);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoTexto(),
        if (searchResults!.isEmpty)
          Center(
            child: Text("Nenhum resultado encontrado."),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return CardFaculdadesSearch(
                  faculdadeSearch: searchResults[index],
                );
              },
            ),
          ),
      ],
    );
  }
}
