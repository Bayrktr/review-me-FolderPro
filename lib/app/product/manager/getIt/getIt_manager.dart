import 'package:DocuSort/app/product/cache/hive/operation/recent_files_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/import.dart';

@immutable
final class GetItManager {
  const GetItManager._();

  static final getIt = GetIt.instance;

  static void setup() {
    getIt
      ..registerLazySingleton<AllDirectoryOperation>(
        AllDirectoryOperation.new,
      )
      ..registerSingleton<ThemeOperation>(
        ThemeOperation(),
      )
      ..registerSingleton<AllFilesOperation>(
        AllFilesOperation(),
      )
      ..registerSingleton<DirectoryOperation>(
        DirectoryOperation(),
      )
      ..registerSingleton<PdfSettingsOperation>(
        PdfSettingsOperation(),
      )
      ..registerSingleton<HomeDirectoryPageLayoutOperation>(
        HomeDirectoryPageLayoutOperation(),
      )
      ..registerSingleton<HomeDirectoryOpenPageLayoutOperation>(
        HomeDirectoryOpenPageLayoutOperation(),
      )
      ..registerSingleton<AllFavoritesDirectoryOperation>(
        AllFavoritesDirectoryOperation(),
      )
      ..registerSingleton<IFirebaseAuth>(
        IFirebaseAuth(
          FirebaseAuth.instance,
        ),
      )
      ..registerSingleton<FirebaseDatabase>(
        FirebaseDatabase(
          FirebaseFirestore.instance,
        ),
      )
      ..registerSingleton<RecentFilesOperation>(
        RecentFilesOperation(),
      )
      ..registerLazySingleton<AppRouter>(AppRouter.new);
  }
}
