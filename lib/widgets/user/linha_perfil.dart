import 'package:flutter/material.dart';

class LinhaPerfil extends StatefulWidget {
  const LinhaPerfil({Key? key});

  @override
  State<LinhaPerfil> createState() => _LinhaPerfilState();
}

class _LinhaPerfilState extends State<LinhaPerfil> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25),
        Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("images/japa.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Alterar foto de perfil",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}