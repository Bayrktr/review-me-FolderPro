import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

enum PageLayoutEnum {
  list,
  symbol,
}

extension PageLayoutEnumExtention on PageLayoutEnum {
  IconData get pageLayoutIcon {
    switch (this) {
      case PageLayoutEnum.list:
        return Icons.list;
      case PageLayoutEnum.symbol:
        return Icons.view_module;
    }
  }

  String get pageLayoutName {
    switch (this) {
      case PageLayoutEnum.list:
        return LocaleKeys.home_asList.lang.tr;
      case PageLayoutEnum.symbol:
        return LocaleKeys.home_asSymbol.lang.tr;
    }
  }
}
