import 'package:flutter/material.dart';
import 'package:testandoprojetos/widgets/esqueci_senha/container_imagem_esqueci_senha.dart';
import 'package:testandoprojetos/widgets/esqueci_senha/forgot_password_form.dart';
import 'package:testandoprojetos/widgets/esqueci_senha/texto_esqueci_senha.dart';
import 'package:testandoprojetos/widgets/login/container_login.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({Key? key}) : super(key: key);

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ContainerLogin(),
          const SizedBox(height: 30),
          const ContainerImagemEsqueciSenha(),
          const SizedBox(height: 18),
          const TextoEsqueciSenha(),
          const SizedBox(height: 25),
          const ForgotPasswordForm()
        ],
      ),
    );
  }
}
