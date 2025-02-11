import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/layouts/home_directory_list_layout.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/layouts/home_directory_symbol_layout.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/show_modal/home_directory_choose_layout_show_model_sheet.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/snack_bar/home_directory_snack_bar.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_directory_mixin.dart';

@RoutePage()
class HomeDirectoryView extends StatelessWidget {
  const HomeDirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(DirectoryAddRoute());
        },
        heroTag: HeroTags.directoryAdd,
        child: const Icon(Icons.add),
      ),

       */
      body: BlocConsumer<HomeDirectoryCubit, HomeDirectoryState>(
        listener: (context, state) {
          if (state.snackBarStatus ==
              HomeDirectorySnackBarStatus.deletedSuccess) {
            HomeDirectorySnackBar(
              message: LocaleKeys.home_directoryDeletedSuccessfully.lang.tr,
              duration: const Duration(seconds: 1),
            ).show(context);
          }

          switch (state.favoriteSnackBarStatus) {
            case HomeDirectoryFavoriteStatus.initial:
              break;
            case HomeDirectoryFavoriteStatus.addedSuccess:
              context.read<FavoritesCubit>().updateFavoriteDirectorys(
                    state.allFavoritesDirectoryModel,
                  );
              HomeDirectorySnackBar(
                message: LocaleKeys.favorites_addedFavorite.lang.tr,
                duration: const Duration(seconds: 1),
              ).show(context);
            case HomeDirectoryFavoriteStatus.couldNotAdded:
              HomeDirectorySnackBar(
                color: Colors.redAccent,
                message: LocaleKeys.favorites_alreadyAddedFavorite.lang.tr,
                duration: const Duration(seconds: 1),
              ).show(context);
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case HomeDirectoryStatus.initial:
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.widthNormalValue,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (contextSecond) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<HomeDirectoryCubit>(
                                      context,),
                                  child:
                                      const HomeDirectoryChooseLayoutShowModelSheet(),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            state
                                .pageLayoutModel!.pageLayoutEnum.pageLayoutIcon,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: switch (state.pageLayoutModel?.pageLayoutEnum) {
                        PageLayoutEnum.list => HomeDirectoryListLayout(
                            allDirectoryModel: state.allDirectory,
                          ),
                        PageLayoutEnum.symbol => HomeDirectorySymbolLayout(
                            allDirectoryModel: state.allDirectory,
                          ),
                        null => const SizedBox(),
                      },
                    ),
                  ],
                ),
              );

            case HomeDirectoryStatus.error:
              return const Center(
                child: LocaleText(
                  text: LocaleKeys.errors_nullErrorMessage,
                ),
              );

            case HomeDirectoryStatus.loading:
              return _getCircularProgressIndicator(context: context);
            case HomeDirectoryStatus.start:
              return _getCircularProgressIndicator(context: context);
          }
        },
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: context.sized.dynamicWidth(0.4),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: LocaleText(
        text: LocaleKeys.home_internalStorage,
        textStyle: context.theme.getTextStyle.headline1,
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.router.push(DirectoryAddRoute());
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
        IconButton(
          onPressed: () {
            context.router.push(
              const SearchDirectoryRoute(),
            );
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }

  Widget _getCircularProgressIndicator({required BuildContext context}) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
