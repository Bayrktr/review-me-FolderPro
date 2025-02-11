part of 'add_pdf_cubit.dart';

mixin _AddPdfCubitMixin on Cubit<AddPdfState> {
  bool isAlreadyExist(
    List<PdfModel?>? pdfModelList,
    PdfModel pdfModel,
  ) {
    final isAlreadyExist =
        pdfModelList!.any((element) => element?.name == pdfModel.name);
    return isAlreadyExist;
  }
}
