// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      deviceToken: json['deviceToken'] as String? ?? '',
      scope:
          (json['scope'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      expiresOn: json['expiresOn'] as String? ?? '',
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
      'scope': instance.scope,
      'expiresOn': instance.expiresOn,
    };
