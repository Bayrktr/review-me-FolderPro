import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/show_modal/home_directory_open_choose_layout_show_modal_sheet.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryOpenAppBarShowModalSheet extends StatelessWidget {
  const HomeDirectoryOpenAppBarShowModalSheet({
    required this.directoryModel, super.key,
  });

  final BaseDirectoryModel? directoryModel;

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
                  value: BlocProvider.of<HomeDirectoryOpenCubit>(context),
                  child: const  HomeDirectoryOpenChooseLayoutShowModalSheet(),
                );
              },
            );


          },
        ),
        ListTile(
          onTap: () {
            context.router.push(
              AddPdfRoute(
                directoryModel: directoryModel,
              ),
            );
          },
          leading: const Icon(Icons.add),
          title: const LocaleText(
            text: LocaleKeys.pdfAdd_pdfAdd,
          ),
        ),
      ],
    );
  }
}
