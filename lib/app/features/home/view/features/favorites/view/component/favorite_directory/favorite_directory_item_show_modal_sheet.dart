import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FavoriteDirectoryItemShowModalSheet extends StatelessWidget {
  const FavoriteDirectoryItemShowModalSheet({
    required this.favoritesDirectoryModel, required this.removeFavorite, required this.onShare, super.key,
  });

  final FavoritesDirectoryModel favoritesDirectoryModel;
  final VoidCallback removeFavorite;
  final VoidCallback onShare;


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.share),
          title: const LocaleText(
            text: LocaleKeys.general_share,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.remove_circle_outline_sharp),
          title: const LocaleText(
            text: LocaleKeys.favorites_removeFromFavorites,
          ),
          onTap: () {
            Navigator.of(context).pop();
            removeFavorite();
          },
        ),
      ],
    );
  }

}
