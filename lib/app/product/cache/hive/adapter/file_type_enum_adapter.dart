import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:hive/hive.dart';

class FileTypeEnumAdapter extends TypeAdapter<FileTypeEnum> {
  @override
  final int typeId = 20;

  @override
  FileTypeEnum read(BinaryReader reader) {
    return FileTypeEnum.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, FileTypeEnum obj) {
    writer.writeInt(obj.index);
  }
}
