import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'recent_files_model.g.dart';

@HiveType(typeId: 98)
class RecentFilesModel extends Equatable with HiveModelMixin {
  RecentFilesModel({this.id, this.allRecentFiles = const []});

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final List<BaseFileModel?> allRecentFiles;

  @override
  List<Object?> get props => [
        id,
        allRecentFiles,
      ];

  @override
  String get key => recentFilesKey;

  static const String recentFilesKey = 'recentFilesKey';

  RecentFilesModel copyWitb(
          {String? id, List<BaseFileModel?>? allRecentFiles,}) =>
      RecentFilesModel(
        id: id ?? this.id,
        allRecentFiles: allRecentFiles ?? this.allRecentFiles,
      );
}
