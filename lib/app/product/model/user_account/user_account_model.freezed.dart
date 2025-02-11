// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) {
  return _DirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$UserAccountModel {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this UserAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountModelCopyWith<UserAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountModelCopyWith<$Res> {
  factory $UserAccountModelCopyWith(
          UserAccountModel value, $Res Function(UserAccountModel) then) =
      _$UserAccountModelCopyWithImpl<$Res, UserAccountModel>;
  @useResult
  $Res call({String? uid, String? name, String? email, bool isVerified});
}

/// @nodoc
class _$UserAccountModelCopyWithImpl<$Res, $Val extends UserAccountModel>
    implements $UserAccountModelCopyWith<$Res> {
  _$UserAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryModelImplCopyWith<$Res>
    implements $UserAccountModelCopyWith<$Res> {
  factory _$$DirectoryModelImplCopyWith(_$DirectoryModelImpl value,
          $Res Function(_$DirectoryModelImpl) then) =
      __$$DirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String? name, String? email, bool isVerified});
}

/// @nodoc
class __$$DirectoryModelImplCopyWithImpl<$Res>
    extends _$UserAccountModelCopyWithImpl<$Res, _$DirectoryModelImpl>
    implements _$$DirectoryModelImplCopyWith<$Res> {
  __$$DirectoryModelImplCopyWithImpl(
      _$DirectoryModelImpl _value, $Res Function(_$DirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? isVerified = null,
  }) {
    return _then(_$DirectoryModelImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectoryModelImpl extends _DirectoryModel {
  _$DirectoryModelImpl(
      {this.uid, this.name, this.email, this.isVerified = false})
      : super._();

  factory _$DirectoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryModelImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'UserAccountModel(uid: $uid, name: $name, email: $email, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, email, isVerified);

  /// Create a copy of UserAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryModelImplCopyWith<_$DirectoryModelImpl> get copyWith =>
      __$$DirectoryModelImplCopyWithImpl<_$DirectoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _DirectoryModel extends UserAccountModel {
  factory _DirectoryModel(
      {final String? uid,
      final String? name,
      final String? email,
      final bool isVerified}) = _$DirectoryModelImpl;
  _DirectoryModel._() : super._();

  factory _DirectoryModel.fromJson(Map<String, dynamic> json) =
      _$DirectoryModelImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  String? get email;
  @override
  bool get isVerified;

  /// Create a copy of UserAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryModelImplCopyWith<_$DirectoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
