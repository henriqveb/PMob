import 'package:flutter/material.dart';
import 'package:testandoprojetos/db/validator_of_register_dao.dart';
import 'package:testandoprojetos/pages/principal.dart';

class CorpoCadastro extends StatefulWidget {
  const CorpoCadastro({Key? key}) : super(key: key);

  @override
  State<CorpoCadastro> createState() => _CorpoCadastroState();
}

class _CorpoCadastroState extends State<CorpoCadastro> {
  bool _mostrarSenha = false;

  TextEditingController nome = TextEditingController();
  TextEditingController usuario = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  final _formKeyNome = GlobalKey<FormState>();
  final _formKeyUsuario = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeySenha = GlobalKey<FormState>();

  final ValidatorOfRegisterDao _validatorOfRegister = ValidatorOfRegisterDao();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Form(
                key: _formKeyNome,
                child: TextFormField(
                  controller: nome,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.people_sharp),
                    hintText: 'Nome completo',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Form(
                key: _formKeyUsuario,
                child: TextFormField(
                  controller: usuario,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.people_sharp),
                    hintText: 'Nome de usuário',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Form(
                key: _formKeyEmail,
                child: TextFormField(
                  controller: email,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'E-mail',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Form(
                key: _formKeySenha,
                child: TextFormField(
                  controller: senha,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.lock_rounded),
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      child: Icon(_mostrarSenha == false
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: () {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    return null;
                  },
                  obscureText: !_mostrarSenha,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff58b4ba),
                  Color(0xff004aad),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKeyNome.currentState!.validate() &&
                    _formKeyUsuario.currentState!.validate() &&
                    _formKeyEmail.currentState!.validate() &&
                    _formKeySenha.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });

                  await _validatorOfRegister.login();

                  setState(() {
                    _isLoading = false;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Principal()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      "Login",
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
