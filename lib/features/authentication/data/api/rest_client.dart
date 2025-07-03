import 'package:dio/dio.dart';
import 'package:exercise_1/features/authentication/data/model/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user_model.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/api/auth-service/register')
  Future<void> registerUser(@Body() UserModel user);

  @POST('/api/auth-service/login')
  @FormUrlEncoded()
  Future<LoginResponse> loginUser(
    @Field("email") String email,
    @Field("password") String password,
  );
}
