import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/file_picker/allowed_extentions.dart';

class DetectFileTypeManager {
  DetectFileTypeManager({required this.filePath});

  final String filePath;

  FileTypeEnum? get getFileTypeEnum {
    final extention = filePath.split('.').last.toLowerCase();
    switch (extention) {
      case AllowedExtention.pdf:
        return FileTypeEnum.pdf;
      default:
        return null;
    }
  }
}
