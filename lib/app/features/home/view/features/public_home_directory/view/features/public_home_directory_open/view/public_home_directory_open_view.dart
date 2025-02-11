import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/bloc/public_home_directory_open_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/bloc/public_home_directory_open_repository.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/bloc/public_home_directory_open_state.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/view/component/public_home_directory_open_list_layout_item.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PublicHomeDirectoryOpenView extends StatelessWidget {
  const PublicHomeDirectoryOpenView({super.key, this.directoryModel});

  final BaseDirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    // fixme hata ekranı eklenmeli
    if (directoryModel == null) return const SizedBox();

    return BlocProvider(
      create: (_) => PublicHomeDirectoryOpenCubit(
        PublicHomeDirectoryOpenRepository(
          directoryModel!,
        ),
      )..init(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar:
                _getAppBar(context: context, directoryModel: directoryModel),
            body: BlocConsumer<PublicHomeDirectoryOpenCubit,
                PublicHomeDirectoryOpenState>(
              builder: (context, state) {
                switch (state.status) {
                  case PublicHomeDirectoryOpenStatus.start:
                    return _getCircularProgress;
                  case PublicHomeDirectoryOpenStatus.initial:
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sized.widthNormalValue,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.files.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = state.files[index];
                                return PublicHomeDirectoryOpenListLayoutItem(
                                  item: item,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  case PublicHomeDirectoryOpenStatus.loading:
                    return _getCircularProgress;
                  case PublicHomeDirectoryOpenStatus.error:
                    return const LocaleText(
                      text: LocaleKeys.errors_nullErrorMessage,
                    );
                }
              },
              listener: (context, state) {},
            ),
          );
        },
      ),
    );
  }

  Widget get _getCircularProgress {
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
            // fixme
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
        IconButton(
          onPressed: () {
            // fixme
          },
          icon: const Icon(
            Icons.search,
          ),
        )
      ],
    );
  }

  String _getAppBarTitle(BaseDirectoryModel? directoryModel) {
    if (directoryModel is DirectoryModel) {
      return directoryModel.name?.general.capitalize ?? '';
    } else if (directoryModel is PublicDirectoryModel) {
      return directoryModel.name?.general.capitalize ?? '';
    } else {
      return '';
    }
  }
}
