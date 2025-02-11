import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/icons/home_directory_more_vertical_icon.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryListLayout extends StatelessWidget {
  const HomeDirectoryListLayout({required this.allDirectoryModel, super.key});

  final AllDirectoryModel? allDirectoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = allDirectoryModel?.allDirectory[index];

        if (item == null) {
          return const SizedBox();
        } else {
          return Padding(
            padding: context.padding.veryLow,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    context.router.push(
                      HomeDirectoryOpenRoute(
                        directoryModel: item,
                      ),
                    );
                  },
                  leading: CustomImage(
                    imageFrom: ImageFrom.ASSET,
                    imageType: ImageType.SVG,
                    assetPath: context
                            .read<HomeDirectoryCubit>()
                            .isAlreadyFavorite(item)
                        ? IconsEnum.favoriteFolder.toSvg
                        : IconsEnum.folder.toSvg,
                  ),
                  title: Text(
                    '${item.name?.forNull.getGeneralNullMessage}(${item.fileTypeEnum?.getFileName ?? ''})',
                  ),
                  trailing: HomeDirectoryMoreVerticalIcon(
                    directoryModel: item,
                  ),
                ),
                Divider(
                  thickness: 0,
                  color: context.theme.getColor.borderColor,
                ),
              ],
            ),
          );
        }
      },
      itemCount: allDirectoryModel?.allDirectory.length ?? 0,
    );
  }

  Color? _getFolderIconColor(BaseDirectoryModel directoryModel) {
    if (directoryModel is DirectoryModel) {
      return directoryModel.tagColor;
    } else if (directoryModel is PublicDirectoryModel) {
      return directoryModel.tagColor?.general.toColor;
    } else {
      return null;
    }
  }
}
