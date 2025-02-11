import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/show_modal/home_directory_show_model_sheet.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryMoreVerticalIcon extends StatelessWidget {
  const HomeDirectoryMoreVerticalIcon(
      {required this.directoryModel, super.key,});

  final BaseDirectoryModel directoryModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        IShowDialog(
          context: context,
          widget: HomeDirectoryShowModelSheet(
            directoryModel: directoryModel,
            alreadyFavorite: context
                .read<HomeDirectoryCubit>()
                .isAlreadyFavorite(directoryModel),
            addFavorite: () {
              context.read<HomeDirectoryCubit>().addToFavorite(directoryModel);
            },
            onAdd: () {},
            onDelete: () {
              context
                  .read<HomeDirectoryCubit>()
                  .deleteDirectoryFromAllDirectory(
                    directoryModel,
                  );
            },
            onEdit: () {
              context.router.popAndPush(
                EditDirectoryRoute(
                  directoryModel: directoryModel,
                ),
              );
            },
          ),
        ).showBottomSheet();
      },
      icon: const Icon(
        Icons.more_vert,
      ),
    );
  }
}
