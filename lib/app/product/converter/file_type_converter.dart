import 'package:DocuSort/app/product/constant/file_types.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';

class FileTypeConverter {
  const FileTypeConverter(this._string);

  final String? _string;

  FileTypeEnum? get toFileTypeEnum {
    switch (_string) {
      case FileTypes.pdf:
        return FileTypeEnum.pdf;
      default:
        return null;
    }
  }
}
