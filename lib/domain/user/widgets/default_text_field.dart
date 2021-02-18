import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DefaultTextField extends StatelessWidget {
  final String formControlName;
  final String label;
  final bool obscureText;
  const DefaultTextField({
    Key key,
    this.formControlName,
    this.label,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ReactiveTextField(
        formControlName: formControlName,
        cursorColor: Colors.greenAccent,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
