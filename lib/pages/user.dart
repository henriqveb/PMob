import 'package:flutter/material.dart';
import 'package:testandoprojetos/widgets/principal/barra_navegacao.dart';
import 'package:testandoprojetos/widgets/user/atualizar_textos.dart';
import 'package:testandoprojetos/widgets/user/linha_perfil.dart';
import 'package:testandoprojetos/widgets/user/submit_button.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Edit profile",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 0.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        shadowColor: Color.fromARGB(0, 0, 0, 10),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff5de0e6),
                Color(0xff004aad),
              ],
              transform: GradientRotation(90),
            ),
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            LinhaPerfil(),
            SizedBox(height: 25),
            AtualizarTextos(),
            SizedBox(height: 25),
            SubmitButton(),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacao(),
    );
  }
}
