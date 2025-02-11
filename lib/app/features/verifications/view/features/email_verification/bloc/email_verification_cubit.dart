import 'package:DocuSort/app/features/verifications/view/features/email_verification/bloc/email_verification_repository.dart';
import 'package:DocuSort/app/features/verifications/view/features/email_verification/bloc/email_verification_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationState());

  final EmailVerificationRepository _emailVerificationRepository =
      EmailVerificationRepository();

  Future<void> init() async {
    await sendEmailVerification();
  }

  Future<void> sendEmailVerification() async {
    try {
      await _emailVerificationRepository.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (_) {
      print('burda');
      print(_);
    }
  }
}
