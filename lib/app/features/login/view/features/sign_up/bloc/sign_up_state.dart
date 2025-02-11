import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpState with EquatableMixin {
  const SignUpState({
    this.status = SignUpStatus.start,
    this.popUpStatus = SignUpPopUpStatus.initial,
    this.popUpException,
    this.isPasswordVisible = true,
  });

  final SignUpStatus status;
  final SignUpPopUpStatus popUpStatus;
  final FirebaseAuthException? popUpException;

  final bool isPasswordVisible;

  @override
  List<Object?> get props =>
      [status, popUpStatus, popUpException, isPasswordVisible];

  SignUpState copyWith({
    SignUpStatus? status,
    SignUpPopUpStatus? popUpStatus,
    FirebaseAuthException? popUpException,
    bool? isPasswordVisible,
  }) =>
      SignUpState(
        status: status ?? this.status,
        popUpStatus: popUpStatus ?? this.popUpStatus,
        popUpException: popUpException ?? this.popUpException,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      );
}

enum SignUpStatus {
  start,
  initial,
  loading,
  error,
}

enum SignUpPopUpStatus {
  initial,
  navigateVerify,
  cantBeEmpty,
  other,
}
