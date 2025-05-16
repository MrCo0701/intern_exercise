import 'package:exercise_1/features/authentication/screens/signup.dart';
import 'package:exercise_1/features/authentication/widgets/password_textField.dart';
import 'package:flutter/material.dart';

import '../../../controller/check_controller.dart';
import '../../../widgets/button_custom.dart';
import '../widgets/email_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();
  var checkMail = true;
  var checkPass = true;
  var check = true;

  @override
  Widget build(BuildContext context) {
    if (checkMail && checkPass) {
      setState(() {
        check = true;
      });
    } else {
      setState(() {
        check = false;
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/carrot.png', width: 100)),
              SizedBox(height: 70),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter your email and password',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    EmailTextField(controller: controller, checkEmail: (value) {
                      setState(() {
                        checkMail = value;
                      });
                    },),
                    SizedBox(height: 20),

                    PasswordTextField(controller: controller, checkPassword: (value) {
                      setState(() {
                        checkPass = value;
                      });
                    },),
                    SizedBox(height: 20),

                    Text('Forgot Password?'),
                    SizedBox(height: 20),
                    ButtonCustom(
                      title: 'Login',
                      onPressed: () => controller.login(context),
                      canClick: check,
                      // checkLogin: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
