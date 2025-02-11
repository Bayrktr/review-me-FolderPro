// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PdfSettingsModel _$PdfSettingsModelFromJson(Map<String, dynamic> json) {
  return _PdfSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$PdfSettingsModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get enableSwipe => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get autoSpacing => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get pageFling => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get swipeHorizontal => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get nightMode => throw _privateConstructorUsedError;

  /// Serializes this PdfSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfSettingsModelCopyWith<PdfSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSettingsModelCopyWith<$Res> {
  factory $PdfSettingsModelCopyWith(
          PdfSettingsModel value, $Res Function(PdfSettingsModel) then) =
      _$PdfSettingsModelCopyWithImpl<$Res, PdfSettingsModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(2) bool enableSwipe,
      @HiveField(3) bool autoSpacing,
      @HiveField(4) bool pageFling,
      @HiveField(5) bool swipeHorizontal,
      @HiveField(6) bool nightMode});
}

/// @nodoc
class _$PdfSettingsModelCopyWithImpl<$Res, $Val extends PdfSettingsModel>
    implements $PdfSettingsModelCopyWith<$Res> {
  _$PdfSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enableSwipe = null,
    Object? autoSpacing = null,
    Object? pageFling = null,
    Object? swipeHorizontal = null,
    Object? nightMode = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enableSwipe: null == enableSwipe
          ? _value.enableSwipe
          : enableSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSpacing: null == autoSpacing
          ? _value.autoSpacing
          : autoSpacing // ignore: cast_nullable_to_non_nullable
              as bool,
      pageFling: null == pageFling
          ? _value.pageFling
          : pageFling // ignore: cast_nullable_to_non_nullable
              as bool,
      swipeHorizontal: null == swipeHorizontal
          ? _value.swipeHorizontal
          : swipeHorizontal // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: null == nightMode
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfSettingsModelImplCopyWith<$Res>
    implements $PdfSettingsModelCopyWith<$Res> {
  factory _$$PdfSettingsModelImplCopyWith(_$PdfSettingsModelImpl value,
          $Res Function(_$PdfSettingsModelImpl) then) =
      __$$PdfSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(2) bool enableSwipe,
      @HiveField(3) bool autoSpacing,
      @HiveField(4) bool pageFling,
      @HiveField(5) bool swipeHorizontal,
      @HiveField(6) bool nightMode});
}

/// @nodoc
class __$$PdfSettingsModelImplCopyWithImpl<$Res>
    extends _$PdfSettingsModelCopyWithImpl<$Res, _$PdfSettingsModelImpl>
    implements _$$PdfSettingsModelImplCopyWith<$Res> {
  __$$PdfSettingsModelImplCopyWithImpl(_$PdfSettingsModelImpl _value,
      $Res Function(_$PdfSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enableSwipe = null,
    Object? autoSpacing = null,
    Object? pageFling = null,
    Object? swipeHorizontal = null,
    Object? nightMode = null,
  }) {
    return _then(_$PdfSettingsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enableSwipe: null == enableSwipe
          ? _value.enableSwipe
          : enableSwipe // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSpacing: null == autoSpacing
          ? _value.autoSpacing
          : autoSpacing // ignore: cast_nullable_to_non_nullable
              as bool,
      pageFling: null == pageFling
          ? _value.pageFling
          : pageFling // ignore: cast_nullable_to_non_nullable
              as bool,
      swipeHorizontal: null == swipeHorizontal
          ? _value.swipeHorizontal
          : swipeHorizontal // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: null == nightMode
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfSettingsModelImpl extends _PdfSettingsModel {
  _$PdfSettingsModelImpl(
      {@HiveField(0) this.id,
      @HiveField(2) this.enableSwipe = true,
      @HiveField(3) this.autoSpacing = true,
      @HiveField(4) this.pageFling = false,
      @HiveField(5) this.swipeHorizontal = true,
      @HiveField(6) this.nightMode = false})
      : super._();

  factory _$PdfSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfSettingsModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @JsonKey()
  @HiveField(2)
  final bool enableSwipe;
  @override
  @JsonKey()
  @HiveField(3)
  final bool autoSpacing;
  @override
  @JsonKey()
  @HiveField(4)
  final bool pageFling;
  @override
  @JsonKey()
  @HiveField(5)
  final bool swipeHorizontal;
  @override
  @JsonKey()
  @HiveField(6)
  final bool nightMode;

  @override
  String toString() {
    return 'PdfSettingsModel(id: $id, enableSwipe: $enableSwipe, autoSpacing: $autoSpacing, pageFling: $pageFling, swipeHorizontal: $swipeHorizontal, nightMode: $nightMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enableSwipe, enableSwipe) ||
                other.enableSwipe == enableSwipe) &&
            (identical(other.autoSpacing, autoSpacing) ||
                other.autoSpacing == autoSpacing) &&
            (identical(other.pageFling, pageFling) ||
                other.pageFling == pageFling) &&
            (identical(other.swipeHorizontal, swipeHorizontal) ||
                other.swipeHorizontal == swipeHorizontal) &&
            (identical(other.nightMode, nightMode) ||
                other.nightMode == nightMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, enableSwipe, autoSpacing,
      pageFling, swipeHorizontal, nightMode);

  /// Create a copy of PdfSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfSettingsModelImplCopyWith<_$PdfSettingsModelImpl> get copyWith =>
      __$$PdfSettingsModelImplCopyWithImpl<_$PdfSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _PdfSettingsModel extends PdfSettingsModel {
  factory _PdfSettingsModel(
      {@HiveField(0) final int? id,
      @HiveField(2) final bool enableSwipe,
      @HiveField(3) final bool autoSpacing,
      @HiveField(4) final bool pageFling,
      @HiveField(5) final bool swipeHorizontal,
      @HiveField(6) final bool nightMode}) = _$PdfSettingsModelImpl;
  _PdfSettingsModel._() : super._();

  factory _PdfSettingsModel.fromJson(Map<String, dynamic> json) =
      _$PdfSettingsModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(2)
  bool get enableSwipe;
  @override
  @HiveField(3)
  bool get autoSpacing;
  @override
  @HiveField(4)
  bool get pageFling;
  @override
  @HiveField(5)
  bool get swipeHorizontal;
  @override
  @HiveField(6)
  bool get nightMode;

  /// Create a copy of PdfSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfSettingsModelImplCopyWith<_$PdfSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
