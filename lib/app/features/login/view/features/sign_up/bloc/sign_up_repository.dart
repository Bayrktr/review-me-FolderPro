import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';

abstract class ISignUpRepository {
  IFirebaseAuth get _firebaseAuth;

  Future<void> signUp({
    required String email,
    required String password,
  });
}

class SignUpRepository implements ISignUpRepository {
  @override
  IFirebaseAuth get _firebaseAuth => GetItManager.getIt<IFirebaseAuth>();

  AuthEmailMethod get _authEmailMethod => _firebaseAuth.authEmailMethod;

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _authEmailMethod.signUp(email: email, password: password);
  }
}
