import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testandoprojetos/pages/principal.dart';
import 'package:testandoprojetos/pages/user.dart';
import 'package:testandoprojetos/widgets/principal/barra_navegacao.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: _Settings(),
    );
  }
}

class _Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            "Settings",
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Principal(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //Botão de perfil
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 40),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 180),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => User(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //Indicação de configurações
                Container(
                  alignment: Alignment.centerLeft, // Alinhe o texto à esquerda
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "General Settings",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Tema do app
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.brightness_4,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Mode",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 190),
                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (newValue) {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Language",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 180),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.question_mark,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "About",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 208),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error,
                        size: 32,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Terms and conditions",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(width: 90),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BarraNavegacao(),
      ),
    );
  }
}
