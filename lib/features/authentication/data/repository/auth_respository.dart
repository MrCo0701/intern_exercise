import 'package:dio/dio.dart';
import 'package:exercise_1/data/storage%20/login_storage.dart';
import 'package:exercise_1/features/authentication/data/model/user_model.dart';

class AuthRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://us-central1-skin-scanner-3c419.cloudfunctions.net'));

  Future<bool> registerUser({required UserModel user}) async {
    try {
      final response = await dio.post(
        '/api/auth-service/register',
        data: {
          "username": user.userName,
          "firstName": user.firstName,
          "lastName": user.lastName,
          "email": user.email,
          "password": user.password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('error to post user: $e');
    }
  }

  Future<bool> loginUser({required String email, required String password}) async {
    try {
      final response = await dio.post(
        '/api/auth-service/login',
        data: {"email": email, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data["data"]["meta"]["accessToken"];
        await LoginStorage.saveToken(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('error to post user: $e');
    }
  }
}
