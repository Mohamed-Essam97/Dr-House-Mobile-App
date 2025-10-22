import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @Default(User()) User user,
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String deviceToken,
    @Default([]) List<String> scope,
    @Default('') @JsonKey(name: 'expiresOn') String expiresOn,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
