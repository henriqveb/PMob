import 'package:flutter/material.dart';
import 'package:testandoprojetos/widgets/login/container_login.dart';
import 'package:testandoprojetos/widgets/login/corpo_login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ContainerLogin(),
              const SizedBox(height: 60),
              const CorpoLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
