import 'package:flutter/material.dart';
import 'package:testandoprojetos/widgets/principal/barra_navegacao.dart';
import 'package:testandoprojetos/widgets/principal/container_home.dart';
import 'package:testandoprojetos/widgets/principal/lista_faculdades.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContainerHome(),
            const SizedBox(height: 30),
            ListaFaculdades(),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacao(),
    );
  }
}
