import 'package:dio/dio.dart';
import 'package:exercise_1/features/authentication/data/repository_impl/auth_repository_impl.dart';
import 'package:exercise_1/features/authentication/presentation/cubit/cubit/login_cubit.dart';

import '../../data/api/rest_client.dart';
import '../../domain/usecase/login_usecase.dart';

LoginCubit provideLoginCubit() {
  final dio = Dio();
  final client = RestClient(dio);
  final repo = AuthRepositoryImpl(client);
  final loginUseCase = LoginUseCase(repo);

  return LoginCubit(loginUseCase);
}
