import 'package:flutter/material.dart';
import 'package:testandoprojetos/pages/login.dart';

class ForgotPassword {
  Future<void> sendPasswordEmail(BuildContext context, String email) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email Enviado'),
        content: Text('Um email foi enviado para: $email'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );

    await Future.delayed(Duration(seconds: 5));

    Navigator.pop(context); // Fechar o dialog de carregamento

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
