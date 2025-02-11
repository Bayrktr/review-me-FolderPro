import 'package:DocuSort/app/core/theme/color_theme.dart';
import 'package:DocuSort/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

final class CustomThemeExtention {
  CustomThemeExtention(BuildContext context) : _context = context;

  final BuildContext _context;

  ThemeData get _getTheme => Theme.of(_context);

  ColorTheme get getColor => ColorTheme(_getTheme);

  CustomTextStyle get getTextStyle => CustomTextStyle(_getTheme);
}
