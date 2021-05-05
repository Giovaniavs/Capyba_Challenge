import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/auth_services.dart';

import 'package:capyba_challenge/customWidgets/customLoading.dart';
import 'package:capyba_challenge/customWidgets/customButton.dart';
import 'package:capyba_challenge/customWidgets/customInput.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _templateInputValidation = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? CustomLoading(backgroundColor: Colors.greenAccent.shade400)
        : Scaffold(
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
                        Image.asset(
                          'lib/assets/images/capyba_logo.png',
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          'Faça o login na plataforma!',
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInput(
                              typeOfInput: 'Email',
                              label: 'E-mail',
                              onChanged: (emailValue) {
                                email = emailValue;
                              },
                              validator: (emailValue) {
                                if (emailValue.isEmpty) {
                                  return 'Coloque o seu e-mail!';
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomInput(
                              typeOfInput: 'Password',
                              label: 'Senha',
                              onChanged: (passwordValue) {
                                password = passwordValue;
                              },
                              validator: (passwordValue) {
                                if (passwordValue.isEmpty) {
                                  return 'Coloque a sua senha!';
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomButton(
                              width: 90,
                              title: 'Entrar',
                              fontSize: 20,
                              backgroundColor: Colors.greenAccent.shade700,
                              onPressed: () async {
                                if (_templateInputValidation.currentState
                                    .validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(() {
                                      errorMessage =
                                          'Login ou senha estão incorretos';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/home');
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              errorMessage,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
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
