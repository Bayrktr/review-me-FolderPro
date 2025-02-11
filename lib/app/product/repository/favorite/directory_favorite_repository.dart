import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_favorites_directory_oparation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

class DirectoryFavoriteRepository {
  final AllFavoritesDirectoryOperation _allFavoritesDirectoryOperation =
      GetItManager.getIt<AllFavoritesDirectoryOperation>();

  Future<void> initDatabase() async {
    await _allFavoritesDirectoryOperation.start(
      AllFavoritesDirectoryModel.allFavoritesDirectoryKey,
    );
    final allFavoriteDirectoryModel = allFavoritesDirectoryModel;
    if (allFavoriteDirectoryModel == null) {
      await _createFirstAllFavoriteModel();
      await initDatabase();
    } else {}
  }

  Future<void> _createFirstAllFavoriteModel() async {
    await _allFavoritesDirectoryOperation.addOrUpdateItem(
      AllFavoritesDirectoryModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }

  Future<void> updateAllFavoriteDirectoryModel(AllFavoritesDirectoryModel? allFavoritesDirectoryModel) async{
    if(allFavoritesDirectoryModel == null) return;
    await _allFavoritesDirectoryOperation.addOrUpdateItem(allFavoritesDirectoryModel);
  }

  AllFavoritesDirectoryModel? get allFavoritesDirectoryModel =>
      _allFavoritesDirectoryOperation.getItem(
        AllFavoritesDirectoryModel.allFavoritesDirectoryKey,
      );
}
