import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final String typeOfInput;
  final Function onChanged;

  InputComponent({Key key, this.typeOfInput, this.onChanged}) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.typeOfInput == 'Email'
        ? (TextField(
            onChanged: widget.onChanged,
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
