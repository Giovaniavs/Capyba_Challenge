import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final Color backgroundColor;
  final Function onPressed;

  ButtonComponent({
    Key key,
    this.width,
    this.height,
    this.title,
    this.fontSize,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: TextButton(
        child: Text(this.title),
        onPressed: this.onPressed,
        style: TextButton.styleFrom(
            primary: Colors.white,
            shadowColor: Colors.black,
            elevation: 4,
            backgroundColor: backgroundColor,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: this.fontSize,
            )),
      ),
    );
  }
}
