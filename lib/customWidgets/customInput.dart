import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String typeOfInput;
  final String label;
  final Function onChanged;
  final Function validator;

  CustomInput({
    Key key,
    this.typeOfInput,
    this.label,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: this.onChanged,
      validator: this.validator,
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
