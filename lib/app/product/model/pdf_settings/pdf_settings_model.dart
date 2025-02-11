import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pdf_settings_model.freezed.dart';
part 'pdf_settings_model.g.dart';

@freezed
@HiveType(typeId: 8)
class PdfSettingsModel with _$PdfSettingsModel, HiveModelMixin {
  factory PdfSettingsModel({
    @HiveField(0) int? id,
    @HiveField(2) @Default(true) bool enableSwipe,
    @HiveField(3) @Default(true) bool autoSpacing,
    @HiveField(4) @Default(false) bool pageFling,
    @HiveField(5) @Default(true) bool swipeHorizontal,
    @HiveField(6) @Default(false) bool nightMode,
  }) = _PdfSettingsModel;

  factory PdfSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PdfSettingsModelFromJson(json);

  PdfSettingsModel._();

  PdfSettingsModel fromJson(Map<String, dynamic> json) =>
      PdfSettingsModel.fromJson(json);

  static const String pdfSettingsModelKey = 'PdfSettingsModel';

  @override
  String get key {
    return pdfSettingsModelKey;
  }
}
