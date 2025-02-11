// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseErrorModel _$ResponseErrorModelFromJson(Map<String, dynamic> json) {
  return _ResponseErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseErrorModel {
  String? get message => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this ResponseErrorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseErrorModelCopyWith<ResponseErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseErrorModelCopyWith<$Res> {
  factory $ResponseErrorModelCopyWith(
          ResponseErrorModel value, $Res Function(ResponseErrorModel) then) =
      _$ResponseErrorModelCopyWithImpl<$Res, ResponseErrorModel>;
  @useResult
  $Res call({String? message, int? statusCode});
}

/// @nodoc
class _$ResponseErrorModelCopyWithImpl<$Res, $Val extends ResponseErrorModel>
    implements $ResponseErrorModelCopyWith<$Res> {
  _$ResponseErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseErrorModelImplCopyWith<$Res>
    implements $ResponseErrorModelCopyWith<$Res> {
  factory _$$ResponseErrorModelImplCopyWith(_$ResponseErrorModelImpl value,
          $Res Function(_$ResponseErrorModelImpl) then) =
      __$$ResponseErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? statusCode});
}

/// @nodoc
class __$$ResponseErrorModelImplCopyWithImpl<$Res>
    extends _$ResponseErrorModelCopyWithImpl<$Res, _$ResponseErrorModelImpl>
    implements _$$ResponseErrorModelImplCopyWith<$Res> {
  __$$ResponseErrorModelImplCopyWithImpl(_$ResponseErrorModelImpl _value,
      $Res Function(_$ResponseErrorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ResponseErrorModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseErrorModelImpl extends _ResponseErrorModel {
  _$ResponseErrorModelImpl({this.message, this.statusCode}) : super._();

  factory _$ResponseErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseErrorModelImplFromJson(json);

  @override
  final String? message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ResponseErrorModel(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseErrorModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of ResponseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseErrorModelImplCopyWith<_$ResponseErrorModelImpl> get copyWith =>
      __$$ResponseErrorModelImplCopyWithImpl<_$ResponseErrorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseErrorModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseErrorModel extends ResponseErrorModel {
  factory _ResponseErrorModel({final String? message, final int? statusCode}) =
      _$ResponseErrorModelImpl;
  _ResponseErrorModel._() : super._();

  factory _ResponseErrorModel.fromJson(Map<String, dynamic> json) =
      _$ResponseErrorModelImpl.fromJson;

  @override
  String? get message;
  @override
  int? get statusCode;

  /// Create a copy of ResponseErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseErrorModelImplCopyWith<_$ResponseErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
