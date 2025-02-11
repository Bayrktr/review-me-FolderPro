import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsHomeView extends StatelessWidget {
  const SettingsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        const SettingsRoute(),
        ProfileRoute(),
        const LanguageRoute(),
      ],
      builder: (context, widget, controller) {
        return Scaffold(
          appBar: _getAppBar(context: context),
          body: widget,
        );
      },
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
  }) =>
      AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: LocaleText(
          text: LocaleKeys.general_settings,
          textStyle: context.theme.getTextStyle.headline1,
        ),
      );
}
