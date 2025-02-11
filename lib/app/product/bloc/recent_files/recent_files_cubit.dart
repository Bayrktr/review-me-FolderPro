import 'package:DocuSort/app/product/bloc/recent_files/recent_files_repository.dart';
import 'package:DocuSort/app/product/bloc/recent_files/recent_files_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentFilesCubit extends Cubit<RecentFilesState> {
  RecentFilesCubit() : super(RecentFilesState());

  final RecentFilesRepository _recentFilesRepository = RecentFilesRepository();

  Future<void> initDatabase() async {
    print('calıstım');
    await _recentFilesRepository.initDatabase();
    final recentFilesModel = _recentFilesRepository.recentFilesModel;
    print('recentFiles: $recentFilesModel');
    emit(
      state.copyWith(
        recentFiles: recentFilesModel!.allRecentFiles,
      ),
    );
  }
}
