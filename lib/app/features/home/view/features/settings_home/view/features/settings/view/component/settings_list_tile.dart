import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {

  const SettingsListTile({
    super.key,
    this.leading,
    this.traling,
    this.title,
    this.onTap,
  });
  final Widget? leading;
  final Widget? traling;
  final Widget? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.theme.getColor.borderColor,
        ),
      ),
      child: ListTile(
        title: title,
        onTap: onTap,
        leading: leading,
        trailing: traling,
      ),
    );
  }
}
