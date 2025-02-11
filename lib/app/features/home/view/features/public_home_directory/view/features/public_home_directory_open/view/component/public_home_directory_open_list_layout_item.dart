import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/navigate_page/navigate_page_manager.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PublicHomeDirectoryOpenListLayoutItem extends StatelessWidget {
  const PublicHomeDirectoryOpenListLayoutItem({required this.item, super.key});

  final BaseFileModel? item;

  @override
  Widget build(BuildContext context) {
    print('item : $item');
    if (item == null) return const SizedBox();
    return Padding(
      padding: context.padding.veryLow,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.router.push(
                const NavigatePageManager().getOpenFileNavigatePageRoute(
                  item?.fileTypeEnum,
                  fileBaseModel: item,
                ),
              );
            },
            leading: CustomImage(
              imageFrom: ImageFrom.ASSET,
              imageType: ImageType.SVG,
              assetPath: item?.fileTypeEnum?.getFileSvgAsset,
            ),
            title: Text(
              '${item?.name?.forNull.getGeneralNullMessage}',
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
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
}
