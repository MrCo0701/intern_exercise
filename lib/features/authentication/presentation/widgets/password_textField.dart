import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/features/authentication/presentation/di/login_di.dart';
import 'package:exercise_1/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../cubit/cubit/login_cubit.dart';
import '../cubit/state/login_state.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => provideLoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return TextFormField(
            controller: controller.passwordController,
            obscureText: state.hidePassword,
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
                  context.read<LoginCubit>().hidePassword();
                },
                icon: state.hidePassword ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye),
              ),
              // errorText: state.checkPass ? null : 'Password is invalid',
            ),
            validator: (value) => Validation.validatePassword(value),
            // onChanged: (value) => context.read<LoginCubit>().checkPassword(value),
          );
        }
      ),
    );
  }
}
