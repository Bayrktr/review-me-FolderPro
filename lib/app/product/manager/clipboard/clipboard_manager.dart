import 'package:flutter/services.dart';

final class ClipBoardManager {
  const ClipBoardManager(this._text);

  final String _text;

  Future<void> copyText() async {
    final data = ClipboardData(text: _text);
    await Clipboard.setData(data);
  }
}
