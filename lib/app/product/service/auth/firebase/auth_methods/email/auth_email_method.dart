import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions.dart';
import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthEmailMethod {
  AuthEmailMethod({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
      print('burda');
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> sendVerificationEmail() async {
    final user = _firebaseAuth.currentUser;
    print('user');
    print(user);
    try {
      if (user == null) {
        throw const EmailVerificationFailure();
      } else if (user.emailVerified) {
        print('buraya geldi');
        throw EmailVerificationFailure.fromCode(
          FirebaseExceptionsConstant.emailAlreadyVerified,
        );
      }
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw EmailVerificationFailure.fromCode(e.code);
    } catch (_) {
      throw const EmailVerificationFailure();
    }
  }
}
