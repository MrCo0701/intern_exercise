import '../entity/user.dart';

abstract class AuthRepository {
  Future<bool> loginUser(String email, String password);

  Future<bool> signupUser(User user);
}
