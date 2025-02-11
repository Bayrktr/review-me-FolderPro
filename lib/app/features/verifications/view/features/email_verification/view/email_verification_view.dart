import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/verifications/view/features/email_verification/bloc/email_verification_cubit.dart';
import 'package:DocuSort/app/features/verifications/view/features/email_verification/bloc/email_verification_state.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerificationCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
          builder: (context, state) {
            return Padding(
              padding: context.padding.normal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LocaleText(
                    text: LocaleKeys.emailVerification_congratulations,
                    textStyle: context.theme.getTextStyle.headline1,
                  ),
                  Padding(padding: context.padding.normal),
                  const LocaleText(
                    text:
                        LocaleKeys.emailVerification_weSentYouVerificationEmail,
                  ),
                  Padding(padding: context.padding.low),
                  const LocaleText(
                    text: LocaleKeys.emailVerification_thankYouForSigningUp,
                  ),
                  Padding(padding: context.padding.high),
                  IconButton(
                    onPressed: () {
                      context.router.popAndPush(
                        SignInRoute(),
                      );
                    },
                    icon: LocaleText(
                      text: LocaleKeys.register_signInHere,
                      color: CustomColors.darkBlue.getColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
