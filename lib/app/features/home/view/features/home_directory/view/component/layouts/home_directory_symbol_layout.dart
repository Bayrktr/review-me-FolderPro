import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/component/icons/home_directory_more_vertical_icon.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectorySymbolLayout extends StatelessWidget {
  const HomeDirectorySymbolLayout({required this.allDirectoryModel, super.key});

  final AllDirectoryModel? allDirectoryModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: allDirectoryModel?.allDirectory.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: context.sized.heightNormalValue,
        crossAxisSpacing: context.sized.widthNormalValue,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = allDirectoryModel?.allDirectory[index];
        final borderColor =
            _getBorderColor(item) ?? context.theme.getColor.borderColor;
        final name = item?.name?.forNull.getGeneralNullMessage;
        return item == null
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  context.router.push(
                    HomeDirectoryOpenRoute(
                      directoryModel: item,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      //  color: context.theme.getColor.borderColor,
                      color: borderColor,
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
                              Icons.folder,
                              color: borderColor,
                              size: context.sized.widthHighValue,
                            ),
                            HomeDirectoryMoreVerticalIcon(
                              directoryModel: item,
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

  Color? _getBorderColor(BaseDirectoryModel? directoryModel) {
    if (directoryModel is DirectoryModel) {
      return directoryModel.tagColor;
    } else if (directoryModel is PublicDirectoryModel) {
      return directoryModel.tagColor?.general.toColor;
    } else {
      return null;
    }
  }
}
