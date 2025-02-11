import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/model/pdf/public_pdf/public_pdf_model.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_buttom_bar_cubit.dart';
import 'package:DocuSort/app/product/cache/hive/import.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/bloc/custom_pdf_view_cubit.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/bloc/custom_pdf_view_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_from_enum.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part 'custom_pdf_view_mixin.dart';

class CustomPdfView extends StatefulWidget {
  const CustomPdfView({
    required this.pdfSettingsModel,
    required this.customPdfViewModel,
    required this.pdfViewerController,
    this.fileFrom = FileFromEnum.MEMORY,
    super.key,
  });

  final PdfSettingsModel pdfSettingsModel;
  final CustomPdfViewModel customPdfViewModel;
  final PdfViewerController pdfViewerController;
  final FileFromEnum? fileFrom;

  @override
  State<CustomPdfView> createState() => _CustomPdfViewState();
}

class _CustomPdfViewState extends State<CustomPdfView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomPdfViewCubit(
        widget.customPdfViewModel,
        widget.pdfSettingsModel,
        widget.pdfViewerController,
      )..initDatabase(),
      child: BlocConsumer<CustomPdfViewCubit, CustomPdfViewState>(
        builder: (context, state) {
          switch (state.status) {
            case CustomPdfViewStatus.loading:
              return _getCircularProgressIndicator();
            case CustomPdfViewStatus.initial:
              final pdfSettingsModel = state.pdfSettingsModel;
              final pdfModel = widget.customPdfViewModel.pdfModel;
              if (pdfModel is PdfModel) {
                if (pdfModel.byte == null) return _getAnUnexpectedErrorText;
                return SfPdfViewer.memory(
                  onPageChanged: (detail) {
                    context
                        .read<OpenPdfBottomBarCubit>()
                        .toggleBottomBarStatus();
                  },
                  scrollDirection: pdfSettingsModel.swipeHorizontal
                      ? PdfScrollDirection.horizontal
                      : PdfScrollDirection.vertical,
                  controller:
                      context.read<CustomPdfViewCubit>().pdfViewerController,
                  pdfModel.byte!,
                );
              } else if (pdfModel is PublicPdfModel) {
                if (pdfModel.filePath == null) return _getAnUnexpectedErrorText;
                return SfPdfViewer.network(
                  pdfModel.filePath!,
                  onPageChanged: (detail) {
                    context
                        .read<OpenPdfBottomBarCubit>()
                        .toggleBottomBarStatus();
                  },
                  scrollDirection: pdfSettingsModel.swipeHorizontal
                      ? PdfScrollDirection.horizontal
                      : PdfScrollDirection.vertical,
                  controller:
                      context.read<CustomPdfViewCubit>().pdfViewerController,
                );
              } else {
                return _getAnUnexpectedErrorText;
              }
            case CustomPdfViewStatus.error:
              return const LocaleText(
                text: LocaleKeys.customPdfView_errorWhileLoadingPdf,
              );
            default:
              return _getCircularProgressIndicator();
          }
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _getCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.redAccent,
      ),
    );
  }

  Widget get _getAnUnexpectedErrorText => LocaleText(
        text: LocaleKeys.errors_anUnexpectedProblem,
      );
}
