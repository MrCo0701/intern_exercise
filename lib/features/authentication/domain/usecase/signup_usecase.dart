import 'package:exercise_1/features/authentication/domain/repository/auth_repository.dart';

import '../entity/user.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<bool> call(User user) {
    return repository.signupUser(user);
  }
}
