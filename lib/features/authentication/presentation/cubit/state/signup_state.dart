import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _SignupStateInitial;
  const factory SignupState.isRegisterLoading() = _SignupStateLoading;
  const factory SignupState.isRegisterSuccess() = _SignupStateSuccess;
  const factory SignupState.isRegisterFail(String error) = _SignupStateFail;
}
