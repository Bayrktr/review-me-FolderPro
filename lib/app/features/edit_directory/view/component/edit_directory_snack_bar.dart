import 'package:flutter/material.dart';

class EditDirectorySnackBar {

  const EditDirectorySnackBar({
    required this.message,
    this.duration = const Duration(seconds: 3),
  });
  final String message;
  final Duration duration;

  void show(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.lightGreen,
      content: Text(message),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
