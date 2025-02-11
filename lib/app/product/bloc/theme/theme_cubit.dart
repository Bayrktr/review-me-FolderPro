import 'package:DocuSort/app/product/bloc/theme/theme_state.dart';
import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.theme) : super(ThemeState(themeModel: theme));

  final ThemeModel theme;

  final ThemeData _themeDark = ThemeData.dark();
  final ThemeData _themeLight = ThemeData.light();
  final ThemeOperation _themeOperation = GetItManager.getIt<ThemeOperation>();

  bool get isLight =>
      state.themeModel.isLight;

  void resetStatus() {
    emit(
      state.copyWith(
        status: ThemeStatus.initial,
      ),
    );
  }

  void setTheme() {
    final newThemeModel = state.themeModel.copyWith(
      isLight: !isLight,
    );

    emit(
      state.copyWith(
        themeModel: newThemeModel,
      ),
    );

    saveThemeToHive(newThemeModel);
  }

  Future<void> saveThemeToHive(ThemeModel newThemeModel) async {
    await _themeOperation.addOrUpdateItem(newThemeModel);
  }
}
