import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:equatable/equatable.dart';

class SearchFavoriteDirectoryState with EquatableMixin {
  SearchFavoriteDirectoryState({
    this.status = SearchFavoriteDirectoryStatus.start,
    this.allFavoritesDirectoryModel,
    this.searchResultList,
  });

  final SearchFavoriteDirectoryStatus status;
  final AllFavoritesDirectoryModel? allFavoritesDirectoryModel;
  final List<FavoritesDirectoryModel?>? searchResultList;

  @override
  List<Object?> get props => [
        status,
        allFavoritesDirectoryModel,
        searchResultList,
      ];

  SearchFavoriteDirectoryState copyWith({
    SearchFavoriteDirectoryStatus? status,
    AllFavoritesDirectoryModel? allFavoritesDirectoryModel,
    List<FavoritesDirectoryModel?>? searchResultList,
  }) =>
      SearchFavoriteDirectoryState(
        status: status ?? this.status,
        allFavoritesDirectoryModel:
            allFavoritesDirectoryModel ?? this.allFavoritesDirectoryModel,
        searchResultList: searchResultList ?? this.searchResultList,
      );
}

enum SearchFavoriteDirectoryStatus {
  start,
  initial,
  loading,
  error,
}
