import 'package:dio/dio.dart';
import 'package:exercise_1/data/storage%20/login_storage.dart';
import 'package:exercise_1/features/authentication/data/api/rest_client.dart';
import 'package:exercise_1/features/authentication/data/mapper/user_mapper.dart';
import 'package:exercise_1/features/authentication/data/model/user_model.dart';

import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient;

  AuthRepositoryImpl(this.restClient);

  @override
  Future<bool> loginUser(String email, String password) async {
    try {
      final response = await restClient.loginUser(email, password);
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
    try {
      final userModel = user.toModel();
      await restClient.registerUser(userModel);
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        return false;
      } else {
        throw Exception('error to post user: $e');
      }
    }
  }
}
