import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/search_favorite_directory/bloc/search_favorite_directory_repository.dart';
import 'package:DocuSort/app/features/search_favorite_directory/bloc/search_favorite_directory_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFavoriteDirectoryCubit extends Cubit<SearchFavoriteDirectoryState> {
  SearchFavoriteDirectoryCubit() : super(SearchFavoriteDirectoryState());

  final TextEditingController _searchFavoriteController =
      TextEditingController();

  TextEditingController get searchFavoriteController =>
      _searchFavoriteController;

  final SearchFavoriteDirectoryRepository _searchFavoriteDirectoryRepository =
      SearchFavoriteDirectoryRepository();

  Future<void> initDatabase() async {
    await _searchFavoriteDirectoryRepository.initDatabase();
    final allFavoriteDirectory =
        _searchFavoriteDirectoryRepository.allFavoriteDirectoryModel;
    emit(
      state.copyWith(
        status: SearchFavoriteDirectoryStatus.initial,
        allFavoritesDirectoryModel: allFavoriteDirectory,
        searchResultList: allFavoriteDirectory?.allFavoritesDirectory,
      ),
    );
  }

  void updateFavoriteDirectoryController(String? value) {
    if (value == null) return;
    _searchFavoriteController.text = value;

    final directoryListResult = _favoriteDirectoryListResult(value);

    emit(
      state.copyWith(
        searchResultList: directoryListResult,
      ),
    );
  }

  List<FavoritesDirectoryModel?> _favoriteDirectoryListResult(
    String value,
  ) {
    final results =
        state.allFavoritesDirectoryModel!.allFavoritesDirectory.where(
      (model) {
        final directoryModel = model?.directoryModel;
        final name = directoryModel?.name;
        if (name == null) {
          return false;
        } else {
          return name.toLowerCase().contains(
                _searchFavoriteController.text.toLowerCase(),
              );
        }
      },
    ).toList();
    return results;
  }

  @override
  Future<void> close() {
    _searchFavoriteController.dispose();
    return super.close();
  }
}
