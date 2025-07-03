import 'package:dio/dio.dart';
import 'package:exercise_1/data/storage%20/login_storage.dart';
import 'package:exercise_1/features/authentication/data/api/rest_client.dart';
import 'package:exercise_1/features/authentication/data/model/user_model.dart';

import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;

  AuthRepositoryImpl(this.restClient);

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
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error to signup: $e');
    }
  }

  @override
  Future<bool> loginUser(String email, String password) async {
    final client = RestClient(dio);
    try {
      final response = await client.loginUser(email, password);
      final token = response.data.meta.accessToken;
      await LoginStorage.saveToken(token);
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        return false;
      } else {
        throw Exception('error to post user: $e');
      }
    }
  }

  @override
  Future<bool> signupUser(User user) async {
    return true;
  }
}
