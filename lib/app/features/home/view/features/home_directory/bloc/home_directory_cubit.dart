import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_repository.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_page_layout_operation.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:DocuSort/app/product/repository/favorite/directory_favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_directory_cubit_mixin.dart';

class HomeDirectoryCubit extends Cubit<HomeDirectoryState>
    with _HomeDirectoryCubitMixin {
  HomeDirectoryCubit() : super(HomeDirectoryState());

  final HomeDirectoryRepository _homeDirectoryRepository =
      HomeDirectoryRepository();

  final DirectoryFavoriteRepository _favoriteRepository = DirectoryFavoriteRepository();

  final HomeDirectoryPageLayoutOperation _homeDirectoryPageLayoutOperation =
      GetItManager.getIt<HomeDirectoryPageLayoutOperation>();

  void resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectorySnackBarStatus.initial,
      ),
    );
  }

  Future<void> initDatabase() async {
    await _homeDirectoryRepository.initDatabase();
    await _favoriteRepository.initDatabase();

    updateAllDirectoryState(_homeDirectoryRepository.allDirectoryModel);
    _updateHomeLayoutState(_homeDirectoryRepository.pageLayoutModel);
  }



  void updateAllDirectoryState(
    AllDirectoryModel? allDirectory, {
    bool isUpdate = true,
  }) {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        allDirectory: isUpdate ? allDirectory : null,
      ),
    );
  }

  void updateHomeLayout(PageLayoutEnum? layoutEnum) {
    if (layoutEnum == null) return;
    _homeDirectoryPageLayoutOperation.addOrUpdateItem(
      state.pageLayoutModel!.copyWith(
        pageLayoutEnum: layoutEnum,
      ),
    );
    final newPageLayoutModel = state.pageLayoutModel!.copyWith(
      pageLayoutEnum: layoutEnum,
    );

    emit(
      state.copyWith(
        pageLayoutModel: newPageLayoutModel,
      ),
    );
  }

  void _updateHomeLayoutState(HomeDirectoryPageLayoutModel? layoutModel) {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        pageLayoutModel: layoutModel,
      ),
    );
  }

  Future<void> deleteDirectoryFromAllDirectory(
    BaseDirectoryModel? directoryModel,
  ) async {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.loading,
      ),
    );

    if (state.allDirectory?.allDirectory == null) {
      emit(
        state.copyWith(
          status: HomeDirectoryStatus.error,
        ),
      );
      return;
    }

    final copyAllDirectory =
        List<DirectoryModel>.from(state.allDirectory!.allDirectory);

    copyAllDirectory.removeWhere(
      (dir) => dir.id == directoryModel?.id,
    );

    final newAllDirectoryModel = state.allDirectory!.copyWith(
      allDirectory: copyAllDirectory,
    );

    await _homeDirectoryRepository
        .updateAllDirectoryModel(newAllDirectoryModel);

    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        allDirectory: newAllDirectoryModel,
        snackBarStatus: HomeDirectorySnackBarStatus.deletedSuccess,
      ),
    );
    resetSnackBarStatus();
  }

  Future<void> addToFavorite(BaseDirectoryModel directoryModel) async {
    final allFavoritesDirectoryModel =
        _favoriteRepository.allFavoritesDirectoryModel;
    if (allFavoritesDirectoryModel == null) {
    } else {
      if (!isAlreadyExist(
        allFavoritesDirectoryModel.allFavoritesDirectory,
        directoryModel,
      )) {
        final favoritesDirectoryModel = FavoritesDirectoryModel(
          id: IdGenerator.randomIntId,
          addedTime: DateTime.now(),
          directoryModel: directoryModel,
        );
        final updatedList = <FavoritesDirectoryModel?>[
          favoritesDirectoryModel,
          ...allFavoritesDirectoryModel.allFavoritesDirectory.where(
            (model) => model?.id != favoritesDirectoryModel.id,
          ),
        ];
        final newAllFavoritesDirectoryModel =
            allFavoritesDirectoryModel.copyWith(
          allFavoritesDirectory: updatedList,
        );
        await _favoriteRepository
            .updateAllFavoriteDirectoryModel(newAllFavoritesDirectoryModel);
        emit(
          state.copyWith(
            allFavoritesDirectoryModel: newAllFavoritesDirectoryModel,
            favoriteSnackBarStatus: HomeDirectoryFavoriteStatus.addedSuccess,
          ),
        );
      } else {
        emit(
          state.copyWith(
            favoriteSnackBarStatus: HomeDirectoryFavoriteStatus.couldNotAdded,
          ),
        );
      }
      _resetFavoriteSnackBarStatus();
    }
  }

  void _resetFavoriteSnackBarStatus() {
    emit(
      state.copyWith(
        favoriteSnackBarStatus: HomeDirectoryFavoriteStatus.initial,
      ),
    );
  }

  bool isAlreadyFavorite(BaseDirectoryModel? directoryModel) {
    if (directoryModel == null) return false;
    final isAlreadyExist = _favoriteRepository
        .allFavoritesDirectoryModel!.allFavoritesDirectory
        .any((element) {
      final item = element?.directoryModel?.id;
      if (item == null) return true;
      return element?.directoryModel?.id == directoryModel.id;
    });
    return isAlreadyExist;
  }
}
