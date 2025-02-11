import 'package:DocuSort/app/product/cache/hive/import.dart';
import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

part 'all_files_model.g.dart';


@HiveType(typeId: 7)
class AllFilesModel extends Equatable with HiveModelMixin {
  AllFilesModel({this.id, this.allFiles = const []});

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final List<BaseFileModel?> allFiles;

  @override
  String get key => id.toString();

  @override
  List<Object?> get props => [
        id,
        allFiles,
      ];

  AllFilesModel copyWith({String? id, List<BaseFileModel?>? allFiles}) =>
      AllFilesModel(
        id: id ?? this.id,
        allFiles: allFiles ?? this.allFiles,
      );
}
