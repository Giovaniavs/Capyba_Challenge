import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/inputComponent.dart';
import 'package:capyba_challenge/components/buttonComponent.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _templateInputValidation = GlobalKey<FormState>();
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
              child: Form(
                key: _templateInputValidation,
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
                      validator: (nameValue) {
                        if (nameValue.isEmpty) {
                          return 'Coloque o seu nome!';
                        }
                      },
                      onChanged: (namelValue) {
                        name = namelValue;
                        print(name);
                      },
                    ),
                    InputComponent(
                      typeOfInput: 'Email',
                      label: 'E-mail',
                      validator: (emailValue) {
                        if (emailValue.isEmpty) {
                          return 'Coloque o seu E-mail!';
                        } else if (emailValue.length < 10) {
                          return 'Coloque um E-mail com 10 ou mais caracteres!';
                        }
                      },
                      onChanged: (emailValue) {
                        email = emailValue;
                      },
                    ),
                    InputComponent(
                      typeOfInput: 'Password',
                      label: 'Senha',
                      validator: (passwordValue) {
                        if (passwordValue.isEmpty) {
                          return 'Coloque a sua senha!';
                        } else if (passwordValue.length < 6) {
                          return 'Coloque uma senha com 6 ou mais caracteres!';
                        }
                      },
                      onChanged: (passwordValue) {
                        password = passwordValue;
                      },
                    ),
                    InputComponent(
                      typeOfInput: 'Password',
                      label: 'Repita a senha',
                      validator: (repeatPasswordValue) {
                        if (repeatPasswordValue.isEmpty) {
                          return 'Repita a sua senha!';
                        } else if (repeatPasswordValue != password) {
                          return 'As senhas não coincidem!';
                        }
                      },
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
                        if (_templateInputValidation.currentState.validate()) {
                          print(name);
                          print(email);
                          print(password);
                          print(repeatPassword);
                        }
                        // Navigator.of(context).pushReplacementNamed('/home');
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
