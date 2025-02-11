import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'pdf_model.g.dart';

@HiveType(typeId: 2)
class PdfModel extends Equatable with HiveModelMixin implements BaseFileModel {
  PdfModel({
    this.id,
    this.name,
    this.fileTypeEnum,
    this.byte,
  });

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final FileTypeEnum? fileTypeEnum;
  @HiveField(3)
  final Uint8List? byte;

  @override
  String get key => id.toString();

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'fileTypeEnum': fileTypeEnum?.name,
      'byte': null,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        fileTypeEnum,
        byte,
      ];

  @override
  PdfModel copyWith({
    String? id,
    String? name,
    String? fileListKey,
    FileTypeEnum? fileTypeEnum,
  }) {
    return PdfModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fileTypeEnum: fileTypeEnum ?? this.fileTypeEnum,
      byte: byte,
    );
  }

  @override
  String? get fileType => fileTypeEnum?.name;
}

/*
@freezed
@HiveType(typeId: 2)
class PdfModel extends FileExtendBaseModel<PdfModel>
    with _$PdfModel, HiveModelMixin{
  factory PdfModel({
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) FileTypeEnum? fileTypeEnum,
    @HiveField(4) @Uint8ListConverter() Uint8List? byte,
  }) = _PdfModel;

  factory PdfModel.fromJson(Map<String, dynamic> json) =>
      _$PdfModelFromJson(json);

  PdfModel._();

  @override
  PdfModel fromJson(Map<String, dynamic> json) => PdfModel.fromJson(json);

  @override
  String get key => id.toString();
}


 */
