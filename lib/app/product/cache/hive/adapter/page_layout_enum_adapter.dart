import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:hive/hive.dart';

class PageLayoutEnumAdapter extends TypeAdapter<PageLayoutEnum> {
  @override
  final int typeId = 23;

  @override
  PageLayoutEnum read(BinaryReader reader) {
    return PageLayoutEnum.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, PageLayoutEnum obj) {
    writer.writeInt(obj.index);
  }
}
