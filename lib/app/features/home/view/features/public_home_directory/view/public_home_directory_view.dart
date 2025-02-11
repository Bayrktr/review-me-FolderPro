import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/bloc/public_home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/bloc/public_home_directory_state.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/component/layouts/public_home_directory_list_layout_item.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PublicHomeDirectoryView extends StatelessWidget {
  const PublicHomeDirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicHomeDirectoryCubit, PublicHomeDirectoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _getAppBar(context),
          body: switch (state.status) {
            PublicHomeDirectoryStatus.start => _getCircularProgressIndicator,
            PublicHomeDirectoryStatus.initial => Padding(
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.grid_4x4,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.allDirectory.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = state.allDirectory[index];

                          return PublicHomeDirectoryListLayoutItem(item: item);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            PublicHomeDirectoryStatus.loading => _getCircularProgressIndicator,
            PublicHomeDirectoryStatus.error => const SizedBox(),
          },
        );
      },
      listener: (context, state) {},
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: context.sized.dynamicWidth(0.4),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: LocaleText(
        text: LocaleKeys.home_cloudStorage,
        textStyle: context.theme.getTextStyle.headline1,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }

  Widget get _getCircularProgressIndicator => const Center(
        child: CircularProgressIndicator(),
      );
}
