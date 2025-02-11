import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectoryShowModelSheet extends StatelessWidget {
  const HomeDirectoryShowModelSheet({
    required this.directoryModel, required this.onDelete, required this.onEdit, required this.onAdd, required this.addFavorite, super.key,
    this.alreadyFavorite = false,
  });

  final BaseDirectoryModel directoryModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onAdd;
  final VoidCallback addFavorite;
  final bool alreadyFavorite;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: Icon(
            alreadyFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          title: const LocaleText(
            text: LocaleKeys.general_addFavorite,
          ),
          onTap: () {
            Navigator.of(context).pop();
            addFavorite();
          },
        ),
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
          leading: const Icon(Icons.file_upload),
          title: Text(
            _getDirectoryAddTitle,
          ),
          onTap: () {
            Navigator.of(context).pop();
            context.router.push(
              getAddFileRoute,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const LocaleText(
            text: LocaleKeys.general_edit,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onEdit();
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const LocaleText(
            text: LocaleKeys.general_delete,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onDelete();
          },
        ),
      ],
    );
  }

  PageRouteInfo<dynamic> get getAddFileRoute {
    switch (directoryModel.fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return AddPdfRoute(
          directoryModel: directoryModel,
        );
    }
  }

  String get _getDirectoryAddTitle =>
      '${directoryModel.fileTypeEnum?.name.general.capitalize ?? ''} ${LocaleKeys.general_add.lang.tr}';
}
