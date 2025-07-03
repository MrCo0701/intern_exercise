import 'package:exercise_1/features/authentication/data/model/user_model.dart';

import '../entity/user.dart';

abstract class AuthRepository {
  Future<bool> loginUser(String email, String password);

  Future<bool> signupUser(User user);
}
