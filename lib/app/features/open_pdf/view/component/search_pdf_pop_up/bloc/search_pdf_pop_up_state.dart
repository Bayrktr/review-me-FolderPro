import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SearchPdfPopUpState with EquatableMixin {
  SearchPdfPopUpState({
    this.status = SearchPdfPopUpStatus.initial,
    this.pdfTextSearchResult,
  });

  final SearchPdfPopUpStatus status;
  final PdfTextSearchResult? pdfTextSearchResult;

  @override
  List<Object?> get props => [
        status,
        pdfTextSearchResult,
      ];

  SearchPdfPopUpState copyWith({
    SearchPdfPopUpStatus? status,
    PdfTextSearchResult? pdfTextSearchResult,
  }) =>
      SearchPdfPopUpState(
        status: status ?? this.status,
        pdfTextSearchResult: pdfTextSearchResult ?? this.pdfTextSearchResult,
      );
}

enum SearchPdfPopUpStatus {
  initial,
}
