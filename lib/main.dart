import 'package:flutter/material.dart';
//import 'package:testandoprojetos/pages/esqueci_senha.dart';
//import 'package:testandoprojetos/pages/principal.dart';
//import 'package:testandoprojetos/pages/login.dart';
import 'package:testandoprojetos/pages/cadastro.dart';
//import 'package:testandoprojetos/pages/settings.dart';
//import 'package:testandoprojetos/pages/user.dart';
//import 'package:testandoprojetos/pages/search.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      //home: Principal(),
      //home: Login(),
      home: Cadastro(),
      //home: EsqueciSenha(),
      //home: Settings(),
      //home: User(),
      //home: Search(),
    ),
  );
}
