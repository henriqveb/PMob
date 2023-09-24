import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testandoprojetos/widgets/principal/barra_navegacao.dart';
import 'package:testandoprojetos/widgets/search/campo_texto.dart';
import 'package:testandoprojetos/widgets/search/lista_faculdades_search.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
        child: _Search(),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider({bool isDarkMode = false}) : _isDarkMode = isDarkMode;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class _Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CampoTexto(),
            SizedBox(height: 25),
            ListaFaculdadesSearch(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacao(),
    );
  }
}
