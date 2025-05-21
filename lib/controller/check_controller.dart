import 'package:exercise_1/features/shop/screens/detail.dart';
import 'package:exercise_1/features/shop/screens/home.dart';
import 'package:flutter/material.dart';

import '../navigation_menu.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  void login (BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu()));
    }
  }
}