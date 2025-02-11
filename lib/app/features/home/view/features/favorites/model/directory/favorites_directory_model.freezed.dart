// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_directory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoritesDirectoryModel _$FavoritesDirectoryModelFromJson(
    Map<String, dynamic> json) {
  return _FavoritesDirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$FavoritesDirectoryModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime? get addedTime => throw _privateConstructorUsedError;
  @HiveField(2)
  BaseDirectoryModel? get directoryModel => throw _privateConstructorUsedError;

  /// Serializes this FavoritesDirectoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoritesDirectoryModelCopyWith<FavoritesDirectoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesDirectoryModelCopyWith<$Res> {
  factory $FavoritesDirectoryModelCopyWith(FavoritesDirectoryModel value,
          $Res Function(FavoritesDirectoryModel) then) =
      _$FavoritesDirectoryModelCopyWithImpl<$Res, FavoritesDirectoryModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) DateTime? addedTime,
      @HiveField(2) BaseDirectoryModel? directoryModel});
}

/// @nodoc
class _$FavoritesDirectoryModelCopyWithImpl<$Res,
        $Val extends FavoritesDirectoryModel>
    implements $FavoritesDirectoryModelCopyWith<$Res> {
  _$FavoritesDirectoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? addedTime = freezed,
    Object? directoryModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      addedTime: freezed == addedTime
          ? _value.addedTime
          : addedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      directoryModel: freezed == directoryModel
          ? _value.directoryModel
          : directoryModel // ignore: cast_nullable_to_non_nullable
              as BaseDirectoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesDirectoryModelImplCopyWith<$Res>
    implements $FavoritesDirectoryModelCopyWith<$Res> {
  factory _$$FavoritesDirectoryModelImplCopyWith(
          _$FavoritesDirectoryModelImpl value,
          $Res Function(_$FavoritesDirectoryModelImpl) then) =
      __$$FavoritesDirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) DateTime? addedTime,
      @HiveField(2) BaseDirectoryModel? directoryModel});
}

/// @nodoc
class __$$FavoritesDirectoryModelImplCopyWithImpl<$Res>
    extends _$FavoritesDirectoryModelCopyWithImpl<$Res,
        _$FavoritesDirectoryModelImpl>
    implements _$$FavoritesDirectoryModelImplCopyWith<$Res> {
  __$$FavoritesDirectoryModelImplCopyWithImpl(
      _$FavoritesDirectoryModelImpl _value,
      $Res Function(_$FavoritesDirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? addedTime = freezed,
    Object? directoryModel = freezed,
  }) {
    return _then(_$FavoritesDirectoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      addedTime: freezed == addedTime
          ? _value.addedTime
          : addedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      directoryModel: freezed == directoryModel
          ? _value.directoryModel
          : directoryModel // ignore: cast_nullable_to_non_nullable
              as BaseDirectoryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoritesDirectoryModelImpl extends _FavoritesDirectoryModel {
  _$FavoritesDirectoryModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.addedTime,
      @HiveField(2) this.directoryModel})
      : super._();

  factory _$FavoritesDirectoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoritesDirectoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final DateTime? addedTime;
  @override
  @HiveField(2)
  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'FavoritesDirectoryModel(id: $id, addedTime: $addedTime, directoryModel: $directoryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesDirectoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addedTime, addedTime) ||
                other.addedTime == addedTime) &&
            (identical(other.directoryModel, directoryModel) ||
                other.directoryModel == directoryModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, addedTime, directoryModel);

  /// Create a copy of FavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesDirectoryModelImplCopyWith<_$FavoritesDirectoryModelImpl>
      get copyWith => __$$FavoritesDirectoryModelImplCopyWithImpl<
          _$FavoritesDirectoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoritesDirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _FavoritesDirectoryModel extends FavoritesDirectoryModel {
  factory _FavoritesDirectoryModel(
          {@HiveField(0) final int? id,
          @HiveField(1) final DateTime? addedTime,
          @HiveField(2) final BaseDirectoryModel? directoryModel}) =
      _$FavoritesDirectoryModelImpl;
  _FavoritesDirectoryModel._() : super._();

  factory _FavoritesDirectoryModel.fromJson(Map<String, dynamic> json) =
      _$FavoritesDirectoryModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  DateTime? get addedTime;
  @override
  @HiveField(2)
  BaseDirectoryModel? get directoryModel;

  /// Create a copy of FavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoritesDirectoryModelImplCopyWith<_$FavoritesDirectoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
