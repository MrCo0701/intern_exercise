import 'package:dio/dio.dart';
import 'package:exercise_1/features/shop/settings/presentation/cubit/cubit/setting_cubit.dart';

import '../../data/api/rest_client_user.dart';
import '../../data/repository_impl/user_repository_impl.dart';
import '../../domain/usecase/user_usecase.dart';

SettingCubit provideSettingCubit() {
  final dio = Dio(BaseOptions(baseUrl: 'https://us-central1-skin-scanner-3c419.cloudfunctions.net'));
  final client = RestClientUser(dio);
  final repo = UserRepositoryImpl(client);
  final userUseCase = UserUseCase(repo);
  return SettingCubit(userUseCase);
}