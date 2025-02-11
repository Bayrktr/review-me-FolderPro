import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';

abstract class IEmailVerificationRepository {
  IFirebaseAuth get _firebaseAuth;

  Future<void> sendEmailVerification();
}

class EmailVerificationRepository implements IEmailVerificationRepository {
  @override
  IFirebaseAuth get _firebaseAuth => GetItManager.getIt<IFirebaseAuth>();

  AuthEmailMethod get _authEmailMethod => _firebaseAuth.authEmailMethod;

  @override
  Future<void> sendEmailVerification() async {
    await _authEmailMethod.sendVerificationEmail();
  }
}
