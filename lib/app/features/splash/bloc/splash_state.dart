import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:equatable/equatable.dart';

class SplashState with EquatableMixin {
  SplashState({
    this.status = SplashStatus.start,
    this.deepLinkNavigatePages = DeepLinkNavigatePages.initial,
    this.deepLinkDirectory,
  });

  final SplashStatus status;
  final DeepLinkNavigatePages deepLinkNavigatePages;
  final PublicDirectoryModel? deepLinkDirectory;

  @override
  List<Object?> get props => [
        status,
        deepLinkNavigatePages,
        deepLinkDirectory,
      ];

  SplashState copyWith({
    SplashStatus? status,
    DeepLinkNavigatePages? deepLinkNavigatePages,
    PublicDirectoryModel? deepLinkDirectory,
  }) =>
      SplashState(
        status: status ?? this.status,
        deepLinkNavigatePages:
            deepLinkNavigatePages ?? this.deepLinkNavigatePages,
        deepLinkDirectory: deepLinkDirectory ?? this.deepLinkDirectory,
      );
}

enum SplashStatus {
  start,
  error,
  finish,
}

enum DeepLinkNavigatePages {
  initial,
  homeDirectoryOpen,
  fileOpen,
}
