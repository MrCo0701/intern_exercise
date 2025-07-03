import 'package:exercise_1/features/shop/settings/domain/entity/information_user.dart';

abstract class UserRepository {
  Future<InformationUserEntity> updateUser();
  Future<bool> deleteUser();
}
