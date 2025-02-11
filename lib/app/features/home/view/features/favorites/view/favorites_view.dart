import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_state.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/favorite_directory/favorite_directory_item.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/recent_files/recent_files_item.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/snack_bar/favorite_snack_bar.dart';
import 'package:DocuSort/app/product/component/form_field/custom_search_field.dart';
import 'package:DocuSort/app/product/component/logo/app_logo.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/manager/getIt/import.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const AppLogo(),
          ),
          body: switch (state.status) {
            FavoritesStatus.start =>
              _getCircularProgressIndicator(context: context),
            FavoritesStatus.initial => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomSearchField(
                      text: LocaleKeys.home_searchFolder.lang.tr,
                      callBack: () {
                        context.router.push(const SearchDirectoryRoute());
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sized.widthNormalValue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.sized.widthMediumValue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LocaleText(
                                    text: LocaleKeys.favorites_favorites,
                                    textStyle: context
                                        .theme.getTextStyle.mediumBodyText1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: LocaleText(
                                      text: LocaleKeys.general_seeAll,
                                      textStyle: context
                                          .theme.getTextStyle.mediumBodyText1,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.getColor.focusColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 40,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _getFavoriteItemCount(
                                state.allFavoritesDirectoryModel
                                    ?.allFavoritesDirectory,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final item = state.allFavoritesDirectoryModel
                                    ?.allFavoritesDirectory[index];

                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: FavoriteDirectoryItem(
                                    favoriteDirectoryModel: item,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sized.widthMediumValue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LocaleText(
                                  text: LocaleKeys.favorites_recentFiles,
                                  textStyle: context
                                      .theme.getTextStyle.mediumBodyText1,
                                  fontWeight: FontWeight.bold,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: LocaleText(
                                    text: LocaleKeys.general_seeAll,
                                    textStyle: context
                                        .theme.getTextStyle.mediumBodyText1,
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.getColor.focusColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 40,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _getRecentFileItemCount(
                                state.recentFiles,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final item = state.recentFiles[index];
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: RecentFilesItem(
                                    recentFile: item,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            FavoritesStatus.loading =>
              _getCircularProgressIndicator(context: context),
            FavoritesStatus.error =>
              _getCircularProgressIndicator(context: context),
          },
        );
      },
      listener: (context, state) {
        switch (state.snackBarStatus) {
          case FavoriteSnackBarStatus.initial:
            break;
          case FavoriteSnackBarStatus.deletedSuccess:
            FavoriteSnackBar(
              message: LocaleKeys.favorites_removedFromFavorites.lang.tr,
            ).show(context);
        }
      },
    );
  }

  Widget _getCircularProgressIndicator({required BuildContext context}) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _getBodySpace {
    return const Expanded(
      flex: 2,
      child: SizedBox(),
    );
  }

  int _getFavoriteItemCount(List<FavoritesDirectoryModel?>? directoryList) {
    if (directoryList == null) return 0;
    if (directoryList.length >= 2) {
      return 2;
    } else {
      return directoryList.length;
    }
  }

  int _getRecentFileItemCount(List<BaseFileModel?> recentFiles) {
    if (recentFiles.length >= 2) return 2;
    return recentFiles.length;
  }
}
