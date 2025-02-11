import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:equatable/equatable.dart';

class SearchDirectoryState with EquatableMixin {
  SearchDirectoryState({
    this.status = SearchDirectoryStatus.start,
    this.allDirectoryModel,
    this.searchResultList,
  });

  final SearchDirectoryStatus status;
  final AllDirectoryModel? allDirectoryModel;
  final List<BaseDirectoryModel?>? searchResultList;

  @override
  List<Object?> get props => [
        status,
        allDirectoryModel,
        searchResultList,
      ];

  SearchDirectoryState copyWith({
    SearchDirectoryStatus? status,
    AllDirectoryModel? allDirectoryModel,
    List<BaseDirectoryModel?>? searchResultList,
  }) =>
      SearchDirectoryState(
        status: status ?? this.status,
        allDirectoryModel: allDirectoryModel ?? this.allDirectoryModel,
        searchResultList: searchResultList ?? this.searchResultList,
      );
}

enum SearchDirectoryStatus {
  start,
  initial,
  loading,
  error,
  finish,
}
