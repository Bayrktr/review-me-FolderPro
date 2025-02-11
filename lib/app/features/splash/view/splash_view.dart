import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/splash/bloc/splash_cubit.dart';
import 'package:DocuSort/app/features/splash/bloc/splash_state.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SplashCubit()..startApp(),
        child: BlocConsumer<SplashCubit, SplashState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.widthNormalValue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(
                      imageFrom: ImageFrom.ASSET,
                      assetPath: Settings.appIconPath,
                      height: context.sized.dynamicWidth(0.50),
                      width: context.sized.dynamicWidth(0.50),
                      imageType: ImageType.PNG,
                    ),
                    Text(
                      Settings.appName,
                      style: context.theme.getTextStyle.mediumHeadline1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LinearProgressIndicator(),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            switch (state.deepLinkNavigatePages) {
              case DeepLinkNavigatePages.initial:
                break;
              case DeepLinkNavigatePages.homeDirectoryOpen:
                context.router.pushAndPopUntil(
                  HomeDirectoryOpenRoute(
                    directoryModel: state.deepLinkDirectory,
                  ),
                  predicate: (router) => false,
                );
              case DeepLinkNavigatePages.fileOpen:
                break;
            }

            switch (state.status) {
              case SplashStatus.start:
                break;
              case SplashStatus.error:
                break;
              case SplashStatus.finish:
                context.router.pushAndPopUntil(
                  predicate: (router) => false,
                  const HomeRoute(),
                );
            }
          },
        ),
      ),
    );
  }
}
