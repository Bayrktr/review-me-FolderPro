import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:equatable/equatable.dart';

class OpenPdfState with EquatableMixin {
  OpenPdfState({
    required this.pdfModel, this.status = OpenPdfStatus.start,
    this.pdfSettingsModel,
  });

  final OpenPdfStatus status;
  final BaseFileModel pdfModel;
  final PdfSettingsModel? pdfSettingsModel;

  @override
  List<Object?> get props => [status, pdfModel, pdfSettingsModel];

  OpenPdfState copyWith({
    OpenPdfStatus? status,
    BaseFileModel? pdfModel,
    PdfSettingsModel? pdfSettingsModel,
  }) =>
      OpenPdfState(
        status: status ?? this.status,
        pdfModel: pdfModel ?? this.pdfModel,
        pdfSettingsModel: pdfSettingsModel ?? this.pdfSettingsModel,
      );
}

enum OpenPdfStatus {
  start,
  initial,
  loading,
  error,
}
