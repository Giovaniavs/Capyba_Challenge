import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/auth_services.dart';
import 'package:capyba_challenge/components/buttonComponent.dart';
import 'package:capyba_challenge/components/inputComponent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'lib/assets/images/capyba_logo.png',
                    width: 80,
                    height: 80,
                  ),
                  Text(
                    'Faça o login na plataforma!',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputComponent(
                          typeOfInput: 'Email',
                          label: 'E-mail',
                          onChanged: (emailValue) {
                            email = emailValue;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InputComponent(
                          typeOfInput: 'Password',
                          label: 'Senha',
                          onChanged: (passwordValue) {
                            password = passwordValue;
                          },
                        ),
                      ],
                    ),
                  ),
                  ButtonComponent(
                    width: 90,
                    title: 'Entrar',
                    fontSize: 20,
                    backgroundColor: Colors.greenAccent.shade700,
                    onPressed: () async {
                      print(email);
                      print(password);
                      // dynamic result = await _auth.signInAnonymous();
                      // if (result == null) {
                      //   print('failed');
                      // } else {
                      //   print(result.uid);
                      //   Navigator.of(context).pushReplacementNamed('/home');
                      // }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
