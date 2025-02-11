import 'package:DocuSort/app/features/home/view/features/public_home_directory/bloc/public_home_directory_repository.dart';
import 'package:DocuSort/app/features/home/view/features/public_home_directory/bloc/public_home_directory_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicHomeDirectoryCubit extends Cubit<PublicHomeDirectoryState> {
  PublicHomeDirectoryCubit() : super(const PublicHomeDirectoryState());

  final PublicHomeDirectoryRepository _publicHomeDirectoryRepository =
      PublicHomeDirectoryRepository();

  Future<void> initDatabase() async {
    await getDirectoryList();
  }

  Future<void> getDirectoryList() async {
    print('kullanıcı kontrol');
    print(_publicHomeDirectoryRepository.userCheck);
    if (_publicHomeDirectoryRepository.userCheck) {
      return;
    }
    emit(
      state.copyWith(
        status: PublicHomeDirectoryStatus.loading,
      ),
    );

    try {
      final response = await _publicHomeDirectoryRepository.getAllDirectory();
      print('response');
      for(final x in response!){
        print('id : ${x?.id}');
        print('fileListKey : ${x?.fileListKey}');
      }

      emit(
        state.copyWith(
          status: PublicHomeDirectoryStatus.initial,
          allDirectory: response,
        ),
      );
      print('alındı');
    } on FirebaseException catch (e) {
      print('hata aldık');
      print(e);
      //fixme
    } catch (_) {
      //fixme
    }
  }
}
