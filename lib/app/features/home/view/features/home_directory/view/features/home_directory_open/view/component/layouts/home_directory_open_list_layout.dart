import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/icons/home_directory_open_more_vertical_icon.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/navigate_page/navigate_page_manager.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectoryOpenListLayout extends StatelessWidget {
  const HomeDirectoryOpenListLayout({
    required this.allFilesModel, required this.directoryModel, super.key,
  });

  final AllFilesModel? allFilesModel;
  final BaseDirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = allFilesModel?.allFiles[index];
        if (item == null) return const SizedBox();

        return ListTile(
          contentPadding: context.padding.low,
          titleAlignment: ListTileTitleAlignment.top,
          shape: Border(
            bottom: BorderSide(
              width: 0.1,
              color: context.theme.getColor.unSelectedWidgetColor,
            ),
          ),
          onTap: () {
            context.router.push(
              const NavigatePageManager().getOpenFileNavigatePageRoute(
                directoryModel!.fileTypeEnum,
                fileBaseModel: item,
              ),
            );
          },
          leading: CustomImage(
            imageFrom: ImageFrom.ASSET,
            imageType: ImageType.SVG,
            assetPath: item.fileTypeEnum?.getFileSvgAsset,
          ),
          title: Text(
            item.name.forNull.getGeneralNullMessage,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: HomeDirectoryOpenMoreVerticalIcon(
            directoryModel: directoryModel,
            item: item,
          ),
        );
      },
      itemCount: allFilesModel?.allFiles.length ?? 0,
    );
  }
}
