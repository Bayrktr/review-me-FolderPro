import 'package:DocuSort/app/product/enum/file_type_enum.dart';

abstract class BaseDirectoryModel {
  factory BaseDirectoryModel.fromJson(Map<String, dynamic> e) {
    throw UnimplementedError();
  }

  String? get id;

  String? get name;

  String? get fileListKey;

  FileTypeEnum? get fileTypeEnum;

  Map<String, dynamic> toJson();

  BaseDirectoryModel copyWith({
    String? id,
    String? name,
    String? fileListKey,
    FileTypeEnum? fileTypeEnum,
  });
}
