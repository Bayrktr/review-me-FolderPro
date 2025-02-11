import 'package:DocuSort/app/product/cache/hive/operation/recent_files_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/recent_files/recent_files_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

class RecentFilesRepository {
  final RecentFilesOperation _recentFilesRepository =
      GetItManager.getIt<RecentFilesOperation>();

  final String key = RecentFilesModel.recentFilesKey;

  Future<void> initDatabase() async {
    await _recentFilesRepository.start(key);

    if (recentFilesModel == null) {
      await _createFirstModel();
    }
  }

  Future<void> addNewFileToRecentFiles(BaseFileModel? fileModel) async {
    if (fileModel == null) return;
    final mutableRecentFiles =
        List<BaseFileModel>.from(recentFilesModel!.allRecentFiles)
          ..insert(0, fileModel);

    await _recentFilesRepository.addOrUpdateItem(
      recentFilesModel!.copyWitb(
        allRecentFiles: mutableRecentFiles,
      ),
    );
  }

  Future<void> updateRecentFiles(RecentFilesModel recentFilesModel) async {
    await _recentFilesRepository.addOrUpdateItem(recentFilesModel);
  }

  Future<void> _createFirstModel() async {
    await _recentFilesRepository.addOrUpdateItem(
      RecentFilesModel(
        id: IdGenerator.randomStringId,
      ),
    );
  }

  RecentFilesModel? get recentFilesModel => _recentFilesRepository.getItem(key);
}
