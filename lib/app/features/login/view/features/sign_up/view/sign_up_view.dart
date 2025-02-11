import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/login/view/component/continue_with_google.dart';
import 'package:DocuSort/app/features/login/view/component/divider_with_text.dart';
import 'package:DocuSort/app/features/login/view/features/sign_up/bloc/sign_up_cubit.dart';
import 'package:DocuSort/app/features/login/view/features/sign_up/bloc/sign_up_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state.status) {
            SignUpStatus.start => _getCircularProgressIndicator,
            SignUpStatus.initial => Form(
                key: _formKey,
                child: Padding(
                  padding: context.padding.normal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocaleText(
                        text: LocaleKeys.register_createAnAccount,
                        textStyle: context.theme.getTextStyle.headline1,
                      ),
                      Padding(padding: context.padding.normal),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleText(
                            text: LocaleKeys.register_name,
                            textStyle:
                                context.theme.getTextStyle.mediumBodyText1,
                          ),
                          Padding(padding: context.padding.veryLow),
                          TextFormField(
                            onChanged: (String? value) {
                              context
                                  .read<SignUpCubit>()
                                  .updateNameController(value);
                            },
                            controller:
                                context.read<SignUpCubit>().nameController,
                            decoration: _formFieldInputDecoration,
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.normal),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleText(
                            text: LocaleKeys.login_emailAdress,
                            textStyle:
                                context.theme.getTextStyle.mediumBodyText1,
                          ),
                          Padding(padding: context.padding.veryLow),
                          TextFormField(
                            onChanged: (String? value) {
                              context
                                  .read<SignUpCubit>()
                                  .updateEmailController(value);
                            },
                            controller:
                                context.read<SignUpCubit>().emailController,
                            decoration: _formFieldInputDecoration,
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.normal),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleText(
                            text: LocaleKeys.register_password,
                            textStyle:
                                context.theme.getTextStyle.mediumBodyText1,
                          ),
                          Padding(padding: context.padding.veryLow),
                          TextFormField(
                            obscureText: !state.isPasswordVisible,
                            onChanged: (String? value) {
                              context
                                  .read<SignUpCubit>()
                                  .updatePasswordController(value);
                            },
                            controller:
                                context.read<SignUpCubit>().passwordController,
                            decoration: _formFieldInputDecoration.copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<SignUpCubit>()
                                      .updatePasswordVisible();
                                },
                                icon: Icon(
                                  state.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.low),
                      Row(
                        children: [
                          const LocaleText(
                            text: LocaleKeys.register_byContinuingYouAgreeToOur,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: LocaleText(
                              text: LocaleKeys.register_termsOfService,
                              color: CustomColors.darkBlue.getColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<SignUpCubit>().signUp();
                              },
                              child: Padding(
                                padding: context.padding.low,
                                child: LocaleText(
                                  color: Colors.white,
                                  text: LocaleKeys.register_signUp,
                                  textStyle:
                                      context.theme.getTextStyle.highBodyText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.low),
                      DividerWithText(
                        text: LocaleKeys.register_or.lang.tr,
                      ),
                      Padding(padding: context.padding.low),
                      const ContinueWithGoogle(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LocaleText(
                            text: LocaleKeys.register_alreadyHaveAnAccount,
                          ),
                          IconButton(
                            onPressed: () {
                              context.tabsRouter.setActiveIndex(0);
                            },
                            icon: LocaleText(
                              color: CustomColors.darkBlue.getColor,
                              text: LocaleKeys.register_signInHere,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            SignUpStatus.loading => _getCircularProgressIndicator,
            SignUpStatus.error => _getCircularProgressIndicator,
          },
        );
      },
      listener: (BuildContext context, state) {
        switch (state.popUpStatus) {
          case SignUpPopUpStatus.initial:
            break;
          case SignUpPopUpStatus.navigateVerify:
            context.router.popAndPush(const EmailVerificationRoute());
          case SignUpPopUpStatus.cantBeEmpty:
            break;
          case SignUpPopUpStatus.other:
            break;
        }
      },
    );
  }

  Widget get _getCircularProgressIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  InputDecoration get _formFieldInputDecoration => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      );
}
