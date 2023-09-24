import 'package:flutter/material.dart';

class ContainerLogin extends StatefulWidget {
  const ContainerLogin({Key? key}) : super(key: key);

  @override
  State<ContainerLogin> createState() => _ContainerLoginState();
}

class _ContainerLoginState extends State<ContainerLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff58b4ba), Color(0xff004aad)])),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "BuscaUni",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset("images/pesquisador.png",
                  width: 80, height: 120, fit: BoxFit.fill)),
          Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/mapa teste.png",
                width: 80,
                height: 90,
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
