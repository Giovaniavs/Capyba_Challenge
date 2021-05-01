import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/buttonComponent.dart';
import 'package:capyba_challenge/components/inputComponent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/capyba_logo.png',
                      width: 80, height: 80),
                  SizedBox(
                    height: 80,
                  ),
                  InputComponent(
                    typeOfInput: 'Email',
                    onChanged: (emailValue) {
                      email = emailValue;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputComponent(
                    typeOfInput: 'Senha',
                    onChanged: (passwordValue) {
                      print(passwordValue);
                      password = passwordValue;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonComponent(
                    width: 90,
                    title: 'Entrar',
                    fontSize: 18,
                    backgroundColor: Colors.greenAccent.shade700,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
