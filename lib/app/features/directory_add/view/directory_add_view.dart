import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_cubit.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_state.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/directory_add/view/component/file_type_selection_drop_down_button.dart';
import 'package:DocuSort/app/features/directory_add/view/directory_add_view_mixin.dart';
import 'package:DocuSort/app/product/component/alert_dialog/custom_pop_up.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:DocuSort/app/product/utility/validator/text_form_field_validator.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DirectoryAddView extends StatelessWidget with DirectoryAddViewMixin {
  DirectoryAddView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      body: BlocProvider(
        create: (_) => DirectoryAddCubit()..initDatabase(),
        child: BlocConsumer<DirectoryAddCubit, DirectoryAddState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sized.widthHighValue,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: context
                          .read<DirectoryAddCubit>()
                          .directoryNameController,
                      onChanged: (String? value) {
                        context
                            .read<DirectoryAddCubit>()
                            .updateDirectoryName(value);
                      },
                      textAlign: TextAlign.center,
                      validator: (value) {
                        return TextFormFieldValidator(value: value)
                            .getEmptyCheckValidator;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FileTypeSelectionDropDownButton(
                      selectedItem: state.selectedFileTypeEnum,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all<Size>(
                          Size(
                            context.sized.dynamicWidth(0.3),
                            context.sized.heightMediumValue,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<DirectoryAddCubit>().updateAllDirectory(
                                DirectoryModel(
                                  id: IdGenerator.randomStringId,
                                  name: context
                                      .read<DirectoryAddCubit>()
                                      .directoryNameController
                                      .text,
                                  fileListKey: IdGenerator.randomStringId,
                                  fileTypeEnum: state.selectedFileTypeEnum,
                                ),
                              );
                        }
                      },
                      label: getButtonWidget(
                        context,
                        state.status,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state.popUpStatus == DirectoryAddPopUpStatus.show) {
              IShowDialog(
                context: context,
                widget: CustomPopup(
                  title: context
                      .read<DirectoryAddCubit>()
                      .directoryNameController
                      .text,
                  message:
                      state.popUpStatusMessage.forNull.getGeneralNullMessage,
                  onConfirm: () {
                    context.router.maybePop();
                  },
                ),
              ).getDialog();
            }
            if (state.status == DirectoryAddStatus.finish) {
              context.router.pushAndPopUntil(
                const HomeRoute(
                  children: [
                    HomeDirectoryRoute(),
                  ],
                ),
                predicate: (Route<dynamic> route) {
                  return false;
                },
              );
            }
          },
        ),
      ),
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
  }) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const LocaleText(text: LocaleKeys.directoryAdd_directoryAdd),
      leading: IconButton(
        onPressed: () {
          context.router.maybePop();
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
