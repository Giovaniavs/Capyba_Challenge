import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  final Color backgroundColor;

  CustomLoading({Key key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backgroundColor,
      child: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
