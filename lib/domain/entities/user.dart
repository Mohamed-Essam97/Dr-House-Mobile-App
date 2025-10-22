import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') String account,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String address,
    @Default('') String phone,
    @Default('') String position,
    @Default('') String email,
    @Default('') String role,
    @Default('') String roleName,
    @Default('') String password,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default('') String gender,
    @Default('') String country,
    @Default('') String? profilePhoto,
    @Default(0) num roleRank,
    @Default(false) bool termsAndConditions,
    @Default(false) bool passwordUpdateRequired,
    @Default(false) bool isEnabled,
    @Default(false) bool isVerified,
    @Default(false) bool isMobileVerified,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
