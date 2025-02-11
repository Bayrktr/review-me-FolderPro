import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:equatable/equatable.dart';

class EditDirectoryState with EquatableMixin {
  EditDirectoryState({
    this.status = EditDirectoryStatus.start,
    this.allFileStatus = EditDirectoryAllFileStatus.start,
    this.allFileSnackBarStatus = EditDirectoryAllFileSnackBarStatus.initial,
    this.allDirectoryStatus = EditDirectoryAllDirectoryStatus.initial,
    this.selectedDirectory,
    this.allFilesModel,
  });

  final EditDirectoryStatus status;

  final BaseDirectoryModel? selectedDirectory;

  final AllFilesModel? allFilesModel;

  final EditDirectoryAllFileStatus allFileStatus;

  final EditDirectoryAllFileSnackBarStatus allFileSnackBarStatus;

  final EditDirectoryAllDirectoryStatus allDirectoryStatus;

  @override
  List<Object?> get props => [
        status,
        selectedDirectory,
    allFilesModel,
    allFileStatus,
    allFileSnackBarStatus,
        allDirectoryStatus,
      ];

  EditDirectoryState copyWith({
    EditDirectoryStatus? status,
    BaseDirectoryModel? selectedDirectory,
    AllFilesModel? allFilesModel,
    EditDirectoryAllFileStatus? allFileStatus,
    EditDirectoryAllFileSnackBarStatus? allFileSnackBarStatus,
    EditDirectoryAllDirectoryStatus? allDirectoryStatus,
  }) =>
      EditDirectoryState(
        status: status ?? this.status,
        selectedDirectory: selectedDirectory ?? this.selectedDirectory,
        allFilesModel: allFilesModel ?? this.allFilesModel,
        allFileStatus: allFileStatus ?? this.allFileStatus,
        allFileSnackBarStatus: allFileSnackBarStatus ?? this.allFileSnackBarStatus,
        allDirectoryStatus: allDirectoryStatus ?? this.allDirectoryStatus,
      );
}

enum EditDirectoryStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllFileStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllFileSnackBarStatus {
  initial,
  success,
  error,
}

enum EditDirectoryAllDirectoryStatus {
  initial,
  success,
  alreadyExist,
  error,
}
