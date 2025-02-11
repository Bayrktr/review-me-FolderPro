import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class ISignInRepository {
  IFirebaseAuth get _firebaseAuth;

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> reload();
}

class SignInRepository implements ISignInRepository {
  @override
  final IFirebaseAuth _firebaseAuth = GetItManager.getIt<IFirebaseAuth>();

  AuthEmailMethod get _authEmailMethod => _firebaseAuth.authEmailMethod;

  UserAccountModel? get accountModel => _firebaseAuth.currentUser;

  firebase.User? get accountDetail => _firebaseAuth.currentUserDetail;

  void authStateChange() {
    print('account detail: $accountDetail');
    _firebaseAuth.onAuthStateChanged(
      accountDetail,
    );
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _authEmailMethod.signIn(email: email, password: password);
  }

  Future<void> logOut() async{
    await _firebaseAuth.logOut();
  }

  @override
  Future<void> reload() async {
    await accountDetail?.reload();
  }
}
