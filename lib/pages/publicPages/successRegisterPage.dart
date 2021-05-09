import 'package:flutter/material.dart';

import 'package:capyba_challenge/customWidgets/customButton.dart';

class SuccessRegisterPage extends StatefulWidget {
  @override
  _SuccessRegisterPageState createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState extends State<SuccessRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'lib/assets/gifs/confirmation.gif',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Usuário registrado com sucesso!',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              CustomButton(
                width: 70,
                title: '>',
                fontSize: 24,
                backgroundColor: Colors.greenAccent.shade700,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
