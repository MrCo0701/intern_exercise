import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_user_model.g.dart';

@JsonSerializable()
class InformationUser {
  final int statusCode;
  final Data data;

  InformationUser({required this.statusCode, required this.data});

  factory InformationUser.fromJson(Map<String, dynamic> json) => _$InformationUserFromJson(json);

  Map<String, dynamic> toJson() => _$InformationUserToJson(this);
}

@JsonSerializable()
class Data {
  final UserInfo userInfo;

  Data({required this.userInfo});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserInfo {
  final String username;
  final String email;
  final String profilePic;

  UserInfo({required this.username, required this.email, required this.profilePic});

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
