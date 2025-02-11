import 'dart:ui';

import 'package:DocuSort/app/core/constant/settings.dart';

extension LocalizationExtention on Locale {
  String? get getCountryName {
    switch (this) {
      case Settings.trLocale:
        return 'Türkiye';
      case Settings.enLocale:
        return 'United States';
    }
    return null;
  }

  String? get getFlagAsset {
    return _getFullPath(_getFlagName);
  }

  String? get _getFlagName {
    switch (this) {
      case Settings.trLocale:
        return 'tr';
      case Settings.enLocale:
        return 'en';
    }
    return null;
  }

  String? _getFullPath(String? flagName) {
    if (flagName == null) return null;
    return 'asset/image/flag/$flagName.png';
  }
}
