import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/buttonComponent.dart';
import 'package:capyba_challenge/components/loginInputComponent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    password = passwordValue;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 100,
                    child: ButtonComponent(
                      title: 'Entrar',
                      backgroundColor: Colors.green.shade400,
                    )),
              ],
            ),
          )),
    );
  }
}
