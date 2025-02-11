import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/edit_pdf/bloc/edit_pdf_cubit.dart';
import 'package:DocuSort/app/features/edit_pdf/bloc/edit_pdf_state.dart';
import 'package:DocuSort/app/features/edit_pdf/view/component/edit_pdf_snack_bar.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:DocuSort/app/product/utility/validator/text_form_field_validator.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditPdfView extends StatelessWidget {
  EditPdfView({super.key, this.directoryModel, this.pdfModel});

  final PdfModel? pdfModel;

  final BaseDirectoryModel? directoryModel;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditPdfCubit(
        directoryModel,
        PdfRepository(directoryModel?.fileListKey),
        pdfModel,
      )..initDatabase(),
      child: BlocConsumer<EditPdfCubit, EditPdfState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              title: LocaleText(
                text: LocaleKeys.editFile_editFile,
                args: [
                  FileTypeEnum.pdf.getFileName,
                ],
              ),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.widthNormalValue,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller:
                          context.read<EditPdfCubit>().fileNameController,
                      onChanged: (String? value) {
                        context.read<EditPdfCubit>().updateFileName(value);
                      },
                      textAlign: TextAlign.center,
                      validator: (value) {
                        return TextFormFieldValidator(value: value)
                            .getEmptyCheckValidator;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if ((_formKey.currentState?.validate() ?? false) &&
                            state.status == EditPdfStatus.initial) {
                          context.read<EditPdfCubit>().updatePdf();
                        }
                      },
                      child: const LocaleText(
                        text: LocaleKeys.general_save,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          switch (state.savePdfStatus) {
            case SavePdfStatus.initial:
              break;
            case SavePdfStatus.alreadyExist:
              EditPdfSnackBar(
                color: Colors.redAccent,
                message:
                    LocaleKeys.editPdf_thereIsAnotherPdfWithThisName.lang.tr,
              ).show(context);
            case SavePdfStatus.success:
              //  context.read<HomeDirectoryOpenCubit>().initDatabase();
              context.router.popAndPush(
                HomeDirectoryOpenRoute(
                  directoryModel: directoryModel,
                ),
              );

          }
        },
      ),
    );
  }
}
