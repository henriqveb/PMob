import 'package:flutter/material.dart';
import '../../domain/search/faculdade_search.dart';
import '../../db/search/faculdade_search_dao.dart';


class CardFaculdadesSearch extends StatelessWidget {
  final FaculdadeSearch faculdadeSearch;

  const CardFaculdadesSearch({Key? key, required this.faculdadeSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.grey[100],
        child: ListTile(
          leading: Image.asset(
            faculdadeSearch.url,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: Text(
            faculdadeSearch.nome,
            style: TextStyle(color: Color(0xff0e9099)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faculdadeSearch.descricao,
                overflow: TextOverflow.ellipsis, // Adicionado o overflow
              ),
              SizedBox(height: 8), // Adicionado um espaçamento entre as linhas
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < faculdadeSearch.numEstrelas
                        ? Icons.star
                        : Icons.star_border,
                    color: Color(0xff0e9099),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            // Redirecionar para uma nova tela ou executar uma ação
          },
        ),
      ),
    );
  }
}
