import 'package:flutter/material.dart';

enum CustomColors {
  darkBlue('0b429c');

  final String value;

  const CustomColors(this.value);

  int get toRgba => int.parse('0xFF$value');

  Color get getColor => Color(toRgba);
}
