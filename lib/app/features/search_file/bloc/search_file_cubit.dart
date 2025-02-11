import 'package:DocuSort/app/features/search_file/bloc/search_file_state.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFileCubit extends Cubit<SearchFileState> {
  SearchFileCubit(this._pdfRepository, this._directoryModel)
      : super(SearchFileState());

  final PdfRepository _pdfRepository;

  final BaseDirectoryModel? _directoryModel;

  String? get fileListKey => _directoryModel?.fileListKey;

  FileTypeEnum? get fileTypeEnum => _directoryModel?.fileTypeEnum;

  final TextEditingController _searchFileController = TextEditingController();

  TextEditingController get searchFileController => _searchFileController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: SearchFileStatus.loading,
      ),
    );

    if (fileListKey == null || fileTypeEnum == null) {
      emit(
        state.copyWith(
          status: SearchFileStatus.error,
        ),
      );
    } else {
      switch (fileTypeEnum!) {
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
    final allFilesModel = _pdfRepository.getAllPdfModel();
    if (allFilesModel?.allFiles == null) {
      await _pdfRepository.createFirstModel();
      _getPdfList();
    } else {
      emit(
        state.copyWith(
          allFilesModel: allFilesModel,
          searchResultList: allFilesModel?.allFiles,
          status: SearchFileStatus.initial,
        ),
      );

      print('data: ${state.allFilesModel}');
    }
  }


  void updateSearchFileController(String? value) {
    if (value == null) return;
    _searchFileController.text = value;

    final fileListResult =
    _fileListResult(value);

    emit(
      state.copyWith(
        searchResultList: fileListResult,
      ),
    );
  }

  List<BaseFileModel?>? _fileListResult(
      String value,
      ) {
    final results = state.allFilesModel!.allFiles.where(
          (model) {
        final name = model?.name;
        if (name == null) {
          return false;
        } else {
          return name.toLowerCase().contains(
            _searchFileController.text.toLowerCase(),
          );
        }
      },
    ).toList();
    return results;
  }
}
