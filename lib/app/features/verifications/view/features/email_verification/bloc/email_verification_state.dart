import 'package:equatable/equatable.dart';

class EmailVerificationState with EquatableMixin {
  EmailVerificationState({this.status = EmailVerificationStatus.initial});

  final EmailVerificationStatus status;

  @override
  List<Object?> get props => [status];

  EmailVerificationState copyWith({EmailVerificationStatus? status}) =>
      EmailVerificationState(
        status: status ?? this.status,
      );
}

enum EmailVerificationStatus {
  initial,
  loading,
  error,
}
