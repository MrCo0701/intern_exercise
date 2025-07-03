import 'package:exercise_1/controller/check_controller.dart';
import 'package:exercise_1/features/authentication/data/model/user_model.dart';
import 'package:exercise_1/features/authentication/data/repository_impl/auth_repository_impl.dart';
import 'package:exercise_1/features/authentication/presentation/cubit/state/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  // ! change repo in here
  final AuthRepositoryImpl authRepository;

  SignupCubit(this.authRepository) : super(SignupState.initial());

  Future<void> registerUser({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    if (LoginController().loginFormKey.currentState!.validate()) {
      emit(SignupState.isRegisterLoading());

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
          emit(SignupState.isRegisterSuccess());
        } else {
          emit(SignupState.isRegisterFail('Error to register'));
        }
      } catch (e) {
        emit(SignupState.isRegisterFail('Error to register'));
        throw ('Error:::::::::::::::::::: $e');
      }
    }
  }
}
