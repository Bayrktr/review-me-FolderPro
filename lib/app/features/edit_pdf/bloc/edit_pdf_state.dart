import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class EditPdfState with EquatableMixin {
  EditPdfState({
    this.status = EditPdfStatus.start,
    this.allFileModel,
    this.savePdfStatus = SavePdfStatus.initial,
  });

  final EditPdfStatus status;
  final AllFilesModel? allFileModel;

  final SavePdfStatus savePdfStatus;

  @override
  List<Object?> get props => [
        status,
        allFileModel,
    savePdfStatus,
      ];

  EditPdfState copyWith({
    EditPdfStatus? status,
    AllFilesModel? allFileModel,
    FilePickerResult? pickFileResult,
    SavePdfStatus? savePdfStatus,
  }) =>
      EditPdfState(
        status: status ?? this.status,
        allFileModel: allFileModel ?? this.allFileModel,
        savePdfStatus: savePdfStatus ?? this.savePdfStatus,
      );
}

enum EditPdfStatus {
  start,
  initial,
  loading,
  error,
  finish,
}

enum SavePdfStatus {
  initial,
  alreadyExist,
  success,
}
