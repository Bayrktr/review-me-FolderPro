import 'package:DocuSort/app/product/cache/hive/import.dart';
import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/converter/file_type_converter.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

part 'public_pdf_model.g.dart';

@HiveType(typeId: 100)
class PublicPdfModel extends Equatable
    with BaseFirebaseModel<PublicPdfModel>, IdModel, HiveModelMixin
    implements BaseFileModel {
  PublicPdfModel({
    this.id,
    this.name,
    this.fileType,
    this.filePath,
    this.fileKey,
  });

  @override
  PublicPdfModel fromJson(Map<String, dynamic> json) {
    return PublicPdfModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      fileType: json['fileType'] as String?,
      filePath: json['filePath'] as String?,
      fileKey: json['fileKey'] as String?,
    );
  }

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? fileType;
  @HiveField(2)
  final String? filePath;
  @HiveField(3)
  final String? fileKey;

  @override
  @HiveField(4)
  final String? id;

  @override
  List<Object?> get props => [
        id,
        name,
        fileType,
        filePath,
        fileKey,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'fileType': fileType,
      'filePath': filePath,
      'fileKey': fileKey,
    };
  }

  @override
  BaseFileModel copyWith({
    String? id,
    String? name,
    String? fileListKey,
    FileTypeEnum? fileTypeEnum,
    String? fileType,
    String? filePath,
    String? fileKey,
  }) {
    return PublicPdfModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fileType: fileType ?? this.fileType,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  FileTypeEnum? get fileTypeEnum => FileTypeConverter(fileType).toFileTypeEnum;

  @override
  String get key => id.toString();
}
