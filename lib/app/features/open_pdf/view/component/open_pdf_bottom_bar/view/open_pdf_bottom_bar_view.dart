import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/open_pdf/bloc/open_pdf_cubit.dart';
import 'package:DocuSort/app/features/open_pdf/bloc/open_pdf_state.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_bottom_bar_state.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_buttom_bar_cubit.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/search_pdf_pop_up/view/search_pdf_pop_up_view.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OpenPdfBottomBarView extends StatelessWidget {
  const OpenPdfBottomBarView({
    required this.pdfViewerController, super.key,
  });

  final PdfViewerController pdfViewerController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OpenPdfBottomBarCubit, OpenPdfBottomBarState>(
      builder: (context, state) {
        switch (state.isShow) {
          case true:
            return Container(
              height: context.sized.dynamicHeight(0.08),
              decoration: BoxDecoration(
                color: context.theme.getColor.borderColor.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: context.theme.getColor.iconColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: context.theme.getColor.iconColor,
                    ),
                  ),
                  _getSearchButton(),
                ],
              ),
            );
          case false:
            return const SizedBox();
        }
      },
      listener: (context, state) {},
    );
  }

  Widget _getSearchButton() {
    return BlocBuilder<OpenPdfCubit, OpenPdfState>(
      builder: (context, state) {
        switch (state.status) {
          case OpenPdfStatus.start:
            return const SizedBox();
          case OpenPdfStatus.initial:
            return IconButton(
              onPressed: () {
                IShowDialog(
                  context: context,
                  widget: SearchPdfPopUpView(
                    pdfViewerController: pdfViewerController,
                  ),
                ).getDialog();
              },
              icon: Icon(
                Icons.search,
                color: context.theme.getColor.iconColor,
              ),
            );
          case OpenPdfStatus.loading:
          case OpenPdfStatus.error:
            return const SizedBox();
        }
      },
    );
  }
}
