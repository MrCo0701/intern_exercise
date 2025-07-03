import 'package:dio/dio.dart';
import 'package:exercise_1/features/shop/settings/data/api/rest_client_user.dart';
import 'package:exercise_1/features/shop/settings/data/model/information_user.dart';

import '../../../../../data/storage /login_storage.dart';

class UserRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://us-central1-skin-scanner-3c419.cloudfunctions.net'));

  Future<InformationUser> getUser() async {
    final restClient = RestClientUser(dio);

    try {
      final user = await restClient.getUser('Bearer ${await LoginStorage.getToken()}');
      return user;
    } catch (e) {
      throw Exception('==> Error to get user: $e');
    }
  }

  Future<bool> deleteUser() async {
    final restClient = RestClientUser(dio);
    try {
      await restClient.delete_all_scan('Bearer ${await LoginStorage.getToken()}');
      return true;
    } catch (e) {
      return false;
      throw Exception('==> Error to delete user: $e');
    }
  }
}
