import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/model/pdf/public_pdf/public_pdf_model.dart';
import 'package:DocuSort/app/product/converter/file_type_converter.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';

abstract class BaseFileModel {
  factory BaseFileModel.fromJson(Map<String, dynamic> json) {
    final fileType = json['fileType'] as String?;
    final fileTypeEnum = FileTypeConverter(fileType).toFileTypeEnum;

    switch (fileTypeEnum) {
      case FileTypeEnum.pdf:
        return PublicPdfModel().fromJson(json);
      default:
        throw UnsupportedError('Unsupported file type: $fileType');
    }
  }


  String? get id;

  String? get name;

  FileTypeEnum? get fileTypeEnum;

  String? get fileType;

  Map<String, dynamic> toJson();

  BaseFileModel copyWith({
    String? id,
    String? name,
  });


}


