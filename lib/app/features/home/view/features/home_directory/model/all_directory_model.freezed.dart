// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_directory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllDirectoryModel _$AllDirectoryModelFromJson(Map<String, dynamic> json) {
  return _AllDirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$AllDirectoryModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<BaseDirectoryModel?> get allDirectory =>
      throw _privateConstructorUsedError;

  /// Serializes this AllDirectoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllDirectoryModelCopyWith<AllDirectoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllDirectoryModelCopyWith<$Res> {
  factory $AllDirectoryModelCopyWith(
          AllDirectoryModel value, $Res Function(AllDirectoryModel) then) =
      _$AllDirectoryModelCopyWithImpl<$Res, AllDirectoryModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<BaseDirectoryModel?> allDirectory});
}

/// @nodoc
class _$AllDirectoryModelCopyWithImpl<$Res, $Val extends AllDirectoryModel>
    implements $AllDirectoryModelCopyWith<$Res> {
  _$AllDirectoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allDirectory = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allDirectory: null == allDirectory
          ? _value.allDirectory
          : allDirectory // ignore: cast_nullable_to_non_nullable
              as List<BaseDirectoryModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllDirectoryModelImplCopyWith<$Res>
    implements $AllDirectoryModelCopyWith<$Res> {
  factory _$$AllDirectoryModelImplCopyWith(_$AllDirectoryModelImpl value,
          $Res Function(_$AllDirectoryModelImpl) then) =
      __$$AllDirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<BaseDirectoryModel?> allDirectory});
}

/// @nodoc
class __$$AllDirectoryModelImplCopyWithImpl<$Res>
    extends _$AllDirectoryModelCopyWithImpl<$Res, _$AllDirectoryModelImpl>
    implements _$$AllDirectoryModelImplCopyWith<$Res> {
  __$$AllDirectoryModelImplCopyWithImpl(_$AllDirectoryModelImpl _value,
      $Res Function(_$AllDirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allDirectory = null,
  }) {
    return _then(_$AllDirectoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allDirectory: null == allDirectory
          ? _value._allDirectory
          : allDirectory // ignore: cast_nullable_to_non_nullable
              as List<BaseDirectoryModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllDirectoryModelImpl extends _AllDirectoryModel {
  _$AllDirectoryModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) final List<BaseDirectoryModel?> allDirectory = const []})
      : _allDirectory = allDirectory,
        super._();

  factory _$AllDirectoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllDirectoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  final List<BaseDirectoryModel?> _allDirectory;
  @override
  @JsonKey()
  @HiveField(1)
  List<BaseDirectoryModel?> get allDirectory {
    if (_allDirectory is EqualUnmodifiableListView) return _allDirectory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDirectory);
  }

  @override
  String toString() {
    return 'AllDirectoryModel(id: $id, allDirectory: $allDirectory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllDirectoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._allDirectory, _allDirectory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_allDirectory));

  /// Create a copy of AllDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllDirectoryModelImplCopyWith<_$AllDirectoryModelImpl> get copyWith =>
      __$$AllDirectoryModelImplCopyWithImpl<_$AllDirectoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllDirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _AllDirectoryModel extends AllDirectoryModel {
  factory _AllDirectoryModel(
          {@HiveField(0) final int? id,
          @HiveField(1) final List<BaseDirectoryModel?> allDirectory}) =
      _$AllDirectoryModelImpl;
  _AllDirectoryModel._() : super._();

  factory _AllDirectoryModel.fromJson(Map<String, dynamic> json) =
      _$AllDirectoryModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  List<BaseDirectoryModel?> get allDirectory;

  /// Create a copy of AllDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllDirectoryModelImplCopyWith<_$AllDirectoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
