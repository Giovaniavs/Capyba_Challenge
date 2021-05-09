import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/authServices.dart';

import 'package:capyba_challenge/customWidgets/customLoading.dart';
import 'package:capyba_challenge/customWidgets/customButton.dart';
import 'package:capyba_challenge/customWidgets/customInput.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePage createState() => _MyProfilePage();
}

class _MyProfilePage extends State<MyProfilePage> {
  final AuthService _auth = AuthService();
  bool loading = false;

  String name = '';
  String email = '';
  String password = '';
  String repeatPassword = '';
  String errorMessage = '';

  @override
  void initState() {
    getUserData().then((value) {
      setState(() {
        name = value[0];
        email = value[1];
      });
    });
    super.initState();
  }

  Future getUserData() async {
    dynamic userInformations = await _auth.getUserInformations();
    return userInformations;
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
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('lib/assets/images/capyba_logo.png',
                            width: 80, height: 80),
                        Text(
                          'Edite suas informações!',
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          children: [
                            CustomInput(
                              typeOfInput: 'Name',
                              label: name,
                              onChanged: (namelValue) {
                                name = namelValue;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomInput(
                              typeOfInput: 'Email',
                              label: email,
                              onChanged: (emailValue) {
                                email = emailValue;
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomButton(
                              width: 110,
                              title: 'Concluído',
                              fontSize: 20,
                              backgroundColor: Colors.blueAccent.shade400,
                              onPressed: () async {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .updateUserInformations(name, email);

                                if (result == null) {
                                  setState(() {
                                    errorMessage = 'Email no formato inválido!';
                                    loading = false;
                                  });
                                } else {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
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
