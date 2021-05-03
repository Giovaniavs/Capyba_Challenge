import 'package:capyba_challenge/customWidgets/customSplashScreen.dart';
import 'package:flutter/material.dart';

import 'package:capyba_challenge/services/auth_provider.dart';
import 'package:capyba_challenge/services/auth_services.dart';

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
    return UserProvider(
      auth: AuthService(),
      child: MaterialApp(
        title: 'Capyba Challenge',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.greenAccent.shade700,
        ),
        home: CustomSplashScreen(
          navigateTo: LandingPage(),
        ),
        routes: {
          '/landingpage': (context) => LandingPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
