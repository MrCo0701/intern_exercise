import 'package:exercise_1/features/authentication/cubit/login_state.dart';
import 'package:exercise_1/features/authentication/screens/signup.dart';
import 'package:exercise_1/features/authentication/widgets/password_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/check_controller.dart';
import '../../../widgets/button_custom.dart';
import '../cubit/login_cubit.dart';
import '../widgets/email_textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/carrot.png', width: 100),
                ),
                SizedBox(height: 70),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
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
                      EmailTextField(
                        controller: controller,
                      ),
                      SizedBox(height: 20),

                      PasswordTextField(
                        controller: controller,
                      ),
                      SizedBox(height: 20),

                      Text('Forgot Password?'),
                      SizedBox(height: 20),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return ButtonCustom(
                            title: 'Login',
                            onPressed: () => controller.login(context),
                            canClick: state.checkAll,
                            // checkLogin: true,
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
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
      ),
    );
  }
}
