import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/favorite_directory/favorite_directory_item_show_modal_sheet.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteDirectoryItem extends StatelessWidget {
  const FavoriteDirectoryItem({super.key, this.favoriteDirectoryModel});

  final FavoritesDirectoryModel? favoriteDirectoryModel;

  BaseDirectoryModel? get _item => favoriteDirectoryModel?.directoryModel;

  @override
  Widget build(BuildContext context) {
    if (_item == null) return const SizedBox();

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

      },
      leading: CustomImage(
        imageFrom: ImageFrom.ASSET,
        imageType: ImageType.SVG,
        assetPath: IconsEnum.favoriteFolder.toSvg,
      ),
      title: Text(
        _item!.name.forNull.getGeneralNullMessage,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: () {
          IShowDialog(
            context: context,
            widget: FavoriteDirectoryItemShowModalSheet(
              favoritesDirectoryModel: favoriteDirectoryModel!,
              removeFavorite: () {
                context
                    .read<FavoritesCubit>()
                    .deleteFavoriteDirectory(favoriteDirectoryModel!);
              },
              onShare: () {},
            ),
          ).showBottomSheet();
        },
        icon: const Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
