import 'dart:async';
import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';

class IFirebaseAuth {
  IFirebaseAuth(firebase.FirebaseAuth? firebaseAuth)
      : _firebaseAuth = firebaseAuth ?? firebase.FirebaseAuth.instance {
    _firebaseAuth.authStateChanges().listen(onAuthStateChanged);
  }

  final firebase.FirebaseAuth _firebaseAuth;

  final StreamController<UserAccountModel?> _userController =
      StreamController<UserAccountModel?>.broadcast();

  Stream<UserAccountModel?> get userStream => _userController.stream;

  Future<void> onAuthStateChanged(firebase.User? user) async {
    if (user != null) {
      await user.reload();
      _userController.add(currentUser);
    } else {
      _userController.add(null);
    }
  }


  firebase.User? get currentUserDetail {
    return _firebaseAuth.currentUser;
  }

  UserAccountModel? get currentUser {
    return _firebaseAuth.currentUser?.toAccount;
  }

  bool get isUserNull {
    return currentUser == null ? true : false;
  }

  AuthEmailMethod get authEmailMethod {
    return AuthEmailMethod(
      firebaseAuth: _firebaseAuth,
    );
  }

  Future<String?> getIdToken() async {
    if (currentUserDetail == null) return null;
    final token = await currentUserDetail!.getIdToken();
    return token;
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }

  void dispose() {
    _userController.close();
  }
}

extension on User {
  UserAccountModel? get toAccount {
   if (!emailVerified) return null;
    return UserAccountModel(
      uid: uid,
      name: displayName,
      email: email,
      isVerified: true,
    );
  }
}
