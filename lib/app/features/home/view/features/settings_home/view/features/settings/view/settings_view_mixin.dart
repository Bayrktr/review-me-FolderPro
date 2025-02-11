import 'package:flutter/material.dart';

mixin SettingsViewMixin on StatelessWidget {
  bool isThemeLight(ThemeData currentTheme) {
    if (currentTheme == ThemeData.light()) {
      return true;
    } else {
      return false;
    }
  }
}
