import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_repository.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/layouts/home_directory_open_list_layout.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/layouts/home_directory_open_symbol_layout.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/show_modal/home_directory_open_app_bar_show_modal_sheet.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/snack_bar/home_directory_open_snack_bar.dart';
import 'package:DocuSort/app/product/component/form_field/custom_search_field.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/constant/hero_tags.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_directory_open_mixin.dart';

@RoutePage()
class HomeDirectoryOpenView extends StatelessWidget
    with _HomeDirectoryOpenMixin {
  const HomeDirectoryOpenView({
    super.key,
    this.directoryModel,
  });

  final BaseDirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    if (nullCheck(directoryModel)) return const SizedBox();

    return BlocProvider(
      create: (_) => HomeDirectoryOpenCubit(
        directoryModel?.fileListKey,
        directoryModel!.fileTypeEnum!,
        PdfRepository(
          directoryModel!.fileListKey,
        ),
        HomeDirectoryOpenRepository(
          directoryModel?.fileListKey,
        ),
      )..initDatabase(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: _getAppBar(
              context: context,
              directoryModel: directoryModel,
            ),
            body: BlocConsumer<HomeDirectoryOpenCubit, HomeDirectoryOpenState>(
              builder: (context, state) {
                switch (state.status) {
                  case HomeDirectoryOpenStatus.start:
                    return _getCircularProgress(context: context);
                  case HomeDirectoryOpenStatus.initial:
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sized.widthNormalValue,
                      ),
                      child: Column(
                        //      context.router.push(
                        //                                 SearchFileRoute(
                        //                                   directoryModel: directoryModel,
                        //                                 ),
                        //                               );
                        children: [
                          CustomSearchField(
                            text: LocaleKeys.home_searchFile.lang.tr,
                            callBack: () {
                              context.router.push(
                                SearchFileRoute(
                                  directoryModel: directoryModel,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: switch (
                                state.pageLayoutModel?.pageLayoutEnum) {
                              null => const SizedBox(),
                              PageLayoutEnum.list =>
                                HomeDirectoryOpenListLayout(
                                  directoryModel: directoryModel,
                                  allFilesModel: state.allFileModel,
                                ),
                              PageLayoutEnum.symbol =>
                                HomeDirectoryOpenSymbolLayout(
                                  allFilesModel: state.allFileModel,
                                  directoryModel: directoryModel,
                                ),
                            },
                          ),
                        ],
                      ),
                    );
                  case HomeDirectoryOpenStatus.loading:
                    return _getCircularProgress(context: context);
                  case HomeDirectoryOpenStatus.error:
                    return const LocaleText(
                      text: LocaleKeys.errors_nullErrorMessage,
                    );
                }
              },
              listener: (context, state) {
                switch (state.snackBarStatus) {
                  case HomeDirectoryOpenSnackBarStatus.initial:
                    return;
                  case HomeDirectoryOpenSnackBarStatus.deletedSuccess:
                    HomeDirectoryOpenSnackBar(
                      message: LocaleKeys
                          .editDirectory_pdfDeletedSuccessfully.lang.tr,
                      color: Colors.lightGreen,
                    ).show(context);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getCircularProgress({required BuildContext context}) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
    BaseDirectoryModel? directoryModel,
  }) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          context.router.maybePop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        _getAppBarTitle(directoryModel),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.router.push(
              _getNavigatePageRoute(
                directoryModel,
              ),
            );
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
        BlocBuilder<HomeDirectoryOpenCubit, HomeDirectoryOpenState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contextSecond) {
                    return BlocProvider.value(
                      value: BlocProvider.of<HomeDirectoryOpenCubit>(context),
                      child: HomeDirectoryOpenAppBarShowModalSheet(
                        directoryModel: directoryModel,
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert),
            );
          },
        ),
      ],
    );
  }

  FloatingActionButton _getFloatingActionButton({
    required BuildContext context,
    required BaseDirectoryModel directoryModel,
  }) {
    return FloatingActionButton(
      onPressed: () {
        context.router.push(
          _getNavigatePageRoute(
            directoryModel,
          ),
        );
      },
      heroTag: HeroTags.addFile,
      child: const Icon(Icons.add),
    );
  }

  PageRouteInfo<dynamic> _getNavigatePageRoute(
      BaseDirectoryModel? directoryModel,) {
    switch (directoryModel?.fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return AddPdfRoute(
          directoryModel: directoryModel,
        );
    }
  }

  String _getAppBarTitle(BaseDirectoryModel? directoryModel) {
    if (directoryModel is DirectoryModel) {
      return directoryModel.name?.general.capitalize ?? '';
    } else {
      return '';
    }
  }
}
