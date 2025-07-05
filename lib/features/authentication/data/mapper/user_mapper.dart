import 'package:exercise_1/features/authentication/domain/entity/user.dart';

import '../model/user_model.dart';

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(email: email, userName: userName, firstName: firstName, lastName: lastName, password: password);
  }
}

extension UserEntityMapper on User {
  UserModel toModel() {
    return UserModel(email: email, userName: userName, password: password, firstName: firstName, lastName: lastName);
  }
}
