import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_state.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/product/bloc/recent_files/recent_files_repository.dart';
import 'package:DocuSort/app/product/repository/favorite/directory_favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState());

  final DirectoryFavoriteRepository _favoriteRepository =
      DirectoryFavoriteRepository();

  final RecentFilesRepository _recentFilesRepository = RecentFilesRepository();

  Future<void> initDatabase() async {
    await _favoriteRepository.initDatabase();
    await _recentFilesRepository.initDatabase();
    final recentFilesModel = _recentFilesRepository.recentFilesModel;

    emit(
      state.copyWith(
        status: FavoritesStatus.initial,
        allFavoritesDirectoryModel:
            _favoriteRepository.allFavoritesDirectoryModel,
        recentFiles: recentFilesModel!.allRecentFiles,
      ),
    );
  }

  Future<void> deleteFavoriteDirectory(
      FavoritesDirectoryModel favoriteDirectory,) async {
    final allFavoriteDirectoryModel = state.allFavoritesDirectoryModel;
    if (allFavoriteDirectoryModel == null) return;
    final List<FavoritesDirectoryModel?> mutableList =
        List<FavoritesDirectoryModel>.from(
      allFavoriteDirectoryModel.allFavoritesDirectory,
    );
    final remove = mutableList.remove(favoriteDirectory);
    final newAllFavoriteDirectoryModel = allFavoriteDirectoryModel.copyWith(
      allFavoritesDirectory: mutableList,
    );
    await _favoriteRepository
        .updateAllFavoriteDirectoryModel(newAllFavoriteDirectoryModel);
    emit(
      state.copyWith(
        allFavoritesDirectoryModel: newAllFavoriteDirectoryModel,
        snackBarStatus: FavoriteSnackBarStatus.deletedSuccess,
      ),
    );
    _resetSnackBarStatus();
  }

  void updateFavoriteDirectorys(
      AllFavoritesDirectoryModel? allFavoritesDirectoryModel,) {
    emit(
      state.copyWith(
        allFavoritesDirectoryModel: allFavoritesDirectoryModel,
      ),
    );
  }

  void _resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: FavoriteSnackBarStatus.initial,
      ),
    );
  }
}
