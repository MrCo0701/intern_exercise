import 'package:exercise_1/features/authentication/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/check_controller.dart';
import '../../../widgets/button_custom.dart';
import '../cubit/login_cubit.dart';
import '../widgets/email_textField.dart';
import '../widgets/password_textField.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = LoginController();

    return  BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
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
                      'Signup',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter your credentials to continue',
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
                      BlocBuilder<LoginCubit,  LoginState>(
                        builder: (context, state) {
                          return TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              errorText: state.checkUser ? null : 'Username is invalid',
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 20),

                      EmailTextField(controller: controller),
                      SizedBox(height: 20),

                      PasswordTextField(controller: controller),
                      SizedBox(height: 20),

                      RichText(text: TextSpan(
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'By continuing, you agree to our',
                                style: TextStyle(color: Colors.black)
                            ),
                            TextSpan(
                                text: ' Terms of Service',
                                style: TextStyle(color: Colors.green)
                            ),
                            TextSpan(
                                text: ' and',
                                style: TextStyle(color: Colors.black)
                            ),
                            TextSpan(
                                text: ' Privacy Policy',
                                style: TextStyle(color: Colors.green)
                            ),
                          ]
                      )),
                      SizedBox(height: 20),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return ButtonCustom(
                            title: 'Signup',
                            onPressed: () => controller.login(context),
                            canClick: state.checkMail,
                            // checkLogin: checkLogin,
                          );
                        }
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
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
      ),
    );
  }
}

