import 'package:flutter/material.dart';

import '../../../../validator/validation.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({super.key, required this.controller, required this.title});

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
      ),
      validator: (value) => Validation.validateEmptyValue(value),
    );
  }
}
