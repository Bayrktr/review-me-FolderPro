import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/repository/cloud/cloud_file_repository.dart';

class PublicHomeDirectoryOpenRepository {
  PublicHomeDirectoryOpenRepository(this._directoryModel);

  final BaseDirectoryModel _directoryModel;

  final CloudFileRepository _cloudFileRepository = CloudFileRepository();

  Future<List<BaseFileModel?>> getFiles() async {
    return _cloudFileRepository.getFiles(
      fileKey: _directoryModel.fileListKey,
    );
  }
}
