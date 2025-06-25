class LoginState {
  final bool checkMail;
  final bool checkPass;
  final bool checkUser;
  final bool hidePassword;
  final bool checkAll;
  final bool isLoginSuccess;
  final bool isLoginFailed;
  final bool isLoading;

  LoginState({
    this.checkMail = false,
    this.checkPass = false,
    this.checkUser = false,
    this.hidePassword = true,
    this.checkAll = true,
    this.isLoginSuccess = false,
    this.isLoginFailed = false,
    this.isLoading = false
  });

  LoginState copyWith({
    bool? checkMail,
    bool? checkPass,
    bool? checkUser,
    bool? hidePassword,
    bool? checkAll,
    bool? isLoginSuccess,
    bool? isLoading,
    bool? isLoginFailed
  }) {
    return LoginState(
      checkMail: checkMail ?? this.checkMail,
      checkPass: checkPass ?? this.checkPass,
      checkUser: checkUser ?? this.checkUser,
      hidePassword: hidePassword ?? this.hidePassword,
      checkAll: checkAll ?? this.checkAll,
      isLoading: isLoading ?? this.isLoading,
      isLoginFailed: isLoginFailed ?? this.isLoginFailed,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess
    );
  }
}
