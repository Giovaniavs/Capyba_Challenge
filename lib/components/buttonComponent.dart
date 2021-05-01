import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  ButtonComponent({Key key, this.title, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(this.title),
      onPressed: () {},
      style: TextButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.black,
          elevation: 4,
          backgroundColor: backgroundColor,
          textStyle: TextStyle(color: Colors.white)),
    );
  }
}
