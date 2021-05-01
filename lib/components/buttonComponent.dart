import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double width;
  final String title;
  final Color backgroundColor;
  final Function onPressed;

  ButtonComponent(
      {Key key, this.width, this.title, this.backgroundColor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: TextButton(
        child: Text(this.title),
        onPressed: this.onPressed,
        style: TextButton.styleFrom(
            primary: Colors.white,
            shadowColor: Colors.black,
            elevation: 4,
            backgroundColor: backgroundColor,
            textStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
