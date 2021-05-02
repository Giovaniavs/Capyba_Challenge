import 'package:flutter/material.dart';

import 'package:capyba_challenge/pages/publicPages/registerPage.dart';
import 'package:capyba_challenge/pages/publicPages/landingPage.dart';
import 'package:capyba_challenge/pages/publicPages/loginPage.dart';
import 'package:capyba_challenge/pages/privatePages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba Challenge',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.greenAccent.shade700,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
