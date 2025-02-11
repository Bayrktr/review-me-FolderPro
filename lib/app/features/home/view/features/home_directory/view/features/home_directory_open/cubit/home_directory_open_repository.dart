import 'package:DocuSort/app/product/cache/hive/operation/home_directory_open_page_layout_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

class HomeDirectoryOpenRepository {
  HomeDirectoryOpenRepository(this._fileListKey);

  final String? _fileListKey;

  String? get fileListKey => _fileListKey;

  final HomeDirectoryOpenPageLayoutOperation
      _homeDirectoryOpenPageLayoutOperation =
      GetItManager.getIt<HomeDirectoryOpenPageLayoutOperation>();

  Future<void> initDatabase() async {
    await _homeDirectoryOpenPageLayoutOperation.start(
      HomeDirectoryOpenPageLayoutModel.homeDirectoryOpenLayoutKey,
    );

    final model = homeDirectoryOpenPageLayoutModel;

    if (model == null) {
      model == null ? await createFirstLayoutModel() : null;
      await initDatabase();
    }
  }

  Future<void> updateLayout(
      HomeDirectoryOpenPageLayoutModel layoutModel,) async {
    await _homeDirectoryOpenPageLayoutOperation.addOrUpdateItem(layoutModel);
  }

  Future<void> createFirstLayoutModel() async {
    await _homeDirectoryOpenPageLayoutOperation.addOrUpdateItem(
      HomeDirectoryOpenPageLayoutModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }

  HomeDirectoryOpenPageLayoutModel? get homeDirectoryOpenPageLayoutModel =>
      _homeDirectoryOpenPageLayoutOperation.getItem(
        HomeDirectoryOpenPageLayoutModel.homeDirectoryOpenLayoutKey,
      );
}
