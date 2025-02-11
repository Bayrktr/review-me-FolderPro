import 'package:DocuSort/app/features/home/view/features/public_home_directory/model/public_directory_model.dart';
import 'package:equatable/equatable.dart';

class PublicHomeDirectoryState with EquatableMixin {
  const PublicHomeDirectoryState({
    this.status = PublicHomeDirectoryStatus.start,
    this.allDirectory = const [],
  });

  final PublicHomeDirectoryStatus status;
  final List<PublicDirectoryModel?> allDirectory;

  @override
  List<Object?> get props => [status, allDirectory];

  PublicHomeDirectoryState copyWith({
    PublicHomeDirectoryStatus? status,
    List<PublicDirectoryModel?>? allDirectory,
  }) =>
      PublicHomeDirectoryState(
        status: status ?? this.status,
        allDirectory: allDirectory ?? this.allDirectory,
      );
}

enum PublicHomeDirectoryStatus {
  start,
  initial,
  loading,
  error,
}
