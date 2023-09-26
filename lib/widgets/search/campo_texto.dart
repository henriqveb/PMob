import 'package:flutter/material.dart';
import '../../db/faculdade_search_dao.dart';
import '../../domain/search/faculdade_search.dart';

class CampoTexto extends StatefulWidget {
  final Function(List<FaculdadeSearch>) onSearchResults;

  const CampoTexto({Key? key, required this.onSearchResults}) : super(key: key);


  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final TextEditingController _controladorPesquisa = TextEditingController();
  List<FaculdadeSearch> resultadosPesquisa = [];

  void pesquisarFaculdades(String textoPesquisa) async {
    final resultados = await FaculdadeSearchDao().searchFaculdades(textoPesquisa);
    setState(() {
      resultadosPesquisa = resultados;
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
                  controller: _controladorPesquisa,
                  onChanged: (text) {
                    setState(() {
                      pesquisarFaculdades(text);
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "PESQUISAR",
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
                  print("Teste botão");
                  // Quando o ícone de pesquisa for clicado, realizar a pesquisa.
                  pesquisarFaculdades(_controladorPesquisa.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
