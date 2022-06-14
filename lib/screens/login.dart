import 'dart:convert';

import 'package:alcanceaulas/controller/UserController.dart';
import 'package:alcanceaulas/model/AuthUser.dart';
import 'package:alcanceaulas/model/user.dart';
import 'package:alcanceaulas/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  String _loginError = "";
  Future<User>? user;
  void _login() {
    try {
      Provider.of<AuthUser>(context, listen: false)
          .login(_emailController.text, _cpfController.text);
      Navigator.of(context).pushNamed(AppRoutes.DASHBOARD);
    } catch (e) {
      print("Erro encontrado!");
      print(e);
    }

    // DATA_USUARIOS.forEach((element) {
    //   if (element.email == _emailController.text &&
    //       element.cpf == _cpfController.text) {
    //     usuario = element;
    //   }
    // });
    // if (usuario != null) {
    //   Navigator.of(context)
    //       .pushNamed(AppRoutes.DASHBOARD, arguments: usuario as Usuario);
    // } else {
    //   setState(() {
    //     _loginError =
    //         "Usuário não encontrado. Verifique os dados e tente novamente";
    //   });
    // }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://alcancevendas.com.br/wp-content/uploads/2021/07/UI-Design-Alcance-PaginaCaptura.png",
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "Faça login utilizando os dados que você informou na sua inscrição.",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail:"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 16)),
                  TextField(
                    controller: _cpfController,
                    decoration: const InputDecoration(
                      label: Text("CPF:"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 16)),
                  (_loginError != "")
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: Text(
                            _loginError,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                            )),
                          ),
                        )
                      : const Text(""),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: Text(
                        "Entrar".toUpperCase(),
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
