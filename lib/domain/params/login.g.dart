// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginParamsImpl _$$LoginParamsImplFromJson(Map<String, dynamic> json) =>
    _$LoginParamsImpl(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      deviceToken: json['deviceToken'] as String? ?? "",
    );

Map<String, dynamic> _$$LoginParamsImplToJson(_$LoginParamsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  val['password'] = instance.password;
  writeNotNull('deviceToken', instance.deviceToken);
  return val;
}
