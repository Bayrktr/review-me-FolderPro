import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_cubit.dart';
import 'package:DocuSort/app/features/login/view/features/sign_up/bloc/sign_up_cubit.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInCubit()..initDatabase(),
        ),
        BlocProvider(
          create: (_) => SignUpCubit()..initDatabase(),
        ),
      ],
      child: AutoTabsRouter.tabBar(
        routes: [
          SignInRoute(),
          SignUpRoute(),
        ],
        builder: (context, child, tabController) {
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
            ),
            body: child,
          );
        },
      ),
    );
  }
}
