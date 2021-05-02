import 'package:flutter/material.dart';

import 'package:capyba_challenge/components/buttonComponent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  ButtonComponent(
                    width: 90,
                    title: 'Entrar',
                    backgroundColor: Colors.greenAccent.shade700,
                    onPressed: () {},
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
