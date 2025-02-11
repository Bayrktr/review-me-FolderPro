import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/model/pdf/public_pdf/public_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/import.dart';
import 'package:DocuSort/app/product/manager/directory/directory_manager.dart';
import 'package:DocuSort/app/product/model/recent_files/recent_files_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

abstract class IDatabaseManager {
  Future<void> start();

  Future<void> clear();
}

@immutable
final class HiveCacheManager implements IDatabaseManager {
  final String _subDirectory = 'pdfApp';

  @override
  Future<void> start() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    await _open();
    _initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.close();

    await Hive.deleteFromDisk();
    await DirectoryManager.instance.removeSubDirectory(_subDirectory);
  }

  Future<void> _open() async {
    final subPath =
        await DirectoryManager.instance.createSubDirectory(_subDirectory);
    await Hive.initFlutter(subPath);
  }

  void _initialOperation() {
    //Hive.registerAdapter(UserAdapter());
    Hive
      ..registerAdapter(AllDirectoryModelAdapter())
      ..registerAdapter(DirectoryModelAdapter())
      ..registerAdapter(AllFilesModelAdapter())
      ..registerAdapter(PdfModelAdapter())
      ..registerAdapter(MaterialColorAdapter())
      ..registerAdapter(ThemeModelAdapter())
      ..registerAdapter(ThemeDataAdapter())
      ..registerAdapter(PdfSettingsModelAdapter())
      ..registerAdapter(CustomPdfViewModelAdapter())
      ..registerAdapter(FileTypeEnumAdapter())
      ..registerAdapter(HomeDirectoryPageLayoutModelAdapter())
      ..registerAdapter(PageLayoutEnumAdapter())
      ..registerAdapter(HomeDirectoryOpenPageLayoutModelAdapter())
      ..registerAdapter(ColorAdapter())
      ..registerAdapter(AllFavoritesDirectoryModelAdapter())
      ..registerAdapter(FavoritesDirectoryModelAdapter())
      ..registerAdapter(RecentFilesModelAdapter())
      ..registerAdapter(
        PublicPdfModelAdapter(),
      );
  }
}
