import 'package:flutter/material.dart';

final class GeneralStringExtension {
  GeneralStringExtension(String value) : _string = value;

  final String _string;

  String get removeAfterDot {
    final dotIndex = _string.indexOf('.');

    if (dotIndex != -1) {
      return _string.substring(0, dotIndex);
    }

    return _string;
  }

  String get capitalize {
    if (_string.isEmpty) return _string;
    return _string[0].toUpperCase() + _string.substring(1);
  }

  String get toLower {
    if (_string.isEmpty) return _string;
    return _string.toLowerCase();
  }

  Color? get toColor {
    if (_string.isEmpty) return null;
    return Color(int.parse(_string, radix: 16));
  }
}
