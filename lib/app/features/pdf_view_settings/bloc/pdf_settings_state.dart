import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:equatable/equatable.dart';

class PdfSettingsState with EquatableMixin {
  PdfSettingsState({
    this.status = PdfSettingsStatus.start,
    this.pdfSettingsModel,
  });

  final PdfSettingsStatus status;
  final PdfSettingsModel? pdfSettingsModel;

  @override
  List<Object?> get props => [
        status,
        pdfSettingsModel,
      ];

  PdfSettingsState copyWith({
    PdfSettingsStatus? status,
    PdfSettingsModel? pdfSettingsModel,
  }) =>
      PdfSettingsState(
        status: status ?? this.status,
        pdfSettingsModel: pdfSettingsModel ?? this.pdfSettingsModel,
      );
}

enum PdfSettingsStatus {
  start,
  initial,
  loading,
  error,
}
