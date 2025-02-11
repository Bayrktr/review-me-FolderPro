import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions_constant.dart';

final class CloudStoragePutFileFailure implements Exception {
  const CloudStoragePutFileFailure([this.message = '']);

  factory CloudStoragePutFileFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.objectNotFound:
        return const CloudStoragePutFileFailure();

      case FirebaseExceptionsConstant.unauthorized:
        return const CloudStoragePutFileFailure();
      case FirebaseExceptionsConstant.unauthenticated:
        return const CloudStoragePutFileFailure();
      case FirebaseExceptionsConstant.invalidArgument:
        return const CloudStoragePutFileFailure();

      case FirebaseExceptionsConstant.retryLimitExceeded:
        return const CloudStoragePutFileFailure();

      default:
        return const CloudStoragePutFileFailure();
    }
  }

  final String message;
}

final class CloudStorageDeleteFailure implements Exception {
  const CloudStorageDeleteFailure([this.message = '']);

  factory CloudStorageDeleteFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.objectNotFound:
        return const CloudStorageDeleteFailure();

      case FirebaseExceptionsConstant.unauthorized:
        return const CloudStorageDeleteFailure();
      case FirebaseExceptionsConstant.unauthenticated:
        return const CloudStorageDeleteFailure();
      case FirebaseExceptionsConstant.invalidArgument:
        return const CloudStorageDeleteFailure();

      default:
        return const CloudStorageDeleteFailure();
    }
  }

  final String message;
}
