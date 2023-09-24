import 'package:flutter/material.dart';
import 'package:testandoprojetos/widgets/login/container_login.dart';
import 'package:testandoprojetos/widgets/cadastro/corpo_cadastro.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ContainerLogin(),
          const SizedBox(height: 10),
          const CorpoCadastro()
        ],
      ),
    );
  }
}
