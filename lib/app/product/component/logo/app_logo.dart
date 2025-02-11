import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getPadding(context: context),
        Icon(
          Icons.folder_copy,
          size: context.radius.low,
        ),
        _getPadding(context: context),
        Text(
          Settings.appName,
          style: context.theme.getTextStyle.headline1,
        ),
      ],
    );
  }

  Widget _getPadding({required BuildContext context}) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3,
      ),
    );
  }
}
