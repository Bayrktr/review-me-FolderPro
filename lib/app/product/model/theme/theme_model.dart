import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'theme_model.freezed.dart';
part 'theme_model.g.dart';

@freezed
@HiveType(typeId: 4)
class ThemeModel with _$ThemeModel, HiveModelMixin {
  factory ThemeModel({
    @HiveField(0) int? id,
    @HiveField(1) @Default(true) bool isLight,
  }) = _ThemeModel;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  ThemeModel._();

  ThemeModel fromJson(Map<String, dynamic> json) => ThemeModel.fromJson(json);

  static const String themeModelKey = 'themeModel';

  @override
  String get key => themeModelKey;
}


/*
class _ThemeDataConverter
    implements JsonConverter<ThemeData, Map<String, dynamic>> {
  const _ThemeDataConverter();

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    return ThemeData(
      primaryColor: Color(json['primaryColor'] as int),
    );
  }

  @override
  Map<String, dynamic> toJson(ThemeData themeData) {
    return {
      'primaryColor': themeData.primaryColor.value,
    };
  }
}

 */
