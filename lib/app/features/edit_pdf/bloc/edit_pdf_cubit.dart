import 'dart:async';

import 'package:DocuSort/app/features/edit_pdf/bloc/edit_pdf_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_files/all_files_model.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_pdf_cubit_mixin.dart';

class EditPdfCubit extends Cubit<EditPdfState> with _EditPdfCubitMixin {
  EditPdfCubit(
    this.directoryModel,
    this._pdfRepository,
    this.pdfModel,
  )   : _fileNameController = TextEditingController(
          text: pdfModel?.name ?? '',
        ),
        super(EditPdfState());

  final BaseDirectoryModel? directoryModel;

  final PdfRepository _pdfRepository;

  final PdfModel? pdfModel;

  String? get getFileListKey => directoryModel?.fileListKey;

  FileTypeEnum? get getFileTypeEnum => directoryModel?.fileTypeEnum;

  final TextEditingController _fileNameController;

  TextEditingController get fileNameController => _fileNameController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: EditPdfStatus.loading,
      ),
    );
    if (getFileListKey == null || getFileTypeEnum == null) {
      emit(
        state.copyWith(
          status: EditPdfStatus.error,
        ),
      );
    } else {
      switch (getFileTypeEnum) {
        case null:
          emit(
            state.copyWith(
              status: EditPdfStatus.error,
            ),
          );
        case FileTypeEnum.pdf:
          await _initPdfFile();
      }
    }
  }

  Future<void> _initPdfFile() async {
    await _pdfRepository.start();
    await _getPdfList();
  }

  Future<void> _getPdfList() async {
    final allPdfModel = _pdfRepository.getAllPdfModel();
    if (allPdfModel?.allFiles == null) {
      await _pdfRepository.createFirstModel();
      unawaited(_getPdfList());
    } else {
      emit(
        state.copyWith(
          allFileModel: allPdfModel,
          status: EditPdfStatus.initial,
        ),
      );

      print('data: ${state.allFileModel}');
    }
  }

  Future<void> updatePdf() async {
    emit(
      state.copyWith(
        status: EditPdfStatus.loading,
      ),
    );
    final updatedPdfModel = pdfModel!.copyWith(
      name: _fileNameController.text,
    );
    final allFilesModel = _getAllPdfModel();
    final pdfList = allFilesModel?.allFiles;
    if (pdfList == null) {
      emit(
        state.copyWith(
          status: EditPdfStatus.error,
        ),
      );
    } else {
      if (isDuplicate(pdfList, updatedPdfModel)) {
        emit(
          state.copyWith(
            status: EditPdfStatus.initial,
            savePdfStatus: SavePdfStatus.alreadyExist,
          ),
        );
      } else {
        final updatedList = <BaseFileModel?>[
          updatedPdfModel,
          ...pdfList.where((model) => model?.id != updatedPdfModel.id),
        ];
        final newPdfModel = allFilesModel!.copyWith(
          allFiles: updatedList,
        );
        await _pdfRepository.updateAllPdfModel(newPdfModel);
        emit(
          state.copyWith(
            status: EditPdfStatus.initial,
            savePdfStatus: SavePdfStatus.success,
          ),
        );
      }
      _resetSavePdfStatus();
    }
  }

  void _resetSavePdfStatus() {
    emit(
      state.copyWith(
        savePdfStatus: SavePdfStatus.initial,
      ),
    );
  }

  AllFilesModel? _getAllPdfModel() {
    return _pdfRepository.getAllPdfModel();
  }

  void updateFileName(String? value) {
    if (value == null) return;
    _fileNameController.text = value;
  }
}
