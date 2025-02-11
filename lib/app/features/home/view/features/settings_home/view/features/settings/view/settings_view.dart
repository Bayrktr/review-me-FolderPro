import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/localization/localization_extention.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/component/settings_list_tile.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/settings_view_mixin.dart';
import 'package:DocuSort/app/product/bloc/theme/theme_cubit.dart';
import 'package:DocuSort/app/product/bloc/theme/theme_state.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsView extends StatelessWidget with SettingsViewMixin {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.widthNormalValue,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          SettingsListTile(
            onTap: () {
              context.tabsRouter.setActiveIndex(1);
            },
            leading: Icon(
              Icons.person,
              size: 30,
              color: context.theme.getColor.iconColor,
            ),
            traling: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isLight = state.themeModel.isLight;
              return SettingsListTile(
                leading: Icon(
                  isLight ? Icons.sunny : Icons.sunny_snowing,
                  size: 30,
                  color: context.theme.getColor.iconColor,
                ),
                traling: Switch(
                  value: isLight,
                  onChanged: (bool value) {
                    context.read<ThemeCubit>().setTheme();
                  },
                  activeColor: context.theme.getColor.focusColor,
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SettingsListTile(
            onTap: () {
              //context.router.push(const LanguageRoute());
              context.tabsRouter.setActiveIndex(2);
            },
            leading: Icon(
              Icons.language,
              size: 30,
              color: context.theme.getColor.iconColor,
            ),
            traling: Image.asset(
              context.locale.getFlagAsset.forNull.getImageNotFoundAsset,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SettingsListTile(
            onTap: () {
              context.router.push(const PdfSettingsRoute());
            },
            leading: Icon(
              Icons.settings_suggest_outlined,
              size: 30,
              color: context.theme.getColor.iconColor,
            ),
            traling: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
