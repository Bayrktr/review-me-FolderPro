import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:flutter/material.dart';

enum FileTypeEnum {
  pdf,
}

extension FileTypeEnumExtention on FileTypeEnum {
  IconData get getIconData {
    switch (this) {
      case FileTypeEnum.pdf:
        return Icons.library_books_outlined;
    }
  }

  String? get getFileSvgAsset {
    switch (this) {
      case FileTypeEnum.pdf:
        return IconsEnum.file.toSvg;

    }
  }

  String get getFileName {
    switch (this) {
      case FileTypeEnum.pdf:
        return 'Pdf';
    }
  }
}
