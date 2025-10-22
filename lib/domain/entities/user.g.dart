// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String? ?? '',
      account: json['account'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      position: json['position'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? '',
      roleName: json['roleName'] as String? ?? '',
      password: json['password'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      country: json['country'] as String? ?? '',
      profilePhoto: json['profilePhoto'] as String? ?? '',
      roleRank: json['roleRank'] as num? ?? 0,
      termsAndConditions: json['termsAndConditions'] as bool? ?? false,
      passwordUpdateRequired: json['passwordUpdateRequired'] as bool? ?? false,
      isEnabled: json['isEnabled'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      isMobileVerified: json['isMobileVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'account': instance.account,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'phone': instance.phone,
      'position': instance.position,
      'email': instance.email,
      'role': instance.role,
      'roleName': instance.roleName,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'gender': instance.gender,
      'country': instance.country,
      'profilePhoto': instance.profilePhoto,
      'roleRank': instance.roleRank,
      'termsAndConditions': instance.termsAndConditions,
      'passwordUpdateRequired': instance.passwordUpdateRequired,
      'isEnabled': instance.isEnabled,
      'isVerified': instance.isVerified,
      'isMobileVerified': instance.isMobileVerified,
    };
