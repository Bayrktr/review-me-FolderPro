import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/bloc/public_home_directory_open_repository.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/view/features/public_home_directory_open/bloc/public_home_directory_open_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicHomeDirectoryOpenCubit extends Cubit<PublicHomeDirectoryOpenState> {
  PublicHomeDirectoryOpenCubit(this._repository)
      : super(PublicHomeDirectoryOpenState());

  final PublicHomeDirectoryOpenRepository _repository;

  Future<void> init() async {
    emit(
      state.copyWith(
        status: PublicHomeDirectoryOpenStatus.loading,
      ),
    );
    final files = await _repository.getFiles();
    emit(
      state.copyWith(
        files: files,
      ),
    );
    _resetStatus();
  }

  void _resetStatus() {
    emit(
      state.copyWith(
        status: PublicHomeDirectoryOpenStatus.initial,
      ),
    );
  }
}
