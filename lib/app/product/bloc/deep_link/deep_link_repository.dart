

import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/product/repository/cloud/cloud_file_repository.dart';

class DeepLinkRepository{
  final CloudFileRepository _cloudFileRepository = CloudFileRepository();

  Future<PublicDirectoryModel?> getDirectory(String? directoryId) async {
    return _cloudFileRepository.getDirectory(
      directoryId: directoryId,
    );
  }


}