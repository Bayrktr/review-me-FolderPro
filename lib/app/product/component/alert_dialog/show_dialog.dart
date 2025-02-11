import 'package:flutter/material.dart';

class IShowDialog {
  IShowDialog({required this.context, required this.widget});

  final BuildContext context;

  final Widget widget;

  void getDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }
}
