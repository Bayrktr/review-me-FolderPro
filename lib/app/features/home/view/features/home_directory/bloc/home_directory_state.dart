import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:equatable/equatable.dart';

class HomeDirectoryState with EquatableMixin {
  HomeDirectoryState({
    this.status = HomeDirectoryStatus.start,
    this.allDirectory,
    this.snackBarStatus = HomeDirectorySnackBarStatus.initial,
    this.favoriteSnackBarStatus = HomeDirectoryFavoriteStatus.initial,
    this.pageLayoutModel,
    this.allFavoritesDirectoryModel,
  });

  final HomeDirectoryStatus status;
  final AllDirectoryModel? allDirectory;
  final HomeDirectorySnackBarStatus snackBarStatus;
  final HomeDirectoryFavoriteStatus favoriteSnackBarStatus;
  final HomeDirectoryPageLayoutModel? pageLayoutModel;
  final AllFavoritesDirectoryModel? allFavoritesDirectoryModel;

  @override
  List<Object?> get props => [
        status,
        allDirectory,
        snackBarStatus,
        favoriteSnackBarStatus,
        pageLayoutModel,
        allFavoritesDirectoryModel,
      ];

  HomeDirectoryState copyWith({
    HomeDirectoryStatus? status,
    AllDirectoryModel? allDirectory,
    HomeDirectorySnackBarStatus? snackBarStatus,
    HomeDirectoryFavoriteStatus? favoriteSnackBarStatus,
    HomeDirectoryPageLayoutModel? pageLayoutModel,
    AllFavoritesDirectoryModel? allFavoritesDirectoryModel,
  }) =>
      HomeDirectoryState(
        status: status ?? this.status,
        allDirectory: allDirectory ?? this.allDirectory,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
        favoriteSnackBarStatus:
            favoriteSnackBarStatus ?? this.favoriteSnackBarStatus,
        pageLayoutModel: pageLayoutModel ?? this.pageLayoutModel,
        allFavoritesDirectoryModel:
            allFavoritesDirectoryModel ?? this.allFavoritesDirectoryModel,
      );
}

enum HomeDirectoryStatus {
  start,
  initial,
  error,
  loading,
}

enum HomeDirectorySnackBarStatus {
  initial,
  deletedSuccess,
}

enum HomeDirectoryFavoriteStatus { initial, addedSuccess, couldNotAdded }
