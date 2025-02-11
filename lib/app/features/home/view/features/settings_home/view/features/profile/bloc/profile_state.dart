import 'package:equatable/equatable.dart';

class ProfileState with EquatableMixin {
  ProfileState({
    this.status = ProfileStatus.start,
  });

  final ProfileStatus status;

  @override
  List<Object?> get props => [status];

  ProfileState copyWith({
    ProfileStatus? status,
  }) =>
      ProfileState(
        status: status ?? this.status,
      );
}

enum ProfileStatus {
  start,
  initial,
  loading,
  error,
}
