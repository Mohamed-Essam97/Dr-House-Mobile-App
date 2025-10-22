import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_doctor_house_mobile_app/domain/entities/user.dart';

part 'auth_state.g.dart'; // This file will be generated

@JsonSerializable()
class AuthState extends Equatable {
  final User? user;
  final String accessToken;
  final String refreshToken;
  final String deviceToken;
  final String expiresOn;
  final bool isLoggingIn;
  final bool isLoggedIn;

  const AuthState({
    this.user,
    this.accessToken = '',
    this.refreshToken = '',
    this.deviceToken = '',
    this.expiresOn = '',
    this.isLoggingIn = false,
    this.isLoggedIn = false,
  });

  AuthState copyWith({
    User? user,
    String? accessToken,
    String? refreshToken,
    String? deviceToken,
    String? expiresOn,
    bool? isLoggingIn,
    bool? isLoggedIn,
  }) {
    return AuthState(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      deviceToken: deviceToken ?? this.deviceToken,
      expiresOn: expiresOn ?? this.expiresOn,
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
        deviceToken,
        expiresOn,
        isLoggingIn,
        isLoggedIn,
      ];

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      deviceToken: json['deviceToken'] ?? '',
      expiresOn: json['expiresOn'] ?? '',
      isLoggedIn: json['isLoggedIn'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'deviceToken': deviceToken,
      'expiresOn': expiresOn,
      'isLoggedIn': isLoggedIn,
    };
  }
}
