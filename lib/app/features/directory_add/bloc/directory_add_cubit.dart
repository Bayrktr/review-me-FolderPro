import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_cubit_mixin.dart';
import 'package:DocuSort/app/features/directory_add/bloc/directory_add_state.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectoryAddCubit extends Cubit<DirectoryAddState>
    with DirectoryAddCubitMixin {
  DirectoryAddCubit() : super(DirectoryAddState());

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final TextEditingController _directoryNameController =
      TextEditingController();

  TextEditingController get directoryNameController => _directoryNameController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: DirectoryAddStatus.loading,
      ),
    );
    await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);

    emit(
      state.copyWith(
        status: DirectoryAddStatus.initial,
      ),
    );
  }

  void updateDirectoryName(String? value) {
    if (value == null) return;
    directoryNameController.text = value;
  }

  void updateSelectedFileTypeEnum(FileTypeEnum? fileTypeEnum) {
    if (fileTypeEnum == null) return;
    emit(
      state.copyWith(
        selectedFileTypeEnum: fileTypeEnum,
      ),
    );
  }

  void allReset() {
    resetPopUpStatus();
    resetStatus();
  }

  void resetPopUpStatus() {
    emit(
      state.copyWith(
        popUpStatus: DirectoryAddPopUpStatus.initial,
      ),
    );
  }

  void resetStatus() {
    emit(
      state.copyWith(
        status: DirectoryAddStatus.initial,
      ),
    );
  }

  Future<void> updateAllDirectory(DirectoryModel? newDirectoryModel) async {
    emit(
      state.copyWith(
        status: DirectoryAddStatus.loading,
      ),
    );

    final response =
        _allDirectoryOperation.getItem(AllDirectoryModel.allDirectoryKey);

    if (response?.allDirectory == null || newDirectoryModel == null) {
      emit(
        state.copyWith(
          status: DirectoryAddStatus.error,
          statusMessage: LocaleKeys.errors_folderAlreadyExists.lang.tr,
        ),
      );
    } else if (state.selectedFileTypeEnum == null) {
      emit(
        state.copyWith(
          popUpStatus: DirectoryAddPopUpStatus.show,
          popUpStatusMessage: LocaleKeys.directoryAdd_fileTypeNotSelected.tr(),
          status: DirectoryAddStatus.initial,
        ),
      );
      resetPopUpStatus();
    } else {
      final mutableAllDirectory =
          List<DirectoryModel>.from(response!.allDirectory);

      if (!isDuplicate(
        mutableAllDirectory,
        newDirectoryModel,
      )) {
        mutableAllDirectory.insert(0, newDirectoryModel);

        await _allDirectoryOperation.addOrUpdateItem(
          response.copyWith(
            allDirectory: mutableAllDirectory,
          ),
        );
        emit(
          state.copyWith(
            status: DirectoryAddStatus.finish,
          ),
        );
      } else {
        emit(
          state.copyWith(
            popUpStatus: DirectoryAddPopUpStatus.show,
            popUpStatusMessage:
                LocaleKeys.validate_thereIsAnotherDirectoryWithThisName.lang.tr,
            status: DirectoryAddStatus.initial,
          ),
        );
        resetPopUpStatus();
      }
    }
  }
}
