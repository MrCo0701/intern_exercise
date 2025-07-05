import 'package:dio/dio.dart';
import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/features/authentication/domain/entity/user.dart';
import 'package:exercise_1/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:exercise_1/features/authentication/presentation/cubit/state/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase) : super(SignupState.initial());

  Future<void> registerUser({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    final user = User(email: email, userName: username, password: password, firstName: firstName, lastName: lastName);
    try {
      await signupUseCase(user);
      emit(SignupState.isRegisterSuccess());
    } catch (e) {
      emit(SignupState.isRegisterFail('Error to register'));
    }
  }
}
