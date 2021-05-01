import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/inputComponent.dart';
import 'package:capyba_challenge/components/buttonComponent.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  String name = '';
  String email = '';
  String password = '';
  String repeatPassword = '';

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
                  Image.asset('lib/assets/images/capyba_logo.png',
                      width: 80, height: 80),
                  Text(
                    'Realize o seu cadastro!',
                    style: TextStyle(fontSize: 20),
                  ),
                  InputComponent(
                    typeOfInput: 'Name',
                    label: 'Nome',
                    onChanged: (namelValue) {
                      name = namelValue;
                      print(name);
                    },
                  ),
                  InputComponent(
                    typeOfInput: 'Email',
                    label: 'E-mail',
                    onChanged: (emailValue) {
                      email = emailValue;
                    },
                  ),
                  InputComponent(
                    typeOfInput: 'Password',
                    label: 'Senha',
                    onChanged: (passwordValue) {
                      password = passwordValue;
                    },
                  ),
                  InputComponent(
                    typeOfInput: 'Password',
                    label: 'Repita a senha',
                    onChanged: (repeatPasswordValue) {
                      repeatPassword = repeatPasswordValue;
                    },
                  ),
                  ButtonComponent(
                    width: 110,
                    title: 'Cadastrar',
                    fontSize: 20,
                    backgroundColor: Colors.blueAccent.shade400,
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
