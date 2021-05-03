import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/auth_services.dart';

import 'package:capyba_challenge/customWidgets/customButton.dart';
import 'package:capyba_challenge/customWidgets/customInput.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _templateInputValidation = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String name = '';
  String email = '';
  String password = '';
  String repeatPassword = '';
  String errorMessage = '';

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
                  CustomInput(
                    typeOfInput: 'Name',
                    label: 'Nome',
                    validator: (nameValue) {
                      if (nameValue.isEmpty) {
                        return 'Coloque o seu nome!';
                      }
                    },
                    onChanged: (namelValue) {
                      name = namelValue;
                    },
                  ),
                  CustomInput(
                    typeOfInput: 'Email',
                    label: 'E-mail',
                    validator: (emailValue) {
                      if (emailValue.isEmpty) {
                        return 'Coloque o seu e-mail!';
                      } else if (emailValue.length < 10) {
                        return 'Coloque um E-mail com 10 ou mais caracteres!';
                      }
                    },
                    onChanged: (emailValue) {
                      email = emailValue;
                    },
                  ),
                  CustomInput(
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
                  CustomInput(
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
                  Column(
                    children: [
                      CustomButton(
                        width: 110,
                        title: 'Cadastrar',
                        fontSize: 20,
                        backgroundColor: Colors.blueAccent.shade400,
                        onPressed: () async {
                          if (_templateInputValidation.currentState
                              .validate()) {
                            dynamic result =
                                await _auth.createUserWithEmailAndPassword(
                                    email, password);

                            print(result);

                            if (result == null) {
                              setState(() => errorMessage =
                                  'Email inválido ou já cadastrado!');
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
