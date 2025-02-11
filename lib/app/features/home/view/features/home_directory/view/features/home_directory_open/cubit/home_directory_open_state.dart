import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
 import 'package:equatable/equatable.dart';

class HomeDirectoryOpenState with EquatableMixin {
  HomeDirectoryOpenState({
    this.status = HomeDirectoryOpenStatus.start,
    this.snackBarStatus = HomeDirectoryOpenSnackBarStatus.initial,
    this.allFileModel,
    this.pageLayoutModel,
  });

  final HomeDirectoryOpenStatus status;
  final HomeDirectoryOpenSnackBarStatus snackBarStatus;
  final AllFilesModel? allFileModel;
  final HomeDirectoryOpenPageLayoutModel? pageLayoutModel;

  @override
  List<Object?> get props => [
        status,
        snackBarStatus,
        allFileModel,
        pageLayoutModel,
      ];

  HomeDirectoryOpenState copyWith({
    HomeDirectoryOpenStatus? status,
    HomeDirectoryOpenSnackBarStatus? snackBarStatus,
    AllFilesModel? allFileModel,
    HomeDirectoryOpenPageLayoutModel? pageLayoutModel,
  }) =>
      HomeDirectoryOpenState(
        status: status ?? this.status,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
        allFileModel: allFileModel ?? this.allFileModel,
        pageLayoutModel: pageLayoutModel ?? this.pageLayoutModel,
      );
}

enum HomeDirectoryOpenStatus {
  start,
  initial,
  loading,
  error,
}

enum HomeDirectoryOpenSnackBarStatus {
  initial,
  deletedSuccess,
}
