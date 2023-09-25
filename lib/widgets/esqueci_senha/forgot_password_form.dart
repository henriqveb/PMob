import 'package:flutter/material.dart';
import 'package:testandoprojetos/db/forgot_password.dart'; // Importe a classe

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Validar formulário

  final TextEditingController _emailController =
      TextEditingController(); // Pegar conteúdo do form

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite um email válido';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff58b4ba), Color(0xff004aad)]),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                  String email = _emailController.text;
                  ForgotPassword forgotPassword = ForgotPassword();
                  await forgotPassword.sendPasswordEmail(context, email);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Enviar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
