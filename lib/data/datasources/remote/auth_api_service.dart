import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doctor_house_mobile_app/domain/models/login_response.dart';
import 'package:my_doctor_house_mobile_app/domain/params/login.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@Singleton()
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/login')
  Future<HttpResponse<LoginResponse>> login(@Body() LoginParams params);

  // @POST('/logout')
  // Future<HttpResponse<dynamic>> logout(@Body() LogoutParams params);
}
