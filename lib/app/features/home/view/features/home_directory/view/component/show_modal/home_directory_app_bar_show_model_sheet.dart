import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/show_modal/home_directory_choose_layout_show_model_sheet.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryAppBarShowModelSheet extends StatelessWidget {
  const HomeDirectoryAppBarShowModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.grid_view),
          title: const LocaleText(
            text: LocaleKeys.home_layout,
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (contextSecond) {
                return BlocProvider.value(
                  value: BlocProvider.of<HomeDirectoryCubit>(context),
                  child: const HomeDirectoryChooseLayoutShowModelSheet(),
                );
              },
            );
          },
        ),
        ListTile(
          onTap: () {
            context.router.push(DirectoryAddRoute());
          },
          leading: const Icon(Icons.add),
          title: const LocaleText(
            text: LocaleKeys.directoryAdd_directoryAdd,
          ),
        ),
      ],
    );
  }
}
