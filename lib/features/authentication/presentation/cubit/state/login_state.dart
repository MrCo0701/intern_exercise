import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool checkMail,
    @Default(false) bool checkPass,
    @Default(false) bool checkUser,
    @Default(true) bool hidePassword,
    @Default(true) bool checkAll,
    @Default(false) bool isLoginSuccess,
    @Default(false) bool isLoginFailed,
    @Default(false) bool isLoading,
  }) = _LoginState;
}
