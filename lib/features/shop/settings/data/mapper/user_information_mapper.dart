import 'package:exercise_1/features/shop/settings/data/model/information_user_model.dart';
import 'package:exercise_1/features/shop/settings/domain/entity/information_user.dart';

extension UserInformationMapper on InformationUser {
  InformationUserEntity toEntity() {
    return InformationUserEntity(
      username: data.userInfo.username,
      email: data.userInfo.email,
      avatar: data.userInfo.profilePic,
    );
  }
}
