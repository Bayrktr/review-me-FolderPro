import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_page_layout_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

class HomeDirectoryRepository {
  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final HomeDirectoryPageLayoutOperation _homeDirectoryPageLayoutOperation =
      GetItManager.getIt<HomeDirectoryPageLayoutOperation>();


  AllDirectoryModel? get allDirectoryModel =>
      _allDirectoryOperation.getItem(AllDirectoryModel.allDirectoryKey);

  HomeDirectoryPageLayoutModel? get pageLayoutModel =>
      _homeDirectoryPageLayoutOperation
          .getItem(HomeDirectoryPageLayoutModel.homeDirectoryLayoutKey);

  Future<void> initDatabase() async {
    await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);
    await _homeDirectoryPageLayoutOperation.start(
      HomeDirectoryPageLayoutModel.homeDirectoryLayoutKey,
    );

    final allDirectory = allDirectoryModel;

    final homeDirectoryLayout = pageLayoutModel;

    if (allDirectory == null || homeDirectoryLayout == null) {
      allDirectory == null ? await _createFirstAllDirectory() : null;
      homeDirectoryLayout == null ? await _createFirstHomePageLayout() : null;
      await initDatabase();
    }
  }

  Future<void> updateAllDirectoryModel(
    AllDirectoryModel? newAllDirectoryModel,
  ) async {
    if (newAllDirectoryModel == null) return;
    await _allDirectoryOperation.addOrUpdateItem(newAllDirectoryModel);
  }

  Future<void> updatePageLayout(
    HomeDirectoryPageLayoutModel? newPageLayoutModel,
  ) async {
    if (newPageLayoutModel == null) return;
    await _homeDirectoryPageLayoutOperation.addOrUpdateItem(newPageLayoutModel);
  }

  Future<void> _createFirstHomePageLayout() async {
    await _homeDirectoryPageLayoutOperation.addOrUpdateItem(
      HomeDirectoryPageLayoutModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }

  Future<void> _createFirstAllDirectory() async {
    await _allDirectoryOperation.addOrUpdateItem(
      AllDirectoryModel(
        id: IdGenerator.randomIntId,
        allDirectory: [],
      ),
    );
  }

}
