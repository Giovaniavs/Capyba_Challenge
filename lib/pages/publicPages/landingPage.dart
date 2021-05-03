import 'package:flutter/material.dart';

import 'package:capyba_challenge/customWidgets/customButton.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
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
                'Seja Bem vindo(a) ao desafio Capyba!',
                style: TextStyle(fontSize: 20),
              ),
              Column(
                children: [
                  CustomButton(
                    width: double.infinity,
                    title: 'Entrar',
                    fontSize: 24,
                    backgroundColor: Colors.greenAccent.shade700,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                  ),
                  CustomButton(
                    width: double.infinity,
                    title: 'Cadastrar',
                    fontSize: 24,
                    backgroundColor: Colors.blueAccent.shade400,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
