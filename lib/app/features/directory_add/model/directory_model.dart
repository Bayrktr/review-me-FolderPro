import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


part 'directory_model.g.dart';


@HiveType(typeId: 1)
class DirectoryModel with HiveModelMixin implements BaseDirectoryModel {
  const DirectoryModel({
    this.id,
    this.name,
    this.fileListKey,
    this.tagColor,
    this.fileTypeEnum,
  });

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? fileListKey;
  @HiveField(3)
  final Color? tagColor;
  @override
  @HiveField(4)
  final FileTypeEnum? fileTypeEnum;

  @override
  BaseDirectoryModel copyWith({
    String? id,
    String? name,
    String? fileListKey,
    Color? tagColor,
    FileTypeEnum? fileTypeEnum,
  }) =>
      DirectoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        fileListKey: fileListKey ?? this.fileListKey,
        tagColor: tagColor ?? this.tagColor,
        fileTypeEnum: fileTypeEnum ?? this.fileTypeEnum,
      );

  @override
  String get key => id.toString();

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'fileListKey': fileListKey,
      'tagColor': tagColor.toString(),
      'fileTypeEnum': fileTypeEnum?.name,
    };
  }
}
