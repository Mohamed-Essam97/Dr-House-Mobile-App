// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get account => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get roleName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  num get roleRank => throw _privateConstructorUsedError;
  bool get termsAndConditions => throw _privateConstructorUsedError;
  bool get passwordUpdateRequired => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isMobileVerified => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String account,
      String firstName,
      String lastName,
      String address,
      String phone,
      String position,
      String email,
      String role,
      String roleName,
      String password,
      String createdAt,
      String updatedAt,
      String gender,
      String country,
      String? profilePhoto,
      num roleRank,
      bool termsAndConditions,
      bool passwordUpdateRequired,
      bool isEnabled,
      bool isVerified,
      bool isMobileVerified});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? account = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phone = null,
    Object? position = null,
    Object? email = null,
    Object? role = null,
    Object? roleName = null,
    Object? password = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? gender = null,
    Object? country = null,
    Object? profilePhoto = freezed,
    Object? roleRank = null,
    Object? termsAndConditions = null,
    Object? passwordUpdateRequired = null,
    Object? isEnabled = null,
    Object? isVerified = null,
    Object? isMobileVerified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      roleRank: null == roleRank
          ? _value.roleRank
          : roleRank // ignore: cast_nullable_to_non_nullable
              as num,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordUpdateRequired: null == passwordUpdateRequired
          ? _value.passwordUpdateRequired
          : passwordUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isMobileVerified: null == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String account,
      String firstName,
      String lastName,
      String address,
      String phone,
      String position,
      String email,
      String role,
      String roleName,
      String password,
      String createdAt,
      String updatedAt,
      String gender,
      String country,
      String? profilePhoto,
      num roleRank,
      bool termsAndConditions,
      bool passwordUpdateRequired,
      bool isEnabled,
      bool isVerified,
      bool isMobileVerified});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? account = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phone = null,
    Object? position = null,
    Object? email = null,
    Object? role = null,
    Object? roleName = null,
    Object? password = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? gender = null,
    Object? country = null,
    Object? profilePhoto = freezed,
    Object? roleRank = null,
    Object? termsAndConditions = null,
    Object? passwordUpdateRequired = null,
    Object? isEnabled = null,
    Object? isVerified = null,
    Object? isMobileVerified = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      roleRank: null == roleRank
          ? _value.roleRank
          : roleRank // ignore: cast_nullable_to_non_nullable
              as num,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordUpdateRequired: null == passwordUpdateRequired
          ? _value.passwordUpdateRequired
          : passwordUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isMobileVerified: null == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: '_id') this.id = '',
      this.account = '',
      this.firstName = '',
      this.lastName = '',
      this.address = '',
      this.phone = '',
      this.position = '',
      this.email = '',
      this.role = '',
      this.roleName = '',
      this.password = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.gender = '',
      this.country = '',
      this.profilePhoto = '',
      this.roleRank = 0,
      this.termsAndConditions = false,
      this.passwordUpdateRequired = false,
      this.isEnabled = false,
      this.isVerified = false,
      this.isMobileVerified = false});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey()
  final String account;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String position;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String roleName;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String? profilePhoto;
  @override
  @JsonKey()
  final num roleRank;
  @override
  @JsonKey()
  final bool termsAndConditions;
  @override
  @JsonKey()
  final bool passwordUpdateRequired;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isMobileVerified;

  @override
  String toString() {
    return 'User(id: $id, account: $account, firstName: $firstName, lastName: $lastName, address: $address, phone: $phone, position: $position, email: $email, role: $role, roleName: $roleName, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, gender: $gender, country: $country, profilePhoto: $profilePhoto, roleRank: $roleRank, termsAndConditions: $termsAndConditions, passwordUpdateRequired: $passwordUpdateRequired, isEnabled: $isEnabled, isVerified: $isVerified, isMobileVerified: $isMobileVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.roleRank, roleRank) ||
                other.roleRank == roleRank) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.passwordUpdateRequired, passwordUpdateRequired) ||
                other.passwordUpdateRequired == passwordUpdateRequired) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isMobileVerified, isMobileVerified) ||
                other.isMobileVerified == isMobileVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        account,
        firstName,
        lastName,
        address,
        phone,
        position,
        email,
        role,
        roleName,
        password,
        createdAt,
        updatedAt,
        gender,
        country,
        profilePhoto,
        roleRank,
        termsAndConditions,
        passwordUpdateRequired,
        isEnabled,
        isVerified,
        isMobileVerified
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '_id') final String id,
      final String account,
      final String firstName,
      final String lastName,
      final String address,
      final String phone,
      final String position,
      final String email,
      final String role,
      final String roleName,
      final String password,
      final String createdAt,
      final String updatedAt,
      final String gender,
      final String country,
      final String? profilePhoto,
      final num roleRank,
      final bool termsAndConditions,
      final bool passwordUpdateRequired,
      final bool isEnabled,
      final bool isVerified,
      final bool isMobileVerified}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get account;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get address;
  @override
  String get phone;
  @override
  String get position;
  @override
  String get email;
  @override
  String get role;
  @override
  String get roleName;
  @override
  String get password;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String get gender;
  @override
  String get country;
  @override
  String? get profilePhoto;
  @override
  num get roleRank;
  @override
  bool get termsAndConditions;
  @override
  bool get passwordUpdateRequired;
  @override
  bool get isEnabled;
  @override
  bool get isVerified;
  @override
  bool get isMobileVerified;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
