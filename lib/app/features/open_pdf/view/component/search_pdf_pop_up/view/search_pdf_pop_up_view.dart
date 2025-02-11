import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/search_pdf_pop_up/bloc/search_pdf_pop_up_cubit.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/search_pdf_pop_up/bloc/search_pdf_pop_up_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SearchPdfPopUpView extends StatefulWidget {

  const SearchPdfPopUpView({
    required this.pdfViewerController, super.key,
  });
  final PdfViewerController pdfViewerController;

  @override
  State<SearchPdfPopUpView> createState() => _SearchPdfPopUpViewState();
}

class _SearchPdfPopUpViewState extends State<SearchPdfPopUpView> {
  final TextEditingController _searchPdfController = TextEditingController();

  @override
  void dispose() {
    _searchPdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: BlocProvider(
        create: (_) => SearchPdfPopUpCubit(_searchPdfController),
        child: BlocConsumer<SearchPdfPopUpCubit, SearchPdfPopUpState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _searchPdfController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.openPdf_enterTextToSearch.lang.tr,
                  ),
                  onChanged: (String? value) {
                    context.read<SearchPdfPopUpCubit>().updateText(value);
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  label: const LocaleText(
                    text: LocaleKeys.general_search,
                  ),
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    context.read<SearchPdfPopUpCubit>().updateSelectedWord(
                          widget.pdfViewerController.searchText(
                            _searchPdfController.text,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<SearchPdfPopUpCubit>()
                              .previousInstance();
                        },
                        child: const LocaleText(
                          text: LocaleKeys.general_previous,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<SearchPdfPopUpCubit>().nextInstance();
                        },
                        child: const LocaleText(
                          text: LocaleKeys.general_next,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          listener: (BuildContext context, SearchPdfPopUpState state) {},
        ),
      ),
    );
  }
}
