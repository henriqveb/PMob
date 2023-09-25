import 'package:flutter/material.dart';
import '../../db/faculdade_search_dao.dart';
import '../../domain/search/faculdade_search.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final TextEditingController _searchController = TextEditingController();
  List<FaculdadeSearch> searchResults = [];

  void searchFaculdades(String searchText) async {
    final results = await FaculdadeSearchDao().searchFaculdades(_searchController.text);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (text) {
                    // Não é necessário fazer a pesquisa instantaneamente no campo de texto.
                    // A pesquisa será acionada pelo botão de pesquisa.
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "SEARCH",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("teste botão");
                  // Quando o ícone de lupa for clicado, realizar a pesquisa.
                  searchFaculdades(_searchController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
