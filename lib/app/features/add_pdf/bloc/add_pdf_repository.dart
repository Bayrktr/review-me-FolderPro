import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_files_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';

abstract class IAddPdfRepository {
  String? get fileListKey;

  Future<void> start();

  Future<void> createFirstModel();

  Future<void> updateAllPdfModel(AllFilesModel newPdfModel);

  AllFilesModel? get getAllPdfModel;
}

class AddPdfRepository extends IAddPdfRepository {
  AddPdfRepository(this._fileListKey);

  final String? _fileListKey;

  @override
  String? get fileListKey => _fileListKey;

  final AllFilesOperation _allFilesOperation =
      GetItManager.getIt<AllFilesOperation>();

  @override
  Future<void> start() async {
    await _allFilesOperation.start(_fileListKey.toString());
  }

  @override
  Future<void> createFirstModel() async {
    await _allFilesOperation.addOrUpdateItem(
      AllFilesModel(
        id: fileListKey,
      ),
    );
  }

  @override
  AllFilesModel? get getAllPdfModel {
    return _allFilesOperation.getItem(fileListKey.toString());
  }

  @override
  Future<void> updateAllPdfModel(AllFilesModel newPdfModel) async {
    await _allFilesOperation.addOrUpdateItem(newPdfModel);
  }
}
