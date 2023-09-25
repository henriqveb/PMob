import 'package:flutter/material.dart';
import '../../db/user_dao.dart';
import '../../pages/cadastro.dart';
import '../../pages/esqueci_senha.dart';
import '../../pages/principal.dart';
import '../../db/auth_service_dao.dart';

class CorpoLogin extends StatefulWidget {
  const CorpoLogin({Key? key}) : super(key: key);

  @override
  State<CorpoLogin> createState() => _CorpoLoginState();
}

class _CorpoLoginState extends State<CorpoLogin> {
  bool _mostrarSenha = false;

  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  final _formKeyUsuario = GlobalKey<FormState>();
  final _formKeySenha = GlobalKey<FormState>();

  final AuthServiceDao _authService = AuthServiceDao();

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
                key: _formKeyUsuario,
                child: TextFormField(
                  controller: usuario,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Nome de usuário ou E-mail",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "O nome de usuário não pode estar vazio";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
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
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
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
                      return "A senha não pode estar vazia";
                    }
                    return null;
                  },
                  obscureText: _mostrarSenha == false ? true : false,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EsqueciSenha();
                      },
                    ));
                  },
                  child: Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 110),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Cadastro();
                      },
                    ));
                  },
                  child: Text(
                    "Criar nova conta",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff58b4ba), Color(0xff004aad)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKeyUsuario.currentState!.validate() &&
                    _formKeySenha.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });

                  bool isUserValid = await onPressed();

                  setState(() {
                    _isLoading = false;
                  });

                  if (isUserValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Principal()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Usuário e/ou senha incorretos!'),
                      ),
                    );
                  }
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> onPressed() async {
    String user = usuario.text;
    String pwd = senha.text;

    bool result = await UserDao().autenticar(user, pwd);
    return result;
  }
}
