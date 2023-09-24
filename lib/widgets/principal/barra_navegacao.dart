import 'package:flutter/material.dart';
import 'package:testandoprojetos/pages/principal.dart';
import 'package:testandoprojetos/pages/search.dart';
import 'package:testandoprojetos/pages/settings.dart';

class BarraNavegacao extends StatefulWidget {
  const BarraNavegacao({Key? key}) : super(key: key);

  @override
  State createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Principal()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Search()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff5de0e6),
      iconSize: 27,
      unselectedItemColor: Colors.white,
      elevation: 0,
      selectedItemColor: Color(0xffffffff),
      selectedFontSize: 12,
      unselectedFontSize: 12, // Tamanho da fonte para itens não selecionados
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed, // Fixa as labels
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Icons.settings),
        ),
      ],
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    );
  }
}
