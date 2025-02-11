import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/component/settings_list_tile.dart';
import 'package:DocuSort/app/features/pdf_view_settings/bloc/pdf_settings_cubit.dart';
import 'package:DocuSort/app/features/pdf_view_settings/bloc/pdf_settings_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PdfSettingsView extends StatelessWidget {
  const PdfSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => PdfSettingsCubit()..initDatabase(),
        child: BlocBuilder<PdfSettingsCubit, PdfSettingsState>(
          builder: (context, state) {
            switch (state.status) {
              case PdfSettingsStatus.start:
                return _getCenterCircularProgressIndicator();
              case PdfSettingsStatus.initial:
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sized.widthNormalValue,
                  ),
                  child: Column(
                    children: [
                      SettingsListTile(
                        leading: const Icon(
                          Icons.swap_horizontal_circle_outlined,
                        ),
                        traling: Switch(
                          value: state.pdfSettingsModel!.swipeHorizontal,
                          onChanged: (bool value) {
                            context
                                .read<PdfSettingsCubit>()
                                .updateSwipeHorizontal();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              case PdfSettingsStatus.loading:
                return _getCenterCircularProgressIndicator();
              case PdfSettingsStatus.error:
                return const LocaleText(text: '');
            }
          },
        ),
      ),
    );
  }

  Widget _getCenterCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
