import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

mixin DirectoryAddViewMixin on StatelessWidget {
  Widget getButtonWidget(
    BuildContext context,
    DirectoryAddStatus status,
  ) {
    switch (status) {
      case DirectoryAddStatus.initial:
        return LocaleText(
          text: LocaleKeys.general_save,
          textStyle: context.theme.getTextStyle.bodyText1,
        );
      case DirectoryAddStatus.loading:
        return const CircularProgressIndicator();
      case DirectoryAddStatus.error:
        return const LocaleText(text: LocaleKeys.errors_nullErrorMessage);
      case DirectoryAddStatus.start:
        return const CircularProgressIndicator();
      case DirectoryAddStatus.finish:
        return const CircularProgressIndicator();
    }
  }

  final List<FileTypeEnum> fileTypeEnumList = [
    FileTypeEnum.pdf,
  ];
}
