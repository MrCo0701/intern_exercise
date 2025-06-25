class SignupState {
  final bool isRegisterLoading;
  final bool isRegisterSuccess;
  final bool isRegisterFail;
  final String error;

  SignupState({this.isRegisterLoading = false, this.isRegisterSuccess = false, this.isRegisterFail = false, this.error = ''});

  SignupState copyWith({bool? isRegisterLoading, bool? isRegisterSuccess, bool? isRegisterFail, String? error}) {
    return SignupState(
      isRegisterLoading: isRegisterLoading ?? this.isRegisterLoading,
      isRegisterSuccess: isRegisterSuccess ?? this.isRegisterSuccess,
      isRegisterFail: isRegisterFail ?? this.isRegisterFail,
      error: error ?? this.error
    );
  }
}