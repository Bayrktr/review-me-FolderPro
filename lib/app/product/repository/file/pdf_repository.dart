import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_files_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';

abstract class IPdfRepository {
  String? get fileListKey;

  Future<void> start();

  Future<void> createFirstModel();

  Future<void> deletePdfFromDirectory(AllFilesModel newPdfModel);

  Future<void> updateAllPdfModel(AllFilesModel newPdfModel);

  AllFilesModel? getAllPdfModel();
}

class PdfRepository extends IPdfRepository {
  PdfRepository(this._fileListKey);

  final String? _fileListKey;

  final AllFilesOperation _allFilesOperation =
      GetItManager.getIt<AllFilesOperation>();

  @override
  String? get fileListKey => _fileListKey;

  @override
  Future<void> createFirstModel() async {
    await _allFilesOperation.addOrUpdateItem(
      AllFilesModel(
        id: fileListKey,
      ),
    );
  }

  @override
  Future<void> deletePdfFromDirectory(AllFilesModel newAllFilesModel) async {
    await _allFilesOperation.addOrUpdateItem(
      newAllFilesModel,
    );
  }

  @override
  AllFilesModel? getAllPdfModel() {
    return _allFilesOperation.getItem(fileListKey.toString());
  }

  @override
  Future<void> start() async {
    await _allFilesOperation.start(fileListKey.toString());
  }

  @override
  Future<void> updateAllPdfModel(AllFilesModel newAllFilesModel) async {
    await _allFilesOperation.addOrUpdateItem(newAllFilesModel);
  }
}
