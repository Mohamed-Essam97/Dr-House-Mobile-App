import 'package:either_dart/either.dart';
import 'package:my_doctor_house_mobile_app/domain/models/login_response.dart';
import 'package:my_doctor_house_mobile_app/domain/params/login.dart';
import 'package:my_doctor_house_mobile_app/domain/resources/data_state.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginParams params);

  // Future<Either<Failure, dynamic>> logout(LogoutParams params);
}
