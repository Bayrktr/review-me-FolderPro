import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';

class ThemeManager {

  // Public factory method to access the instance.
  factory ThemeManager() {
    return _instance;
  }
  // Private constructor to prevent external instantiation.
  ThemeManager._internal();

  // Static instance of the class.
  static final ThemeManager _instance = ThemeManager._internal();

  final ThemeOperation _themeOperation = GetItManager.getIt<ThemeOperation>();

  ThemeModel _themeModel = ThemeModel();

  ThemeModel get themeModel => _themeModel;

  Future<void> initDatabase() async {
    print('init theme');
    await _themeOperation.start(ThemeModel.themeModelKey);

    final themeData = _themeOperation.getItem(ThemeModel.themeModelKey);

    print('theme data ${themeData?.isLight}');

    if (themeData == null) {
      await _createFirstThemeData();
      final newThemeData = _themeOperation.getItem(ThemeModel.themeModelKey);
      if (newThemeData == null) return;
      _themeModel = newThemeData;
    } else {
      _themeModel = themeData;
    }
  }

  Future<void> _createFirstThemeData() async {
    await _themeOperation.addOrUpdateItem(
      ThemeModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }
}
