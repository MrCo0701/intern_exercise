import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/features/authentication/presentation/di/login_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../validator/validation.dart';
import '../cubit/cubit/login_cubit.dart';
import '../cubit/state/login_state.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
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
                  state.checkMail
                      ? Icon(Iconsax.tick_circle5, color: Colors.green)
                      : null,
              // errorText: state.checkMail ? null : 'Email is invalid',
            ),
            validator: (value) => Validation.validateEmail(value),
            onChanged: (value) => context.read<LoginCubit>().checkEmail(value),
          );
        },
      ),
    );
  }
}