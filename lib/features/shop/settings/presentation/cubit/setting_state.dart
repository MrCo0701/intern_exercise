class SettingState {
  final String userName;
  final String email;
  final String avatar;
  final bool deleteSuccess;

  SettingState({required this.userName, required this.email, required this.avatar, this.deleteSuccess = false});

  SettingState copyWith({String? userName, String? email, String? avatar, bool? deleteSuccess}) {
    return SettingState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      deleteSuccess: deleteSuccess ?? this.deleteSuccess,
    );
  }
}
