import 'package:exercise_1/features/authentication/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../validator/validation.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void checkEmail (String email) {
    final isValid = Validation.validateEmail(email) == null;
    final newState = emit(state.copyWith(checkMail: isValid)) as LoginState;

    if (newState.checkMail && newState.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }

  void checkPassword (String password) {
    final isValid = Validation.validatePassword(password) == null;
    final newState = emit(state.copyWith(checkPass: isValid)) as LoginState;

    if (newState.checkMail && newState.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }

  void checkUser (String userName) {
    final isValid = Validation.validateEmptyValue(userName) == null;
    emit(state.copyWith(checkUser: isValid));
  }

  void hidePassword () {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void checkAllLogin() {
    if (state.checkMail && state.checkPass) {
      emit(state.copyWith(checkAll: true));
    } else {
      emit(state.copyWith(checkAll: false));
    }
  }
}