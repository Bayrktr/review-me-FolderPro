import 'package:DocuSort/app/core/extention/navigation/navigation_extention.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin AddPdfMixin on StatelessWidget {
  Widget saveButtonWidget(AddPdfStatus status) {
    switch (status) {
      case AddPdfStatus.start:
        return const CircularProgressIndicator();
      case AddPdfStatus.initial:
        return const LocaleText(
          text: LocaleKeys.general_save,
        );
      case AddPdfStatus.loading:
        return const CircularProgressIndicator();
      case AddPdfStatus.error:
        return const Icon(Icons.error);
      case AddPdfStatus.finish:
        return const CircularProgressIndicator();
    }
  }

  void navigatePage({
    required BuildContext context,
    required BaseDirectoryModel? directoryModel,
  }) {
    final previousRoute = context.router.previousRoutePath;

    print(previousRoute);
    switch (previousRoute) {
      case null:
        context.router.maybePop();

      case 'HomePdfRoute':
        print('home pdf router');
        context.router.maybePop();
      case 'EditDirectoryRoute':
        print('edit directory router');
        context.router.popUntil((route) => route.settings.name == 'HomeRoute');
        context.router.push(
          EditDirectoryRoute(
            directoryModel: directoryModel,
          ),
        );
      case 'HomeDirectoryOpenRoute':
        print('HomeDirectoryOpenRoute');
        context.router.popUntil((route) => route.settings.name == 'HomeRoute');
        context.router.push(
          HomeDirectoryOpenRoute(
            directoryModel: directoryModel,
          ),
        );
      default:
        context.router.maybePop();
    }
  }
}
