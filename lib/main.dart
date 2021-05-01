import 'package:flutter/material.dart';

import 'package:capyba_challenge/pages/landingPage.dart';
import 'package:capyba_challenge/pages/loginPage.dart';
import 'package:capyba_challenge/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba Challenge',
      theme: ThemeData(
        primaryColor: Colors.greenAccent.shade700,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        // '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
