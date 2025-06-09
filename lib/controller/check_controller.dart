import 'package:exercise_1/utils/loader/full_screen_loader.dart';
import 'package:flutter/material.dart';

import '../navigation_menu.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  void login(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FullScreenLoader()),
      );

      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu()),
          (Route<dynamic> route) => false,
        );
      });
    }
  }
}
