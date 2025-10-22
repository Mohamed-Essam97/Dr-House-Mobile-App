// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      deviceToken: json['deviceToken'] as String? ?? '',
      expiresOn: json['expiresOn'] as String? ?? '',
      isLoggingIn: json['isLoggingIn'] as bool? ?? false,
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
      'expiresOn': instance.expiresOn,
      'isLoggingIn': instance.isLoggingIn,
      'isLoggedIn': instance.isLoggedIn,
    };
