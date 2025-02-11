import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

class SearchFileState with EquatableMixin {
  SearchFileState({
    this.status = SearchFileStatus.start,
    this.allFilesModel,
    this.searchResultList,
  });

  final SearchFileStatus status;
  final AllFilesModel? allFilesModel;
  final List<BaseFileModel?>? searchResultList;

  @override
  List<Object?> get props => [
        status,
    allFilesModel,
        searchResultList,
      ];

  SearchFileState copyWith({
    SearchFileStatus? status,
    AllFilesModel? allFilesModel,
    List<BaseFileModel?>? searchResultList,
  }) =>
      SearchFileState(
        status: status ?? this.status,
        allFilesModel:
        allFilesModel ?? this.allFilesModel,
        searchResultList: searchResultList ?? this.searchResultList,
      );
}

enum SearchFileStatus {
  start,
  initial,
  loading,
  error,
  finish,
}
