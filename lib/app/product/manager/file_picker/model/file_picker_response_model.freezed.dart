// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_picker_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilePickerResponseModel _$FilePickerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FilePickerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FilePickerResponseModel {
  String? get message => throw _privateConstructorUsedError;
  String? get pdfPath => throw _privateConstructorUsedError;
  String? get directoryName => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this FilePickerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilePickerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilePickerResponseModelCopyWith<FilePickerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePickerResponseModelCopyWith<$Res> {
  factory $FilePickerResponseModelCopyWith(FilePickerResponseModel value,
          $Res Function(FilePickerResponseModel) then) =
      _$FilePickerResponseModelCopyWithImpl<$Res, FilePickerResponseModel>;
  @useResult
  $Res call({String? message, String? pdfPath, String? directoryName, int? id});
}

/// @nodoc
class _$FilePickerResponseModelCopyWithImpl<$Res,
        $Val extends FilePickerResponseModel>
    implements $FilePickerResponseModelCopyWith<$Res> {
  _$FilePickerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilePickerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? pdfPath = freezed,
    Object? directoryName = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      directoryName: freezed == directoryName
          ? _value.directoryName
          : directoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilePickerResponseModelImplCopyWith<$Res>
    implements $FilePickerResponseModelCopyWith<$Res> {
  factory _$$FilePickerResponseModelImplCopyWith(
          _$FilePickerResponseModelImpl value,
          $Res Function(_$FilePickerResponseModelImpl) then) =
      __$$FilePickerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? pdfPath, String? directoryName, int? id});
}

/// @nodoc
class __$$FilePickerResponseModelImplCopyWithImpl<$Res>
    extends _$FilePickerResponseModelCopyWithImpl<$Res,
        _$FilePickerResponseModelImpl>
    implements _$$FilePickerResponseModelImplCopyWith<$Res> {
  __$$FilePickerResponseModelImplCopyWithImpl(
      _$FilePickerResponseModelImpl _value,
      $Res Function(_$FilePickerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilePickerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? pdfPath = freezed,
    Object? directoryName = freezed,
    Object? id = freezed,
  }) {
    return _then(_$FilePickerResponseModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      directoryName: freezed == directoryName
          ? _value.directoryName
          : directoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilePickerResponseModelImpl extends _FilePickerResponseModel {
  _$FilePickerResponseModelImpl(
      {this.message, this.pdfPath, this.directoryName, this.id})
      : super._();

  factory _$FilePickerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilePickerResponseModelImplFromJson(json);

  @override
  final String? message;
  @override
  final String? pdfPath;
  @override
  final String? directoryName;
  @override
  final int? id;

  @override
  String toString() {
    return 'FilePickerResponseModel(message: $message, pdfPath: $pdfPath, directoryName: $directoryName, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePickerResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath) &&
            (identical(other.directoryName, directoryName) ||
                other.directoryName == directoryName) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, pdfPath, directoryName, id);

  /// Create a copy of FilePickerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePickerResponseModelImplCopyWith<_$FilePickerResponseModelImpl>
      get copyWith => __$$FilePickerResponseModelImplCopyWithImpl<
          _$FilePickerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilePickerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FilePickerResponseModel extends FilePickerResponseModel {
  factory _FilePickerResponseModel(
      {final String? message,
      final String? pdfPath,
      final String? directoryName,
      final int? id}) = _$FilePickerResponseModelImpl;
  _FilePickerResponseModel._() : super._();

  factory _FilePickerResponseModel.fromJson(Map<String, dynamic> json) =
      _$FilePickerResponseModelImpl.fromJson;

  @override
  String? get message;
  @override
  String? get pdfPath;
  @override
  String? get directoryName;
  @override
  int? get id;

  /// Create a copy of FilePickerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilePickerResponseModelImplCopyWith<_$FilePickerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
