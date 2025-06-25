import 'package:dio/dio.dart';
import 'package:exercise_1/features/shop/settings/data/model/information_user.dart';

import '../../../../../data/storage /login_storage.dart';

class UserRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://us-central1-skin-scanner-3c419.cloudfunctions.net'));

  Future<InformationUser> getUser() async {
    try {
      final response = await dio.get(
        '/api/user-service/me',
        options: Options(headers: {'Authorization': 'Bearer ${await LoginStorage.getToken()}'}),
      );
      final data = response.data["data"]["userInfo"];

      return InformationUser(email: data["email"], userName: data["username"], imageUrl: data["profilePic"]);
    } catch (e) {
      throw Exception('==> Error to get user: $e');
    }
  }

  Future<bool> deleteUser() async {
    try {
      final response = await dio.delete(
        '/api/scan-service/moles',
        options: Options(headers: {'Authorization': 'Bearer ${await LoginStorage.getToken()}'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('==> Error to delete user: $e');
    }
  }
}
