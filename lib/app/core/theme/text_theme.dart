import 'package:flutter/material.dart';

final class CustomTextStyle {

  CustomTextStyle(this._theme);
  final ThemeData _theme;

  TextStyle get headline1 =>
      _theme.textTheme.headlineSmall ?? const TextStyle();

  TextStyle get mediumHeadline1 =>
      _theme.textTheme.headlineMedium ?? const TextStyle();

  TextStyle get bodyText1 => _theme.textTheme.bodySmall ?? const TextStyle();

  TextStyle get mediumBodyText1 =>
      _theme.textTheme.bodyMedium ?? const TextStyle();

  TextStyle get highBodyText => _theme.textTheme.bodyLarge ?? const TextStyle();
}
