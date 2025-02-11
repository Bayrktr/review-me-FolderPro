import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_favorites_directory_oparation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

abstract class ISearchFavoriteDirectoryRepository {
  Future<void> initDatabase();

  AllFavoritesDirectoryModel? get allFavoriteDirectoryModel;
}

class SearchFavoriteDirectoryRepository
    extends ISearchFavoriteDirectoryRepository {
  final AllFavoritesDirectoryOperation _allFavoritesDirectoryOperation =
      GetItManager.getIt<AllFavoritesDirectoryOperation>();

  @override
  AllFavoritesDirectoryModel? get allFavoriteDirectoryModel =>
      _allFavoritesDirectoryOperation.getItem(
        AllFavoritesDirectoryModel.allFavoritesDirectoryKey,
      );

  Future<void> _createFirstAllFavoriteDirectoryModel() async {
    await _allFavoritesDirectoryOperation.addOrUpdateItem(
      AllFavoritesDirectoryModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }

  @override
  Future<void> initDatabase() async {
    await _allFavoritesDirectoryOperation.start(
      AllFavoritesDirectoryModel.allFavoritesDirectoryKey,
    );
    final directoryModel = allFavoriteDirectoryModel;
    if (directoryModel == null) {
      directoryModel == null ? await _createFirstAllFavoriteDirectoryModel() : null;
    }
  }
}
