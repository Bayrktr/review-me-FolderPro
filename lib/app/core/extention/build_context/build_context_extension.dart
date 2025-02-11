import 'package:DocuSort/app/core/extention/build_context/icon_size_extension.dart';
import 'package:DocuSort/app/core/extention/build_context/padding_extension.dart';
import 'package:DocuSort/app/core/extention/build_context/sized_extension.dart';
import 'package:DocuSort/app/core/extention/build_context/theme_extention.dart';
import 'package:flutter/material.dart';

/// BuildContext extension
extension BuildContextExtension on BuildContext {
  /// sized context
  ContextSizeExtension get sized => ContextSizeExtension(this);

  IconSizeExtension get radius => IconSizeExtension(this);

  /// padding context
  PaddingExtensionClass get padding => PaddingExtensionClass(this);

  ///theme context

  CustomThemeExtention get theme => CustomThemeExtention(this);
}
