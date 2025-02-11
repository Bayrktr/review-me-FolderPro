import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class GeneralErrorView extends StatelessWidget {
  const GeneralErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LocaleText(
          text: LocaleKeys.errors_anUnexpectedProblem,
        ),
      ),
    );
  }
}
