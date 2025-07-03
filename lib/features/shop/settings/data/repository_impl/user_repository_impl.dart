import 'package:exercise_1/features/shop/settings/data/api/rest_client_user.dart';
import 'package:exercise_1/features/shop/settings/data/mapper/user_information_mapper.dart';
import 'package:exercise_1/features/shop/settings/data/model/information_user_model.dart';
import 'package:exercise_1/features/shop/settings/domain/entity/information_user.dart';

import '../../../../../data/storage /login_storage.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClientUser restClientUser;

  UserRepositoryImpl(this.restClientUser);

  @override
  Future<InformationUserEntity> updateUser() async {
    try {
      final user = await restClientUser.getUser('Bearer ${await LoginStorage.getToken()}');
      final userEntity = user.toEntity();
      return userEntity;
    } catch (e) {
      throw Exception('==> Error to get user: $e');
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      await restClientUser.delete_all_scan('Bearer ${await LoginStorage.getToken()}');
      return true;
    } catch (e) {
      return false;
    }
  }
}
