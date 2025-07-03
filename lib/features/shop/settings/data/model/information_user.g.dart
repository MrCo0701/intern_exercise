// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationUser _$InformationUserFromJson(Map<String, dynamic> json) =>
    InformationUser(
      statusCode: (json['statusCode'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InformationUserToJson(InformationUser instance) =>
    <String, dynamic>{'statusCode': instance.statusCode, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) =>
    Data(userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>));

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'userInfo': instance.userInfo,
};

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
  username: json['username'] as String,
  email: json['email'] as String,
  profilePic: json['profilePic'] as String,
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'profilePic': instance.profilePic,
};
