import 'package:flutter/material.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff5de0e6), Color(0xff004aad)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 30,
            child: Image.asset(
              "images/icone.png",
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Text(
              "Bem vindo, \nUsuário",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: 0.2,
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 20,
            child: Image.asset(
              'images/chapeuzinho.png',
              width: 160,
              height: 100,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
