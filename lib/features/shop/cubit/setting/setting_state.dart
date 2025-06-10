class SettingState {
  final String userName;
  final String email;
  final String avatar;

  SettingState({required this.userName, required this.email, required this.avatar});

  SettingState copyWith({String? userName, String? email, String? avatar}) {
    return SettingState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}