import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

class PublicHomeDirectoryOpenState with EquatableMixin {
  PublicHomeDirectoryOpenState({
    this.status = PublicHomeDirectoryOpenStatus.initial,
    this.files = const [],
  });

  final PublicHomeDirectoryOpenStatus status;
  final List<BaseFileModel?> files;

  @override
  List<Object?> get props => [status, files];

  PublicHomeDirectoryOpenState copyWith({
    PublicHomeDirectoryOpenStatus? status,
    List<BaseFileModel?>? files,
  }) =>
      PublicHomeDirectoryOpenState(
        status: status ?? this.status,
        files: files ?? this.files,
      );
}

enum PublicHomeDirectoryOpenStatus {
  start,
  initial,
  loading,
  error,
}
