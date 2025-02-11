part of 'edit_pdf_cubit.dart';

mixin _EditPdfCubitMixin on Cubit<EditPdfState> {
  bool isDuplicate(List<BaseFileModel?> pdfList, PdfModel newPdf) {
    final isDuplicate = pdfList.any((pdf) => pdf?.name == newPdf.name);

    return isDuplicate;
  }
}
