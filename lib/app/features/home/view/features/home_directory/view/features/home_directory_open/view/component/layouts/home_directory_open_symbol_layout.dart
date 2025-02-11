import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/icons/home_directory_open_more_vertical_icon.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectoryOpenSymbolLayout extends StatelessWidget {
  const HomeDirectoryOpenSymbolLayout({
    required this.allFilesModel, required this.directoryModel, super.key,
  });

  final AllFilesModel? allFilesModel;
  final BaseDirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    final allFiles = allFilesModel?.allFiles;

    return GridView.builder(
      itemCount: allFiles?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: context.sized.heightNormalValue,
        crossAxisSpacing: context.sized.widthNormalValue,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = allFiles?[index];
        final name = item?.name?.forNull.getGeneralNullMessage;
        return item == null
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  context.router.push(
                    _getNavigatePageRoute(
                      directoryModel!.fileTypeEnum,
                      fileBaseModel: item,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: context.theme.getColor.borderColor,
                    ),
                  ),
                  child: Padding(
                    padding: context.padding.normal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              directoryModel?.fileTypeEnum?.getIconData,
                              color: context.theme.getColor.iconColor,
                              size: context.sized.widthHighValue,
                            ),
                            HomeDirectoryOpenMoreVerticalIcon(
                              directoryModel: directoryModel,
                              item: item,
                            ),
                          ],
                        ),
                        Text(
                          name!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  PageRouteInfo<dynamic> _getNavigatePageRoute(
    FileTypeEnum? fileTypeEnum, {
    BaseFileModel? fileBaseModel,
  }) {
    switch (fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        if (fileBaseModel is! PdfModel) return const GeneralErrorRoute();
        return OpenPdfRoute(
          pdfModel: fileBaseModel,
        );
    }
  }
}
