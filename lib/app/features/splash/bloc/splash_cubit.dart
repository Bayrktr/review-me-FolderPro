import 'dart:async';
import 'package:DocuSort/app/features/splash/bloc/splash_repository.dart';
import 'package:DocuSort/app/features/splash/bloc/splash_state.dart';
import 'package:DocuSort/app/product/init/app_init.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());


  final SplashRepository _splashRepository = SplashRepository();

  Future<void> startApp() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    try {
      await AppInit.splashInit();
      emit(
        state.copyWith(
          status: SplashStatus.finish,
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: SplashStatus.error,
        ),
      );
    }
  }



  void resetNavigatedPages() {
    emit(
      state.copyWith(
        deepLinkNavigatePages: DeepLinkNavigatePages.initial,
      ),
    );
  }

}
