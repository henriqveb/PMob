import 'package:flutter/material.dart';
import 'package:testandoprojetos/domain/principal/faculdade.dart';

class CardFaculdade extends StatelessWidget {
  final Faculdade faculdade;

  const CardFaculdade({Key? key, required this.faculdade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.grey[100],
        child: ListTile(
          leading: Image.asset(
            faculdade.url,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: Text(
            faculdade.nome,
            style: TextStyle(color: Color(0xff0e9099)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faculdade.descricao,
                overflow: TextOverflow.ellipsis, // Adicionado o overflow
              ),
              SizedBox(height: 8), // Adicionado um espaçamento entre as linhas
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < faculdade.numEstrelas
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