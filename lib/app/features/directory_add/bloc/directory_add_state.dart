import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:equatable/equatable.dart';

class DirectoryAddState with EquatableMixin {
  DirectoryAddState({
    this.status = DirectoryAddStatus.start,
    this.statusMessage,
    this.popUpStatus = DirectoryAddPopUpStatus.initial,
    this.popUpStatusMessage,
    this.selectedFileTypeEnum,
  });

  final DirectoryAddStatus status;
  final String? statusMessage;
  final DirectoryAddPopUpStatus popUpStatus;
  final String? popUpStatusMessage;
  final FileTypeEnum? selectedFileTypeEnum;

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        popUpStatus,
        popUpStatusMessage,
        selectedFileTypeEnum,
      ];

  DirectoryAddState copyWith({
    DirectoryAddStatus? status,
    String? statusMessage,
    DirectoryAddPopUpStatus? popUpStatus,
    String? popUpStatusMessage,
    FileTypeEnum? selectedFileTypeEnum,
  }) =>
      DirectoryAddState(
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        popUpStatus: popUpStatus ?? this.popUpStatus,
        popUpStatusMessage: popUpStatusMessage ?? this.popUpStatusMessage,
        selectedFileTypeEnum: selectedFileTypeEnum ?? this.selectedFileTypeEnum,
      );
}

enum DirectoryAddStatus {
  start,
  initial,
  loading,
  error,
  finish,
}

enum DirectoryAddPopUpStatus {
  initial,
  show,
}
