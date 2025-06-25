import 'package:exercise_1/controller/check_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../validator/validation.dart';
import '../../data/repository/auth_respository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void checkEmail(String email) {
    final isValid = Validation.validateEmail(email) == null;
    final newState = emit(state.copyWith(checkMail: isValid)) as LoginState;

    if (newState.checkMail && newState.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }

  void checkPassword(String password) {
    final isValid = Validation.validatePassword(password) == null;
    final newState = emit(state.copyWith(checkPass: isValid)) as LoginState;

    if (newState.checkMail && newState.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }

  void checkUser(String userName) {
    final isValid = Validation.validateEmptyValue(userName) == null;
    emit(state.copyWith(checkUser: isValid));
  }

  void hidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void checkAllLogin() {
    if (state.checkMail && state.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(state.copyWith(isLoading: true, isLoginSuccess: false, isLoginFailed: false));
      final isValid = await AuthRepository().loginUser(email: email, password: password);

      if (isValid) {
        emit(state.copyWith(isLoginSuccess: true, isLoading: false));
      } else {
        emit(state.copyWith(isLoginFailed: true, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoginFailed: true, isLoading: false));
      throw ('==> Error login: $e');
    }
  }
}
