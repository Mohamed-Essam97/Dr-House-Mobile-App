import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") @JsonKey(includeIfNull: false) String? email,
    @Default("") String password,
    @Default("") @JsonKey(includeIfNull: false) String? deviceToken,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['email'] = email;
    json['password'] = password;

    if (deviceToken != null && deviceToken!.isNotEmpty) {
      json['deviceToken'] = deviceToken;
    }

    return json;
  }
}
