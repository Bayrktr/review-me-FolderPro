import 'dart:async';

import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_bottom_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenPdfBottomBarCubit extends Cubit<OpenPdfBottomBarState> {
  OpenPdfBottomBarCubit() : super(OpenPdfBottomBarState());

  Future<void> toggleBottomBarStatus() async {
    if (state.isShow) return;

    _changeIsShow();

    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (isClosed) return;
    _changeIsShow();
  }

  void _changeIsShow() {
    emit(
      state.copyWith(
        isShow: !state.isShow,
      ),
    );
  }
}
