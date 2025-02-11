part of 'search_file_view.dart';


mixin _SearchFileMixin on StatelessWidget{
  PageRouteInfo<dynamic> getNavigatePageRoute(
      FileTypeEnum? fileTypeEnum, {
        BaseFileModel? fileBaseModel,
      }) {
    switch (fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        if (fileBaseModel is! PdfModel) return const GeneralErrorRoute();
        return OpenPdfRoute(
          pdfModel: fileBaseModel,
        );
    }
  }
}