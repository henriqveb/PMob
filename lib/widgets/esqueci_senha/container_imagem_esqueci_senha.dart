import 'package:flutter/material.dart';

class ContainerImagemEsqueciSenha extends StatefulWidget {
  const ContainerImagemEsqueciSenha({Key? key}) : super(key: key);

  @override
  State<ContainerImagemEsqueciSenha> createState() =>
      _ContainerImagemEsqueciSenhaState();
}

class _ContainerImagemEsqueciSenhaState
    extends State<ContainerImagemEsqueciSenha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 225,
      child: Image.asset(
        "images/email.png",
        height: 100,
        width: 200,
      ),
    );
  }
}
