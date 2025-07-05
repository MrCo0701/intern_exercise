import 'package:exercise_1/features/shop/settings/domain/entity/information_user.dart';
import 'package:exercise_1/features/shop/settings/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;
  UserUseCase(this.userRepository);

  Future<InformationUserEntity> updateUser() async {
    return await userRepository.updateUser();
  }

  Future<bool> deleteUser() async {
    return await userRepository.deleteUser();
  }
}