import 'package:flutter/material.dart';
import 'package:capyba_challenge/pages/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba Challenge',
      theme: ThemeData(
        primaryColor: Colors.greenAccent.shade700,
      ),
      home: LoginPage(),
    );
  }
}
