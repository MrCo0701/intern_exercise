import 'package:exercise_1/features/shop/settings/data/model/information_user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client_user.g.dart';

@RestApi()
abstract class RestClientUser {
  factory RestClientUser(Dio dio, {String baseUrl}) = _RestClientUser;

  @GET('/api/user-service/me')
  Future<InformationUser> getUser(@Header('Authorization') String token);

  @DELETE('/api/scan-service/moles')
  Future<void> delete_all_scan(@Header('Authorization') String token);
}
