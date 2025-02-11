import 'package:flutter/material.dart';

final class ColorTheme {

  ColorTheme(this._theme);
  final ThemeData _theme;

  Color get primaryColor => _theme.primaryColor;

  Color get focusColor => _theme.focusColor;

  Color get unSelectedWidgetColor => _theme.unselectedWidgetColor;

  Color get backgroundColor => _theme.scaffoldBackgroundColor;

  Color get buttonColor =>
      _theme.buttonTheme.colorScheme?.surface ?? Colors.grey;

  Color get iconColor => _theme.iconTheme.color ?? Colors.grey;

  Color get borderColor => _theme.shadowColor;


}
