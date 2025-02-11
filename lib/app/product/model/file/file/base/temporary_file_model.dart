import 'package:DocuSort/app/product/converter/file_type_converter.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class TemporaryFileModel extends Equatable
    with BaseFirebaseModel<TemporaryFileModel>
    implements BaseFileModel {
  TemporaryFileModel({
    this.name,
    this.filePath,
    this.fileKey,
    this.id,
    this.fileType,
  });

  @override
  final String? id;
  @override
  final String? name;
  final String? filePath;
  final String? fileKey;
  @override
  final String? fileType;

  @override
  TemporaryFileModel fromJson(Map<String, dynamic> json) {
    return TemporaryFileModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        filePath: json['filePath'] as String?,
        fileKey: json['fileKey'] as String?,
        fileType: json['fileType'] as String?,);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'filePath': filePath,
      'fileKey': fileKey,
      'fileType': fileType,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        filePath,
        fileKey,
      ];

  @override
  BaseFileModel copyWith({String? id, String? name}) {
    return TemporaryFileModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  FileTypeEnum? get fileTypeEnum => FileTypeConverter(fileType).toFileTypeEnum;
}
