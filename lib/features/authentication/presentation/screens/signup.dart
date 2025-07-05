import 'package:exercise_1/features/authentication/presentation/cubit/cubit/signup_cubit.dart';
import 'package:exercise_1/features/authentication/presentation/di/login_di.dart';
import 'package:exercise_1/features/authentication/presentation/screens/login.dart';
import 'package:exercise_1/features/authentication/presentation/widgets/normal_textField.dart';
import 'package:exercise_1/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/check_controller.dart';
import '../../../../widgets/button_custom.dart';
import '../cubit/cubit/login_cubit.dart';
import '../cubit/state/login_state.dart';
import '../cubit/state/signup_state.dart';
import '../di/signup_di.dart';
import '../widgets/email_textField.dart';
import '../widgets/password_textField.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => provideLoginCubit()),
        BlocProvider(create: (context) => provideSignupCubit()),
      ],
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          state.whenOrNull(
            isRegisterSuccess:
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                ),
            isRegisterFail:
                (error) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    content: Text(
                      error,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                  ),
                ),
          );
        },
        builder: (context, stateSignup) {
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
                        Text('Signup', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
                        SizedBox(height: 10),
                        Text('Enter your credentials to continue', style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                    SizedBox(height: 30),

                    Form(
                      key: controller.loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NormalTextField(controller: controller.firstNameController, title: 'First name'),
                          SizedBox(height: 20),

                          NormalTextField(controller: controller.lastNameController, title: 'Last name'),
                          SizedBox(height: 20),

                          NormalTextField(controller: controller.userController, title: 'Username'),
                          SizedBox(height: 20),

                          EmailTextField(controller: controller),
                          SizedBox(height: 20),

                          PasswordTextField(controller: controller),
                          SizedBox(height: 20),

                          RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 16),
                              children: [
                                TextSpan(
                                  text: 'By continuing, you agree to our',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(text: ' Terms of Service', style: TextStyle(color: Colors.green)),
                                TextSpan(text: ' and', style: TextStyle(color: Colors.black)),
                                TextSpan(text: ' Privacy Policy', style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return ButtonCustom(
                                title: 'Signup',
                                onPressed: () {
                                  final validation = controller.loginFormKey.currentState!.validate();
                                  if (validation) {
                                    context.read<SignupCubit>().registerUser(
                                      username: controller.userController.text,
                                      password: controller.passwordController.text,
                                      email: controller.emailController.text,
                                      firstName: controller.firstNameController.text,
                                      lastName: controller.lastNameController.text,
                                    );
                                  }
                                },
                                canClick: true,
                                // checkLogin: checkLogin,
                              );
                            },
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
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w800),
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
        },
      ),
    );
  }
}
