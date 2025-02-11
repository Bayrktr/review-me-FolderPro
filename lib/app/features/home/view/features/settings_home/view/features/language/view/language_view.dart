import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/localization/localization_extention.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/language/view/component/country_selection_list_tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final supportedLocales = context.supportedLocales;

    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = supportedLocales[index];
          return CountrySelectionListTile(
            flagAsset: item.getFlagAsset.forNull.getImageNotFoundAsset,
            countryName: item.getCountryName.forNull.getGeneralNullMessage,
            isCountrySelected: item == context.locale,
            onTap: () {
              context.setLocale(item);
            },
          );
        },
        itemCount: supportedLocales.length,
      ),
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
  }) =>
      AppBar(
        leading: IconButton(
          onPressed: () {
            //context.router.maybePop();
            context.tabsRouter.setActiveIndex(0);
          },
          icon: Icon(
            Icons.arrow_back,
            color: context.theme.getColor.iconColor,
          ),
        ),
      );
}
