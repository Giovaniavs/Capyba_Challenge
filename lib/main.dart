import 'package:flutter/material.dart';

import 'package:capyba_challenge/customWidgets/customSplashScreen.dart';

import 'package:capyba_challenge/pages/publicPages/successRegisterPage.dart';
import 'package:capyba_challenge/pages/privatePages/restrictedPage.dart';
import 'package:capyba_challenge/pages/privatePages/myProfilePage.dart';
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
      home: CustomSplashScreen(
        navigateTo: LandingPage(),
      ),
      routes: {
        '/landingPage': (context) => LandingPage(),
        '/register': (context) => RegisterPage(),
        '/successRegister': (context) => SuccessRegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/restrictedPage': (context) => RestrictedPage(),
        '/myProfile': (context) => MyProfilePage(),
      },
    );
  }
}
