import 'package:DocuSort/app/product/converter/file_type_converter.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class PublicDirectoryModel extends Equatable
    with BaseFirebaseModel<PublicDirectoryModel>, IdModel
    implements BaseDirectoryModel {
  const PublicDirectoryModel({
    this.name,
    this.fileListKey,
    this.fileType,
    this.tagColor,
    this.id,
  });

  @override
  final String? name;
  @override
  final String? fileListKey;
  final String? fileType;
  final String? tagColor;

  @override
  final String? id;

  @override
  PublicDirectoryModel fromJson(Map<String, dynamic> json) {
    return PublicDirectoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      fileListKey: json['fileListKey'] as String?,
      fileType: json['fileType'] as String?,
      tagColor: json['tagColor'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        name,
        fileListKey,
        fileType,
        tagColor,
        id,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fileListKey': fileListKey,
      'fileType': fileType,
      'tagColor': tagColor,
      'id': id,
    };
  }

  @override
  FileTypeEnum? get fileTypeEnum => FileTypeConverter(fileType).toFileTypeEnum;

  @override
  BaseDirectoryModel copyWith({
    String? id,
    String? name,
    String? fileListKey,
    FileTypeEnum? fileTypeEnum,
    String? tagColor,
  }) {
    return PublicDirectoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fileListKey: fileListKey ?? this.fileListKey,
      fileType: fileType,
      tagColor: tagColor ?? this.tagColor,
    );
  }
}
