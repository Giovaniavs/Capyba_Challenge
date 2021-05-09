import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:capyba_challenge/services/authServices.dart';

import 'package:capyba_challenge/customWidgets/customLoading.dart';
import 'package:capyba_challenge/customWidgets/customButton.dart';
import 'package:capyba_challenge/customWidgets/customInput.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _templateInputValidation = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  var imageFile;

  bool loading = false;

  String name = '';
  String email = '';
  String password = '';
  String repeatPassword = '';
  String errorMessage = '';

  showUserTerms(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () => Navigator.pop(context, true),
    );

    Widget confirmButton = ElevatedButton(
      child: Text("Aceitar"),
      onPressed: () async {
        setState(() => loading = true);
        Navigator.pop(context, true);
        dynamic result = await _auth.createUserWithEmailAndPassword(
          name,
          email,
          password,
          imageFile,
        );

        if (result == null) {
          setState(() {
            errorMessage = 'Email inválido ou já cadastrado!';
            loading = false;
          });
        } else {
          Navigator.of(context).pushReplacementNamed('/successRegister');
        }
      },
    );

    AlertDialog userTermsAlert = AlertDialog(
      title: Text("Termos de uso"),
      content: Text(
          "Ao aceitar, o usuário permite que tenhamos a posse do seu email e sua senha em nossa base de dados."),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return userTermsAlert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? CustomLoading(backgroundColor: Colors.blueAccent.shade400)
        : Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 35.0,
                    right: 15.0,
                    left: 15.0,
                    bottom: 15.0,
                  ),
                  child: Form(
                    key: _templateInputValidation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Realize o seu cadastro!',
                          style: TextStyle(fontSize: 20),
                        ),
                        imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(120.0),
                                child: Image.file(
                                  imageFile,
                                  width: 180.0,
                                  height: 150.0,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Image.asset(
                                'lib/assets/images/capyba_logo.png',
                                width: 80,
                                height: 80,
                              ),
                        CustomButton(
                          width: 120,
                          height: 40,
                          fontSize: 15,
                          title: 'Adicionar foto',
                          onPressed: () async {
                            final pickedFile = await ImagePicker().getImage(
                              preferredCameraDevice: CameraDevice.front,
                              source: ImageSource.camera,
                            );

                            setState(() {
                              imageFile = File(pickedFile.path);
                            });
                          },
                          backgroundColor: Colors.greenAccent.shade700,
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
                              width: double.infinity,
                              height: 50,
                              title: 'Cadastrar',
                              fontSize: 20,
                              backgroundColor: Colors.blueAccent.shade400,
                              onPressed: () async {
                                if (_templateInputValidation.currentState
                                    .validate()) {
                                  if (imageFile == null) {
                                    setState(() {
                                      errorMessage = 'Adicione uma foto!';
                                    });
                                  } else {
                                    showUserTerms(context);
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
