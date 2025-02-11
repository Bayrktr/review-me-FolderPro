import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'custom_pdf_view_model.g.dart';

@HiveType(typeId: 9)
class CustomPdfViewModel extends Equatable with HiveModelMixin {
  CustomPdfViewModel({this.id, this.pdfModel});

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final BaseFileModel? pdfModel;

  @override
  String get key => id.toString();

  @override
  List<Object?> get props => [id, pdfModel];
}

/*
@freezed
@HiveType(typeId: 9)
class CustomPdfViewModel with _$CustomPdfViewModel, HiveModelMixin {
  factory CustomPdfViewModel({
    @HiveField(0) int? id,
    @HiveField(1) PdfModel? pdfModel,
  }) = _CustomPdfViewModel;

  factory CustomPdfViewModel.fromJson(Map<String, dynamic> json) =>
      _$CustomPdfViewModelFromJson(json);

  CustomPdfViewModel._();

  CustomPdfViewModel fromJson(Map<String, dynamic> json) =>
      CustomPdfViewModel.fromJson(json);

  static const String customPdfViewModelKey = 'customPdfViewModel';

  @override
  String get key {
    return customPdfViewModelKey;
  }
}

 */
