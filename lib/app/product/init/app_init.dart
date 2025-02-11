import 'package:DocuSort/app/product/cache/hive/hive_cache_manager.dart';
import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/manager/device_info/device_info_manager.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:DocuSort/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class AppInit {
  const AppInit._();

  static Future<void> mainInit() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await dotenv.load();


    await EasyLocalization.ensureInitialized();
    GetItManager.setup();
    await HiveCacheManager().start();
    await _startInitialHiveOperations();
  }

  static Future<void> splashInit() async {
    await DeviceInfoManager().init();
  }

  static Future<void> _startInitialHiveOperations() async {
    final themeOperation = GetItManager.getIt<ThemeOperation>();

    await themeOperation.start(ThemeModel.themeModelKey);
    if (themeOperation.getItem(ThemeModel.themeModelKey)?.id == null) {
      await themeOperation.addOrUpdateItem(
        ThemeModel(
          id: IdGenerator.randomIntId,
        ),
      );
    }
  }
}
