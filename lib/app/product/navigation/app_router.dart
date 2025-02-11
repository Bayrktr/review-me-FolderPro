import 'package:DocuSort/app/features/add_pdf/view/add_pdf_view.dart';
import 'package:DocuSort/app/features/directory_add/view/directory_add_view.dart';
import 'package:DocuSort/app/features/edit_directory/view/edit_directory_view.dart';
import 'package:DocuSort/app/features/edit_pdf/view/edit_pdf_view.dart';
import 'package:DocuSort/app/features/error/features/general_error/view/general_error_view.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/favorites_view.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/home_directory_open_view.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/home_directory_view.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/view/public_home_directory_open_view.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/public_home_directory_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/language/view/language_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/profile/view/profile_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/settings_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/settings_home_view.dart';
import 'package:DocuSort/app/features/home/view/home_view.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/view/sign_in_view.dart';
import 'package:DocuSort/app/features/login/view/features/sign_up/view/sign_up_view.dart';
import 'package:DocuSort/app/features/login/view/login_view.dart';
import 'package:DocuSort/app/features/open_pdf/view/open_pdf_view.dart';
import 'package:DocuSort/app/features/pdf_view_settings/view/pdf_settings_view.dart';
import 'package:DocuSort/app/features/search_directory/view/search_directory_view.dart';
import 'package:DocuSort/app/features/search_favorite_directory/view/search_favorite_directory_view.dart';
import 'package:DocuSort/app/features/search_file/view/search_file_view.dart';
import 'package:DocuSort/app/features/splash/view/splash_view.dart';
import 'package:DocuSort/app/features/verifications/view/features/email_verification/view/email_verification_view.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/navigation/auth_guard/auth_guard.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute<SplashRoute>(
          page: SplashRoute.page,
          path: RoutePath.splash.path,
          //initial: true,
        ),
        AdaptiveRoute<LoginRoute>(
          page: LoginRoute.page,
          path: RoutePath.login.path,
          initial: true,
          children: [
            AdaptiveRoute<SignInRoute>(
              page: SignInRoute.page,
              path: RoutePath.signIn.path,
              initial: true,
            ),
            AdaptiveRoute<SignUpRoute>(
              page: SignUpRoute.page,
              path: RoutePath.signUp.path,
            ),
          ],
        ),
        AdaptiveRoute<DirectoryAddRoute>(
          page: DirectoryAddRoute.page,
          path: RoutePath.directoryAdd.path,
        ),
        AdaptiveRoute<HomeDirectoryOpenRoute>(
          page: HomeDirectoryOpenRoute.page,
          path: RoutePath.homeDirectoryOpen.path,
        ),
        AdaptiveRoute<AddPdfRoute>(
          page: AddPdfRoute.page,
          path: RoutePath.fileAdd.path,
        ),
        AdaptiveRoute<EditDirectoryRoute>(
          page: EditDirectoryRoute.page,
          path: RoutePath.directoryEdit.path,
        ),
        AdaptiveRoute<EditPdfRoute>(
          page: EditPdfRoute.page,
          path: RoutePath.fileEdit.path,
        ),
        AdaptiveRoute<OpenPdfRoute>(
          page: OpenPdfRoute.page,
          path: RoutePath.openFile.path,
        ),
        AdaptiveRoute<SearchDirectoryRoute>(
          page: SearchDirectoryRoute.page,
          path: RoutePath.searchDirectory.path,
        ),
        AdaptiveRoute<SearchFileRoute>(
          page: SearchFileRoute.page,
          path: RoutePath.searchFile.path,
        ),
        AdaptiveRoute<PdfSettingsRoute>(
          page: PdfSettingsRoute.page,
          path: RoutePath.pdfSettings.path,
        ),
        AdaptiveRoute<GeneralErrorRoute>(
          page: GeneralErrorRoute.page,
          path: RoutePath.generalError.path,
        ),
        AdaptiveRoute<SearchFavoriteDirectoryRoute>(
          page: SearchFavoriteDirectoryRoute.page,
          path: RoutePath.searchFavoriteDirectory.path,
        ),
        AdaptiveRoute<HomeRoute>(
          page: HomeRoute.page,
          path: RoutePath.home.path,
          // initial: true,
          children: [
            AdaptiveRoute<HomeDirectoryRoute>(
              page: HomeDirectoryRoute.page,
              path: RoutePath.homeDirectory.path,
            ),
            AdaptiveRoute<PublicHomeDirectoryRoute>(
              page: PublicHomeDirectoryRoute.page,
              path: RoutePath.publicHomeDirectory.path,
              guards: [
                AuthGuard(
                  GetItManager.getIt<IFirebaseAuth>(),
                ),
              ],
            ),
            AdaptiveRoute<SettingsHomeRoute>(
              page: SettingsHomeRoute.page,
              path: RoutePath.settingsHome.path,
              children: [
                AdaptiveRoute<LanguageRoute>(
                  page: LanguageRoute.page,
                  path: RoutePath.language.path,
                ),
                AdaptiveRoute<SettingsRoute>(
                  page: SettingsRoute.page,
                  path: RoutePath.settings.path,
                  initial: true,
                ),
                AdaptiveRoute<ProfileRoute>(
                  page: ProfileRoute.page,
                  path: RoutePath.profile.path,
                ),
              ],
            ),
            AdaptiveRoute<FavoritesRoute>(
              page: FavoritesRoute.page,
              path: RoutePath.favorites.path,
            ),
          ],
        ),
        AdaptiveRoute<EmailVerificationRoute>(
          page: EmailVerificationRoute.page,
          path: RoutePath.emailVerification.path,
        ),

    AdaptiveRoute<PublicHomeDirectoryOpenRoute>(
      page: PublicHomeDirectoryOpenRoute.page,
      path: RoutePath.publicHomeDirectoryOpen.path,
    ),
      ];
}

enum RoutePath {
  splash('/'),
  login('/login'),
  signIn('signIn'),
  signUp('signUp'),
  home('/home'),
  language('language'),
  directoryAdd('/directoryAdd'),
  settings('settings'),
  homeDirectory('homeDirectory'),
  directoryEdit('/directoryEdit'),
  fileEdit('/fileEdit'),
  fileAdd('/fileAdd'),
  settingsHome('settingsHome'),
  profile('profile'),
  openFile('/openFile'),
  searchDirectory('/searchDirectory'),
  searchFile('/searchFile'),
  pdfSettings('/pdfSettings'),
  generalError('/generalError'),
  publicHomeDirectory('publicHomeDirectory'),
  publicHomeDirectoryOpen('/publicHomeDirectoryOpen'),
  favorites('favorites'),
  searchFavoriteDirectory('/searchFavoriteDirectory'),
  emailVerification('/emailVerification'),
  homeDirectoryOpen('/homeDirectoryOpen');

  const RoutePath(this.path);

  final String path;

  String get getPath => path;

  PageRouteInfo<dynamic> get pageRouteInfo => PageRouteInfo(path);
}
