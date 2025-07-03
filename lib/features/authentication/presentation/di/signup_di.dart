import 'package:dio/dio.dart';
import 'package:exercise_1/features/authentication/data/repository_impl/auth_repository_impl.dart';
import 'package:exercise_1/features/authentication/domain/repository/auth_repository.dart';
import 'package:exercise_1/features/authentication/presentation/cubit/cubit/signup_cubit.dart';

import '../../data/api/rest_client.dart';
import '../../domain/usecase/signup_usecase.dart';

SignupCubit provideSignupCubit() {
  final dio = Dio(BaseOptions(baseUrl: 'https://us-central1-skin-scanner-3c419.cloudfunctions.net'));
  final client = RestClient(dio);
  final repo = AuthRepositoryImpl(client);
  final signupUseCase = SignupUseCase(repo);
  return SignupCubit(signupUseCase);
}