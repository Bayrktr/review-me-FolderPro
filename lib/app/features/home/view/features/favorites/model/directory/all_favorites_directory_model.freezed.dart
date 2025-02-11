// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_favorites_directory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllFavoritesDirectoryModel _$AllFavoritesDirectoryModelFromJson(
    Map<String, dynamic> json) {
  return _AllFavoritesDirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$AllFavoritesDirectoryModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<FavoritesDirectoryModel?> get allFavoritesDirectory =>
      throw _privateConstructorUsedError;

  /// Serializes this AllFavoritesDirectoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllFavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllFavoritesDirectoryModelCopyWith<AllFavoritesDirectoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllFavoritesDirectoryModelCopyWith<$Res> {
  factory $AllFavoritesDirectoryModelCopyWith(AllFavoritesDirectoryModel value,
          $Res Function(AllFavoritesDirectoryModel) then) =
      _$AllFavoritesDirectoryModelCopyWithImpl<$Res,
          AllFavoritesDirectoryModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<FavoritesDirectoryModel?> allFavoritesDirectory});
}

/// @nodoc
class _$AllFavoritesDirectoryModelCopyWithImpl<$Res,
        $Val extends AllFavoritesDirectoryModel>
    implements $AllFavoritesDirectoryModelCopyWith<$Res> {
  _$AllFavoritesDirectoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllFavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allFavoritesDirectory = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allFavoritesDirectory: null == allFavoritesDirectory
          ? _value.allFavoritesDirectory
          : allFavoritesDirectory // ignore: cast_nullable_to_non_nullable
              as List<FavoritesDirectoryModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllFavoritesDirectoryModelImplCopyWith<$Res>
    implements $AllFavoritesDirectoryModelCopyWith<$Res> {
  factory _$$AllFavoritesDirectoryModelImplCopyWith(
          _$AllFavoritesDirectoryModelImpl value,
          $Res Function(_$AllFavoritesDirectoryModelImpl) then) =
      __$$AllFavoritesDirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) List<FavoritesDirectoryModel?> allFavoritesDirectory});
}

/// @nodoc
class __$$AllFavoritesDirectoryModelImplCopyWithImpl<$Res>
    extends _$AllFavoritesDirectoryModelCopyWithImpl<$Res,
        _$AllFavoritesDirectoryModelImpl>
    implements _$$AllFavoritesDirectoryModelImplCopyWith<$Res> {
  __$$AllFavoritesDirectoryModelImplCopyWithImpl(
      _$AllFavoritesDirectoryModelImpl _value,
      $Res Function(_$AllFavoritesDirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllFavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allFavoritesDirectory = null,
  }) {
    return _then(_$AllFavoritesDirectoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allFavoritesDirectory: null == allFavoritesDirectory
          ? _value._allFavoritesDirectory
          : allFavoritesDirectory // ignore: cast_nullable_to_non_nullable
              as List<FavoritesDirectoryModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllFavoritesDirectoryModelImpl extends _AllFavoritesDirectoryModel {
  _$AllFavoritesDirectoryModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1)
      final List<FavoritesDirectoryModel?> allFavoritesDirectory = const []})
      : _allFavoritesDirectory = allFavoritesDirectory,
        super._();

  factory _$AllFavoritesDirectoryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AllFavoritesDirectoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  final List<FavoritesDirectoryModel?> _allFavoritesDirectory;
  @override
  @JsonKey()
  @HiveField(1)
  List<FavoritesDirectoryModel?> get allFavoritesDirectory {
    if (_allFavoritesDirectory is EqualUnmodifiableListView)
      return _allFavoritesDirectory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allFavoritesDirectory);
  }

  @override
  String toString() {
    return 'AllFavoritesDirectoryModel(id: $id, allFavoritesDirectory: $allFavoritesDirectory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllFavoritesDirectoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._allFavoritesDirectory, _allFavoritesDirectory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_allFavoritesDirectory));

  /// Create a copy of AllFavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllFavoritesDirectoryModelImplCopyWith<_$AllFavoritesDirectoryModelImpl>
      get copyWith => __$$AllFavoritesDirectoryModelImplCopyWithImpl<
          _$AllFavoritesDirectoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllFavoritesDirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _AllFavoritesDirectoryModel extends AllFavoritesDirectoryModel {
  factory _AllFavoritesDirectoryModel(
          {@HiveField(0) final int? id,
          @HiveField(1)
          final List<FavoritesDirectoryModel?> allFavoritesDirectory}) =
      _$AllFavoritesDirectoryModelImpl;
  _AllFavoritesDirectoryModel._() : super._();

  factory _AllFavoritesDirectoryModel.fromJson(Map<String, dynamic> json) =
      _$AllFavoritesDirectoryModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  List<FavoritesDirectoryModel?> get allFavoritesDirectory;

  /// Create a copy of AllFavoritesDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllFavoritesDirectoryModelImplCopyWith<_$AllFavoritesDirectoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
