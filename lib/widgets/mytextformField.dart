import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String name;

  MyTextFormField({
    required this.name,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        validator();
      },
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(),
      ),
    );
  }
}
