import 'package:DocuSort/app/features/open_pdf/view/component/search_pdf_pop_up/bloc/search_pdf_pop_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SearchPdfPopUpCubit extends Cubit<SearchPdfPopUpState> {
  SearchPdfPopUpCubit(
    this._searchPdfController,
  ) : super(SearchPdfPopUpState());

  final TextEditingController _searchPdfController;

  TextEditingController get searchPdfController => _searchPdfController;

  void updateText(String? value) {
    if (value == null) return;
    searchPdfController.text = value;
  }

  void updateSelectedWord(PdfTextSearchResult? result) {

    emit(
      state.copyWith(
        pdfTextSearchResult: result,
      ),
    );


    /*
    // Find instances on the current page
    int firstInstanceOnCurrentPage = state.pdfTextSearchResult..indexWhere(
          (status) => status.pageIndex == _currentPageIndex,
    );

    if (firstInstanceOnCurrentPage != -1) {
      _pdfViewerController.jumpToInstance(firstInstanceOnCurrentPage + 1);
    } else if (_searchResult.totalInstanceCount > 0) {
      // Fallback to default behavior if no instances on the current page
      _pdfViewerController.jumpToInstance(1);
    }

     */
  }

  void nextInstance() {
    final result = state.pdfTextSearchResult;

    if (result == null || result.totalInstanceCount <= 0) return;
    result.nextInstance();
    print(result.totalInstanceCount);
  }

  void previousInstance() {
    final result = state.pdfTextSearchResult;

    if (result == null || result.totalInstanceCount <= 0) return;
    result.previousInstance();
  }
}
