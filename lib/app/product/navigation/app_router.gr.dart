// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddPdfView]
class AddPdfRoute extends PageRouteInfo<AddPdfRouteArgs> {
  AddPdfRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddPdfRoute.name,
          args: AddPdfRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddPdfRouteArgs>(orElse: () => const AddPdfRouteArgs());
      return AddPdfView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class AddPdfRouteArgs {
  const AddPdfRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'AddPdfRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [DirectoryAddView]
class DirectoryAddRoute extends PageRouteInfo<DirectoryAddRouteArgs> {
  DirectoryAddRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DirectoryAddRoute.name,
          args: DirectoryAddRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DirectoryAddRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DirectoryAddRouteArgs>(
          orElse: () => const DirectoryAddRouteArgs());
      return DirectoryAddView(key: args.key);
    },
  );
}

class DirectoryAddRouteArgs {
  const DirectoryAddRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DirectoryAddRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EditDirectoryView]
class EditDirectoryRoute extends PageRouteInfo<EditDirectoryRouteArgs> {
  EditDirectoryRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          EditDirectoryRoute.name,
          args: EditDirectoryRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditDirectoryRouteArgs>(
          orElse: () => const EditDirectoryRouteArgs());
      return EditDirectoryView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class EditDirectoryRouteArgs {
  const EditDirectoryRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'EditDirectoryRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [EditPdfView]
class EditPdfRoute extends PageRouteInfo<EditPdfRouteArgs> {
  EditPdfRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    PdfModel? pdfModel,
    List<PageRouteInfo>? children,
  }) : super(
          EditPdfRoute.name,
          args: EditPdfRouteArgs(
            key: key,
            directoryModel: directoryModel,
            pdfModel: pdfModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<EditPdfRouteArgs>(orElse: () => const EditPdfRouteArgs());
      return EditPdfView(
        key: args.key,
        directoryModel: args.directoryModel,
        pdfModel: args.pdfModel,
      );
    },
  );
}

class EditPdfRouteArgs {
  const EditPdfRouteArgs({
    this.key,
    this.directoryModel,
    this.pdfModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  final PdfModel? pdfModel;

  @override
  String toString() {
    return 'EditPdfRouteArgs{key: $key, directoryModel: $directoryModel, pdfModel: $pdfModel}';
  }
}

/// generated route for
/// [EmailVerificationView]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmailVerificationView();
    },
  );
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesView();
    },
  );
}

/// generated route for
/// [GeneralErrorView]
class GeneralErrorRoute extends PageRouteInfo<void> {
  const GeneralErrorRoute({List<PageRouteInfo>? children})
      : super(
          GeneralErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralErrorView();
    },
  );
}

/// generated route for
/// [HomeDirectoryOpenView]
class HomeDirectoryOpenRoute extends PageRouteInfo<HomeDirectoryOpenRouteArgs> {
  HomeDirectoryOpenRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          HomeDirectoryOpenRoute.name,
          args: HomeDirectoryOpenRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDirectoryOpenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDirectoryOpenRouteArgs>(
          orElse: () => const HomeDirectoryOpenRouteArgs());
      return HomeDirectoryOpenView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class HomeDirectoryOpenRouteArgs {
  const HomeDirectoryOpenRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'HomeDirectoryOpenRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [HomeDirectoryView]
class HomeDirectoryRoute extends PageRouteInfo<void> {
  const HomeDirectoryRoute({List<PageRouteInfo>? children})
      : super(
          HomeDirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeDirectoryView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LanguageView]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [OpenPdfView]
class OpenPdfRoute extends PageRouteInfo<OpenPdfRouteArgs> {
  OpenPdfRoute({
    required BaseFileModel? pdfModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OpenPdfRoute.name,
          args: OpenPdfRouteArgs(
            pdfModel: pdfModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OpenPdfRouteArgs>();
      return OpenPdfView(
        pdfModel: args.pdfModel,
        key: args.key,
      );
    },
  );
}

class OpenPdfRouteArgs {
  const OpenPdfRouteArgs({
    required this.pdfModel,
    this.key,
  });

  final BaseFileModel? pdfModel;

  final Key? key;

  @override
  String toString() {
    return 'OpenPdfRouteArgs{pdfModel: $pdfModel, key: $key}';
  }
}

/// generated route for
/// [PdfSettingsView]
class PdfSettingsRoute extends PageRouteInfo<void> {
  const PdfSettingsRoute({List<PageRouteInfo>? children})
      : super(
          PdfSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PdfSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PdfSettingsView();
    },
  );
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [PublicHomeDirectoryOpenView]
class PublicHomeDirectoryOpenRoute
    extends PageRouteInfo<PublicHomeDirectoryOpenRouteArgs> {
  PublicHomeDirectoryOpenRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          PublicHomeDirectoryOpenRoute.name,
          args: PublicHomeDirectoryOpenRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PublicHomeDirectoryOpenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PublicHomeDirectoryOpenRouteArgs>(
          orElse: () => const PublicHomeDirectoryOpenRouteArgs());
      return PublicHomeDirectoryOpenView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class PublicHomeDirectoryOpenRouteArgs {
  const PublicHomeDirectoryOpenRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'PublicHomeDirectoryOpenRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [PublicHomeDirectoryView]
class PublicHomeDirectoryRoute extends PageRouteInfo<void> {
  const PublicHomeDirectoryRoute({List<PageRouteInfo>? children})
      : super(
          PublicHomeDirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublicHomeDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PublicHomeDirectoryView();
    },
  );
}

/// generated route for
/// [SearchDirectoryView]
class SearchDirectoryRoute extends PageRouteInfo<void> {
  const SearchDirectoryRoute({List<PageRouteInfo>? children})
      : super(
          SearchDirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchDirectoryView();
    },
  );
}

/// generated route for
/// [SearchFavoriteDirectoryView]
class SearchFavoriteDirectoryRoute extends PageRouteInfo<void> {
  const SearchFavoriteDirectoryRoute({List<PageRouteInfo>? children})
      : super(
          SearchFavoriteDirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchFavoriteDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchFavoriteDirectoryView();
    },
  );
}

/// generated route for
/// [SearchFileView]
class SearchFileRoute extends PageRouteInfo<SearchFileRouteArgs> {
  SearchFileRoute({
    Key? key,
    BaseDirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          SearchFileRoute.name,
          args: SearchFileRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchFileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchFileRouteArgs>(
          orElse: () => const SearchFileRouteArgs());
      return SearchFileView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class SearchFileRouteArgs {
  const SearchFileRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final BaseDirectoryModel? directoryModel;

  @override
  String toString() {
    return 'SearchFileRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [SettingsHomeView]
class SettingsHomeRoute extends PageRouteInfo<void> {
  const SettingsHomeRoute({List<PageRouteInfo>? children})
      : super(
          SettingsHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsHomeView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return SignInView(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignUpRouteArgs>(orElse: () => const SignUpRouteArgs());
      return SignUpView(key: args.key);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}
