import 'package:DocuSort/app/features/login/view/features/sign_up/bloc/sign_up_repository.dart';
import 'package:DocuSort/app/features/login/view/features/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  final SignUpRepository _signUpRepository = SignUpRepository();

  final TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: SignUpStatus.initial,
      ),
    );
  }

  Future<void> signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          popUpStatus: SignUpPopUpStatus.cantBeEmpty,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: SignUpStatus.loading,
      ),
    );
    try {
      await _signUpRepository.signUp(email: email, password: password);
      emit(
        state.copyWith(
          popUpStatus: SignUpPopUpStatus.navigateVerify,
        ),
      );
      resetAll;
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          popUpException: e,
          popUpStatus: SignUpPopUpStatus.other,
        ),
      );
      resetAll;
    } catch (_) {
      emit(
        state.copyWith(
          status: SignUpStatus.error,
        ),
      );
    }
  }

  void updateNameController(String? value) {
    if (value == null) return;
    _nameController.text = value;
  }

  void updateEmailController(String? value) {
    if (value == null) return;
    _emailController.text = value;
  }

  void updatePasswordController(String? value) {
    if (value == null) return;
    _passwordController.text = value;
  }

  void updatePasswordVisible() {
    emit(
      state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ),
    );
  }

  void get resetAll {
    emit(
      state.copyWith(
        status: SignUpStatus.initial,
        popUpStatus: SignUpPopUpStatus.initial,
      ),
    );
  }
}
