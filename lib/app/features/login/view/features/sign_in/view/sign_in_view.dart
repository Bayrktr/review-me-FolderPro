import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/login/view/component/continue_with_google.dart';
import 'package:DocuSort/app/features/login/view/component/divider_with_text.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_cubit.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/utility/validator/text_form_field_validator.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state.status) {
            SignInStatus.start => _getCircularProgressIndicator,
            SignInStatus.initial => Form(
                key: _formKey,
                child: Padding(
                  padding: context.padding.normal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocaleText(
                        text: LocaleKeys.login_login,
                        textStyle: context.theme.getTextStyle.headline1,
                      ),
                      Padding(padding: context.padding.medium),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleText(
                            text: LocaleKeys.login_emailAdress,
                            textStyle:
                                context.theme.getTextStyle.mediumBodyText1,
                          ),
                          Padding(padding: context.padding.low),
                          TextFormField(
                            validator: (String? value) {
                              return TextFormFieldValidator(value: value)
                                  .getUsableEmailValidator;
                            },
                            onChanged: (String? value) {
                              context
                                  .read<SignInCubit>()
                                  .updateEmailController(value);
                            },
                            controller:
                                context.read<SignInCubit>().emailController,
                            decoration: _formFieldInputDecoration,
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.normal),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LocaleText(
                                text: LocaleKeys.login_password,
                                textStyle:
                                    context.theme.getTextStyle.mediumBodyText1,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const LocaleText(
                                  text: LocaleKeys.login_forgotPassword,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: context.padding.low),
                          TextFormField(
                            obscureText: !state.isPasswordVisible,
                            onChanged: (String? value) {
                              context
                                  .read<SignInCubit>()
                                  .updatePasswordController(value);
                            },
                            controller:
                                context.read<SignInCubit>().passwordController,
                            decoration: _formFieldInputDecoration.copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<SignInCubit>()
                                      .changePasswordVisible();
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
                          IconButton(
                            onPressed: () {
                              context.read<SignInCubit>().changeKeepSigned();
                            },
                            icon: Icon(
                              state.isKeepSigned
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                          ),
                          const LocaleText(
                            text: LocaleKeys.login_keepMeSignIn,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<SignInCubit>().signIn(
                                    );
                              },
                              child: Padding(
                                padding: context.padding.low,
                                child: LocaleText(
                                  color: Colors.white,
                                  text: LocaleKeys.login_login,
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
                        text: LocaleKeys.login_orSignInWith.lang.tr,
                      ),
                      Padding(padding: context.padding.low),
                      const ContinueWithGoogle(),
                      Padding(padding: context.padding.low),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            context.tabsRouter.setActiveIndex(1);
                          },
                          icon: LocaleText(
                            text: LocaleKeys.login_createAnAccount,
                            color: CustomColors.darkBlue.getColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SignInStatus.loading => _getCircularProgressIndicator,
            SignInStatus.error => _getCircularProgressIndicator,
          },
        );
      },
      listener: (context, state) {
        switch (state.popUpStatus) {
          case SignInPopUpStatus.initial:
            break;
          case SignInPopUpStatus.cantBeEmpty:
            break;
          case SignInPopUpStatus.other:
            break;
          case SignInPopUpStatus.success:
            context.router.pushAndPopUntil(
              ProfileRoute(),
              predicate: (_) => false,
            );
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
