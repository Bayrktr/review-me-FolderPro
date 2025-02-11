import 'package:flutter/cupertino.dart';

@immutable
final class Settings {
  const Settings._();

  static String appName = 'FolderPro';

  static String appIconPath = '${Settings.assetPath}image/logo/app_icon.png';

  static bool isDebugBannerOpen = false;

  static const List<Locale> supportedLocale = [
    Settings.trLocale,
    Settings.enLocale,
  ];

  /// TR Language

  static const String tr = 'tr';

  static const Locale trLocale = Locale('tr', 'TR');

  /// EN Language
  static const String en = 'en';

  static const Locale enLocale = Locale('en', 'US');

  static const Locale startLocale = Settings.enLocale;

  static const String assetPath = 'asset/';

  static const String langPath = '${Settings.assetPath}lang';

  static const String host = 'share';

}
