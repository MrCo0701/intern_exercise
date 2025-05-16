import 'package:exercise_1/controller/check_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../validator/validation.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    required this.checkEmail,
  });

  final LoginController controller;
  final Function(bool) checkEmail;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  var check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.emailController.addListener(() {
      final isValid =
          Validation.validateEmail(widget.controller.emailController.text) == null;

      if (check != isValid) {
        setState(() {
          check = isValid;
          widget.checkEmail(check);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return TextFormField(
      controller: controller.emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        suffixIcon:
            check ? Icon(Iconsax.tick_circle5, color: Colors.green) : null,
      ),
      validator: (value) => Validation.validateEmail(value),
    );
  }
}
