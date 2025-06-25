import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/features/authentication/data/model/user_model.dart';
import 'package:exercise_1/features/authentication/data/repository/auth_respository.dart';
import 'package:exercise_1/features/authentication/presentation/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit(this.authRepository) : super(SignupState());

  Future<void> registerUser({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    if (LoginController().loginFormKey.currentState!.validate()) {
      emit(state.copyWith(isRegisterLoading: true));

      final user = UserModel(
        email: email,
        userName: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      try {
        final register = await authRepository.registerUser(user: user);

        if (register) {
          emit(state.copyWith(isRegisterLoading: false, isRegisterSuccess: true));
        } else {
          emit(state.copyWith(isRegisterLoading: false, isRegisterFail: true));
        }
      } catch (e) {
        emit(state.copyWith(isRegisterLoading: false, isRegisterFail: true));
        throw ('Error:::::::::::::::::::: $e');
      }
    }
  }
}
