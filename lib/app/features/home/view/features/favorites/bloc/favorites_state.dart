import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

class FavoritesState with EquatableMixin {
  FavoritesState(
      {this.status = FavoritesStatus.start,
      this.allFavoritesDirectoryModel,
      this.recentFiles = const [],
      this.snackBarStatus = FavoriteSnackBarStatus.initial,});

  final FavoritesStatus status;
  final List<BaseFileModel?> recentFiles;
  final AllFavoritesDirectoryModel? allFavoritesDirectoryModel;
  final FavoriteSnackBarStatus snackBarStatus;

  @override
  List<Object?> get props => [
        status,
        recentFiles,
        allFavoritesDirectoryModel,
        snackBarStatus,
      ];

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<BaseFileModel?>? recentFiles,
    AllFavoritesDirectoryModel? allFavoritesDirectoryModel,
    FavoriteSnackBarStatus? snackBarStatus,
  }) =>
      FavoritesState(
        status: status ?? this.status,
        recentFiles: recentFiles ?? this.recentFiles,
        allFavoritesDirectoryModel:
            allFavoritesDirectoryModel ?? this.allFavoritesDirectoryModel,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
      );
}

enum FavoritesStatus {
  start,
  initial,
  loading,
  error,
}

enum FavoriteSnackBarStatus {
  initial,
  deletedSuccess,
}
