import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {

  const DividerWithText({
    required this.text, super.key,
    this.textStyle,
    this.lineThickness = 1.0,
    this.lineColor = Colors.grey,
  });
  final String text;
  final TextStyle? textStyle;
  final double lineThickness;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: lineThickness,
            color: lineColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: context.theme.getTextStyle.mediumBodyText1,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: lineThickness,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
