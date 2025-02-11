import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {

  const CustomPopup({
    required this.title, required this.message, required this.onConfirm, super.key,
  });
  final String title;
  final String message;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onConfirm,
          child: const LocaleText(text: LocaleKeys.general_okey),
        ),
      ],
    );
  }
}
