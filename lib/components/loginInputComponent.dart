import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final String typeOfInput;

  InputComponent({Key key, this.typeOfInput}) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.typeOfInput == 'Email'
        ? (TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: widget.typeOfInput, border: OutlineInputBorder()),
          ))
        : (TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder()),
          ));
  }
}
