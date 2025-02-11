import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/navigate_page/navigate_page_manager.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RecentFilesItem extends StatelessWidget {
  const RecentFilesItem({super.key, this.recentFile});

  final BaseFileModel? recentFile;

  @override
  Widget build(BuildContext context) {
    if (recentFile == null) return const SizedBox();
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
            recentFile!.fileTypeEnum,
            fileBaseModel: recentFile,
          ),
        );
      },
      leading: CustomImage(
        imageFrom: ImageFrom.ASSET,
        imageType: ImageType.SVG,
        assetPath: recentFile?.fileTypeEnum?.getFileSvgAsset,
      ),
      title: Text(recentFile!.name.forNull.getGeneralNullMessage),
    );
  }
}
