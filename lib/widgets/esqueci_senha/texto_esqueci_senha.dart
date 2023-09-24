import 'package:flutter/material.dart';

class TextoEsqueciSenha extends StatefulWidget {
  const TextoEsqueciSenha({Key? key}) : super(key: key);

  @override
  State<TextoEsqueciSenha> createState() => _TextoEsqueciSenhaState();
}

class _TextoEsqueciSenhaState extends State<TextoEsqueciSenha> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        "Para recuperar a sua senha, informe o seu e-mail e enviaremos um código para a alteração da senha.",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff58b4ba),
          fontSize: 18,
        ),
      ),
    );
  }
}
