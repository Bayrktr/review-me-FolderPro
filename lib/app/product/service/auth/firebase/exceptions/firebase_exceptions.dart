import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions_constant.dart';

final class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.invalidEmail:
        return const SignUpWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.userDisabled:
        return const SignUpWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.emailAlreadyInUse:
        return const SignUpWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.operationNotAllowed:
        return const SignUpWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.weakPassword:
        return const SignUpWithEmailAndPasswordFailure();
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

final class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.invalidEmail:
        return const LogInWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.userDisabled:
        return const LogInWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.userNotFound:
        return const LogInWithEmailAndPasswordFailure();
      case FirebaseExceptionsConstant.wrongPassword:
        return const LogInWithEmailAndPasswordFailure();
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

final class LogOutFailure implements Exception {}

final class EmailVerificationFailure implements Exception {
  const EmailVerificationFailure([
    this.message = '',
  ]);

  factory EmailVerificationFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.emailAlreadyVerified:
        return const EmailVerificationFailure();
      case FirebaseExceptionsConstant.expiredActionCode:
        return const EmailVerificationFailure();
      case FirebaseExceptionsConstant.invalidActionCode:
        return const EmailVerificationFailure();
      case FirebaseExceptionsConstant.internalError:
        return const EmailVerificationFailure();
      default:
        return const EmailVerificationFailure();
    }
  }

  final String message;
}

final class UserNotSignInFailure implements Exception {
  const UserNotSignInFailure([
    this.message = '',
  ]);

  final String message;
}
