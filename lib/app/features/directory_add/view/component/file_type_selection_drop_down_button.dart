import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_cubit.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileTypeSelectionDropDownButton extends StatefulWidget {
  const FileTypeSelectionDropDownButton({
    super.key,
    this.selectedItem,
  });

  final FileTypeEnum? selectedItem;

  @override
  State<FileTypeSelectionDropDownButton> createState() =>
      _FileTypeSelectionDropDownButtonState();
}

class _FileTypeSelectionDropDownButtonState
    extends State<FileTypeSelectionDropDownButton> {
  final List<FileTypeEnum> allFileTypes = [
    FileTypeEnum.pdf,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.theme.getColor.borderColor,
        ),
      ),
      child: IconButton(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all<Size>(
            Size(
              context.sized.dynamicWidth(0.3),
              context.sized.dynamicHeight(0.05),
            ),
          ),
          maximumSize: WidgetStateProperty.all<Size>(
            Size(
              context.sized.dynamicWidth(0.5),
              context.sized.dynamicHeight(0.05),
            ),
          ),
        ),
        onPressed: () {
          _showMenu(context);
        },
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              widget.selectedItem?.getIconData,
            ),
            Text(
              widget.selectedItem?.getFileName ?? 'Dosya Tipi',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    final button = context.findRenderObject()! as RenderBox;
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    showMenu<FileTypeEnum>(
      context: context,

      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset.zero, ancestor: overlay),
          button.localToGlobal(button.size.bottomRight(Offset.zero),
              ancestor: overlay,),
        ),
        Offset.zero & overlay.size,
      ),
      constraints: BoxConstraints(

        minWidth: context.sized.dynamicWidth(
          0.5,
        ),
      ),
      items: allFileTypes
          .map(
            (FileTypeEnum fileType) => PopupMenuItem(
              value: FileTypeEnum.pdf,
              child: Row(
                children: [
                  Icon(
                    fileType.getIconData,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.sized.widthLowValue,),
                  ),
                  Text(
                    fileType.getFileName,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    ).then((value) {
      context.read<DirectoryAddCubit>().updateSelectedFileTypeEnum(value);
    });
  }
}
