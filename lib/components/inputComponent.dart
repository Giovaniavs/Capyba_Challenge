import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String typeOfInput;
  final String label;
  final Function onChanged;

  InputComponent({
    Key key,
    this.typeOfInput,
    this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: this.onChanged,
      obscureText: this.typeOfInput == 'Password' ? (true) : (false),
      keyboardType: this.typeOfInput == 'Email'
          ? (TextInputType.emailAddress)
          : (TextInputType.text),
      decoration: InputDecoration(
        labelText: this.label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
