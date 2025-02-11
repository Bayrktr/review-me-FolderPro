import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/component/settings_list_tile.dart';
import 'package:DocuSort/app/product/bloc/user_account/user_account_cubit.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userAccountState = context.watch<UserAccountCubit>().state;
    final isSigned = userAccountState.checkUser;

    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.widthNormalValue,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            if (isSigned)
              SettingsListTile(
                title:
                const LocaleText(text: LocaleKeys.login_editMyProfile),
                onTap: () {
                  //fixme
                },
                leading: const Icon(Icons.person),
                traling: const Icon(Icons.edit),
              )
            else
              const SizedBox(),
            SettingsListTile(
              title: LocaleText(
                text: isSigned
                    ? LocaleKeys.login_logout
                    : LocaleKeys.login_signIn,
              ),
              onTap: () {
                isSigned
                    ? FirebaseAuth.instance.signOut()
                    : context.router.push(SignInRoute());
              },
              leading: const Icon(Icons.login),
              traling: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar({required BuildContext context}) => AppBar(
        leading: IconButton(
          onPressed: () {
            context.tabsRouter.setActiveIndex(0);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      );
}
