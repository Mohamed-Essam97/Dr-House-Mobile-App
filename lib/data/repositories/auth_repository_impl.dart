import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doctor_house_mobile_app/data/repositories/auth_repository.dart';
import 'package:my_doctor_house_mobile_app/data/utils/helpers.dart';
import 'package:my_doctor_house_mobile_app/domain/models/login_response.dart';
import 'package:my_doctor_house_mobile_app/domain/params/login.dart';
import 'package:my_doctor_house_mobile_app/domain/resources/data_state.dart';

import '../datasources/remote/auth_api_service.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  const AuthRepositoryImpl(this._authApiService);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams params) =>
      handleApiResponse<LoginResponse>(_authApiService.login(params));

  // @override
  // Future<Either<Failure, dynamic>> logout(LogoutParams params) =>
  //     handleApiResponse<dynamic>(_authApiService.logout(params));
}
