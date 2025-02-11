import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/component/show_modal/public_home_directory_share_menu_show_modal.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:DocuSort/app/product/enum/link_templates_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/manager/getIt/import.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/package/encrypt/encrypt_generator.dart';
import 'package:DocuSort/app/product/package/encrypt/encrypt_keys.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PublicHomeDirectoryListLayoutItem extends StatelessWidget {
  const PublicHomeDirectoryListLayoutItem({required this.item, super.key});

  final PublicDirectoryModel? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox();
    return Padding(
      padding: context.padding.veryLow,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.router.push(
                PublicHomeDirectoryOpenRoute(
                  directoryModel: item,
                ),
              );
            },
            leading: CustomImage(
              imageFrom: ImageFrom.ASSET,
              imageType: ImageType.SVG,
              assetPath:
                  context.read<HomeDirectoryCubit>().isAlreadyFavorite(item)
                      ? IconsEnum.favoriteFolder.toSvg
                      : IconsEnum.folder.toSvg,
            ),
            title: Text(
              '${item?.name?.forNull.getGeneralNullMessage}(${item?.fileTypeEnum?.getFileName ?? ''})',
            ),
            trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contextSecond) {
                    final userId = GetItManager.getIt<IFirebaseAuth>()
                        .currentUserDetail
                        ?.uid;
                    return PublicHomeDirectoryShareMenuShowModal(
                      link: LinkTemplatesEnum.directoryShare.getLink(
                        id: EncrptGenerator(
                          userId ?? '',
                          dotenv.env[EncryptKeys.idKey] ?? '',
                        ).toEncrypt,
                        directoryId: EncrptGenerator(
                          item?.id ?? '',
                          dotenv.env[EncryptKeys.directoryIdKey] ?? '',
                        ).toEncrypt,
                      ),
                    );
                  },
                );
              },
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
