import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    req,
    required this.controller,
    required this.checkPassword,
  });

  final LoginController controller;
  final Function(bool) checkPassword;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var hidePassword = true;
  var check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.passwordController.addListener(() {
      final isValid =
          Validation.validatePassword(widget.controller.passwordController.text) ==
          null;

      if (check != isValid) {
        setState(() {
          check = isValid;
          widget.checkPassword(check);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller.passwordController,
      obscureText: hidePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: hidePassword ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye),
        ),
      ),
      validator: (value) => Validation.validatePassword(value),
    );
  }
}
