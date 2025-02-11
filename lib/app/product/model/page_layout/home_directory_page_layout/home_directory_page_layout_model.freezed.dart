// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_directory_page_layout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeDirectoryPageLayoutModel _$HomeDirectoryPageLayoutModelFromJson(
    Map<String, dynamic> json) {
  return _HomeDirectoryPageLayoutModel.fromJson(json);
}

/// @nodoc
mixin _$HomeDirectoryPageLayoutModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  PageLayoutEnum get pageLayoutEnum => throw _privateConstructorUsedError;

  /// Serializes this HomeDirectoryPageLayoutModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeDirectoryPageLayoutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDirectoryPageLayoutModelCopyWith<HomeDirectoryPageLayoutModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDirectoryPageLayoutModelCopyWith<$Res> {
  factory $HomeDirectoryPageLayoutModelCopyWith(
          HomeDirectoryPageLayoutModel value,
          $Res Function(HomeDirectoryPageLayoutModel) then) =
      _$HomeDirectoryPageLayoutModelCopyWithImpl<$Res,
          HomeDirectoryPageLayoutModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id, @HiveField(1) PageLayoutEnum pageLayoutEnum});
}

/// @nodoc
class _$HomeDirectoryPageLayoutModelCopyWithImpl<$Res,
        $Val extends HomeDirectoryPageLayoutModel>
    implements $HomeDirectoryPageLayoutModelCopyWith<$Res> {
  _$HomeDirectoryPageLayoutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeDirectoryPageLayoutModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pageLayoutEnum = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pageLayoutEnum: null == pageLayoutEnum
          ? _value.pageLayoutEnum
          : pageLayoutEnum // ignore: cast_nullable_to_non_nullable
              as PageLayoutEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeDirectoryPageLayoutModelImplCopyWith<$Res>
    implements $HomeDirectoryPageLayoutModelCopyWith<$Res> {
  factory _$$HomeDirectoryPageLayoutModelImplCopyWith(
          _$HomeDirectoryPageLayoutModelImpl value,
          $Res Function(_$HomeDirectoryPageLayoutModelImpl) then) =
      __$$HomeDirectoryPageLayoutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id, @HiveField(1) PageLayoutEnum pageLayoutEnum});
}

/// @nodoc
class __$$HomeDirectoryPageLayoutModelImplCopyWithImpl<$Res>
    extends _$HomeDirectoryPageLayoutModelCopyWithImpl<$Res,
        _$HomeDirectoryPageLayoutModelImpl>
    implements _$$HomeDirectoryPageLayoutModelImplCopyWith<$Res> {
  __$$HomeDirectoryPageLayoutModelImplCopyWithImpl(
      _$HomeDirectoryPageLayoutModelImpl _value,
      $Res Function(_$HomeDirectoryPageLayoutModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeDirectoryPageLayoutModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pageLayoutEnum = null,
  }) {
    return _then(_$HomeDirectoryPageLayoutModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pageLayoutEnum: null == pageLayoutEnum
          ? _value.pageLayoutEnum
          : pageLayoutEnum // ignore: cast_nullable_to_non_nullable
              as PageLayoutEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDirectoryPageLayoutModelImpl extends _HomeDirectoryPageLayoutModel {
  _$HomeDirectoryPageLayoutModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.pageLayoutEnum = PageLayoutEnum.list})
      : super._();

  factory _$HomeDirectoryPageLayoutModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HomeDirectoryPageLayoutModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @JsonKey()
  @HiveField(1)
  final PageLayoutEnum pageLayoutEnum;

  @override
  String toString() {
    return 'HomeDirectoryPageLayoutModel(id: $id, pageLayoutEnum: $pageLayoutEnum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDirectoryPageLayoutModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pageLayoutEnum, pageLayoutEnum) ||
                other.pageLayoutEnum == pageLayoutEnum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pageLayoutEnum);

  /// Create a copy of HomeDirectoryPageLayoutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDirectoryPageLayoutModelImplCopyWith<
          _$HomeDirectoryPageLayoutModelImpl>
      get copyWith => __$$HomeDirectoryPageLayoutModelImplCopyWithImpl<
          _$HomeDirectoryPageLayoutModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDirectoryPageLayoutModelImplToJson(
      this,
    );
  }
}

abstract class _HomeDirectoryPageLayoutModel
    extends HomeDirectoryPageLayoutModel {
  factory _HomeDirectoryPageLayoutModel(
          {@HiveField(0) final int? id,
          @HiveField(1) final PageLayoutEnum pageLayoutEnum}) =
      _$HomeDirectoryPageLayoutModelImpl;
  _HomeDirectoryPageLayoutModel._() : super._();

  factory _HomeDirectoryPageLayoutModel.fromJson(Map<String, dynamic> json) =
      _$HomeDirectoryPageLayoutModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  PageLayoutEnum get pageLayoutEnum;

  /// Create a copy of HomeDirectoryPageLayoutModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDirectoryPageLayoutModelImplCopyWith<
          _$HomeDirectoryPageLayoutModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
