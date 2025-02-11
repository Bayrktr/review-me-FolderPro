import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class FirebaseExceptionsConstant {
  static const String invalidEmail = 'invalid-email';
  static const String userDisabled = 'user-disabled';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String weakPassword = 'weak-password';
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String internalError = 'internal-error';
  static const String sessionExpired = 'session-expired';
  static const String expiredActionCode = 'expired-action-code';
  static const String invalidActionCode = 'invalid-action-code';
  static const String emailAlreadyVerified = 'email-already-verified';
  static const String objectNotFound = 'object-not-found';
  static const String unauthorized = 'unauthorized';
  static const String unauthenticated = 'unauthenticated';
  static const String invalidArgument = 'invalid-argument';
  static const String retryLimitExceeded = 'retry-limit-exceeded';
  static const String unknown = 'unknown';
}
