import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatelessWidget {
  final dynamic navigateTo;

  CustomSplashScreen({
    Key key,
    this.navigateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: this.navigateTo,
      image: Image.asset(
        'lib/assets/images/capyba_logo.png',
        height: 100,
        width: 100,
      ),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Colors.greenAccent.shade700,
      loadingText: Text('O app está inicializando...'),
    );
  }
}
