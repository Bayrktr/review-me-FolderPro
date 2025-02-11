import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInState with EquatableMixin {
  SignInState({
    this.status = SignInStatus.start,
    this.popUpStatus = SignInPopUpStatus.initial,
    this.popUpException,
    this.isKeepSigned = true,
    this.isPasswordVisible = true,
  });

  final SignInStatus status;
  final SignInPopUpStatus popUpStatus;
  final FirebaseAuthException? popUpException;
  final bool isKeepSigned;
  final bool isPasswordVisible;

  @override
  List<Object?> get props =>
      [status, popUpStatus, isKeepSigned, isPasswordVisible];

  SignInState copyWith({
    SignInStatus? status,
    SignInPopUpStatus? popUpStatus,
    FirebaseAuthException? popUpException,
    bool? isKeepSigned,
    bool? isPasswordVisible,
  }) =>
      SignInState(
        status: status ?? this.status,
        popUpStatus: popUpStatus ?? this.popUpStatus,
        popUpException: popUpException ?? this.popUpException,
        isKeepSigned: isKeepSigned ?? this.isKeepSigned,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      );
}

enum SignInStatus {
  start,
  initial,
  loading,
  error,
}

enum SignInPopUpStatus {
  initial,
  cantBeEmpty,
  other,
  success,
}
