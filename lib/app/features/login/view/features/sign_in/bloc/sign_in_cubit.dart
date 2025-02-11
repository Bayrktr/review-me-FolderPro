import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_repository.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_state.dart';
import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  final SignInRepository _signInRepository = SignInRepository();

  UserAccountModel? get accountModel => _signInRepository.accountModel;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: SignInStatus.initial,
      ),
    );
  }

  Future<void> signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          popUpStatus: SignInPopUpStatus.cantBeEmpty,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
    try {
      await _signInRepository.logOut(); // fixme
      await _signInRepository.signIn(email: email, password: password);

      if (accountModel != null) {
        emit(
          state.copyWith(
            popUpStatus: SignInPopUpStatus.success,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          popUpException: e,
          popUpStatus: SignInPopUpStatus.other,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SignInStatus.error,
        ),
      );
    }
  }

  void updateEmailController(String? value) {
    if (value == null) return;
    _emailController.text = value;
  }

  void updatePasswordController(String? value) {
    if (value == null) return;
    _passwordController.text = value;
  }

  void changeKeepSigned() {
    emit(
      state.copyWith(isKeepSigned: !state.isKeepSigned),
    );
  }

  void changePasswordVisible() {
    emit(
      state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ),
    );
  }
}
