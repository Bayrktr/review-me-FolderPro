import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

class RecentFilesState with EquatableMixin {
  RecentFilesState({this.recentFiles = const []});

  final List<BaseFileModel?> recentFiles;

  @override
  List<Object?> get props => [recentFiles];

  RecentFilesState copyWith({List<BaseFileModel?>? recentFiles}) =>
      RecentFilesState(
        recentFiles: recentFiles ?? this.recentFiles,
      );
}
