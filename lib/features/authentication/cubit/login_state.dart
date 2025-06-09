class LoginState {
  final bool checkMail;
  final bool checkPass;
  final bool checkUser;
  final bool hidePassword;
  final bool checkAll;

  LoginState({
    this.checkMail = false,
    this.checkPass = false,
    this.checkUser = false,
    this.hidePassword = true,
    this.checkAll = true,
  });

  LoginState copyWith({
    bool? checkMail,
    bool? checkPass,
    bool? checkUser,
    bool? hidePassword,
    bool? checkAll,
  }) {
    return LoginState(
      checkMail: checkMail ?? this.checkMail,
      checkPass: checkPass ?? this.checkPass,
      checkUser: checkUser ?? this.checkUser,
      hidePassword: hidePassword ?? this.hidePassword,
      checkAll: checkAll ?? this.checkAll,
    );
  }
}
