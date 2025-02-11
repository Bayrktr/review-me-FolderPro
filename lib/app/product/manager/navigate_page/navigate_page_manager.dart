import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/import.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:auto_route/auto_route.dart';

final class NavigatePageManager {
  const NavigatePageManager();

  PageRouteInfo<dynamic> getOpenFileNavigatePageRoute(
    FileTypeEnum? fileTypeEnum, {
    BaseFileModel? fileBaseModel,
  }) {
    switch (fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return OpenPdfRoute(
          pdfModel: fileBaseModel,
        );
    }
  }

  PageRouteInfo<dynamic> getAddFileNavigatePageRoute(
    BaseDirectoryModel? directoryModel,
  ) {
    switch (directoryModel?.fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return AddPdfRoute(
          directoryModel: directoryModel,
        );
    }
  }
}
