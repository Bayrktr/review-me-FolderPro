import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/product/bloc/deep_link/deep_link_cubit.dart';
import 'package:DocuSort/app/product/bloc/deep_link/deep_link_state.dart';
import 'package:DocuSort/app/product/bloc/theme/theme_cubit.dart';
import 'package:DocuSort/app/product/bloc/user_account/user_account_cubit.dart';
import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/constant/app_theme.dart';
import 'package:DocuSort/app/product/init/app_init.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // await Hive.deleteBoxFromDisk('pdfApp');
  //return;
  await AppInit.mainInit();


  runApp(
    EasyLocalization(
      startLocale: Settings.startLocale,
      supportedLocales: Settings.supportedLocale,
      path: Settings.langPath,
      child: MyApp(),
    ),
  );

  //  runApp(TestApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 final _appRouter = GetItManager.getIt<AppRouter>();

  final ThemeModel _themeModel =
      GetItManager.getIt<ThemeOperation>().getItem(ThemeModel.themeModelKey) ??
          ThemeModel();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(_themeModel),
        ),
        BlocProvider(
          create: (_) => UserAccountCubit(
            IFirebaseAuth(null),
          ),
        ),
        BlocProvider(
          create: (_) => DeepLinkCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeepLinkCubit, DeepLinkState>(
            listener: (context, state) {
              switch (state.navigate) {
                case DeepLinkNavigate.initial:
                  break;
                case DeepLinkNavigate.openDirectory:
                  GetItManager.getIt<AppRouter>().push(
                    PublicHomeDirectoryOpenRoute(
                      directoryModel: state.directoryModel,
                    ),
                  );
                case DeepLinkNavigate.openFile:
                  break;
              }
            },
          ),
        ],
        child: Builder(
          builder: (context) {
            context.read<DeepLinkCubit>().initDeepLinkHandling();

            final themeState = context.watch<ThemeCubit>().state;
            final isLight = themeState.themeModel.isLight;

            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: Settings.isDebugBannerOpen,
              routerConfig: _appRouter.config(),
              title: Settings.appName,
              theme: isLight ? AppTheme.lightTheme : AppTheme.dartTheme,
            );
          },
        ),
      ),
    );
  }
}
