import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_repository.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_state.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryOpenCubit extends Cubit<HomeDirectoryOpenState> {
  HomeDirectoryOpenCubit(
    this.fileListKey,
    this.fileTypeEnum,
    this._pdfRepository,
    this._homeDirectoryOpenRepository,
  ) : super(HomeDirectoryOpenState());

  final String? fileListKey;
  final FileTypeEnum fileTypeEnum;

  String? get getFileListKey => fileListKey;

  final PdfRepository _pdfRepository;

  final HomeDirectoryOpenRepository _homeDirectoryOpenRepository;


  Future<void> initDatabase() async {
    await _homeDirectoryOpenRepository.initDatabase();

    if (fileListKey == null) {
      emit(
        state.copyWith(
          status: HomeDirectoryOpenStatus.error,
        ),
      );
    } else {
      updateHomeOpenLayoutState(
        _homeDirectoryOpenRepository.homeDirectoryOpenPageLayoutModel!,
      );
      switch (fileTypeEnum) {
        case FileTypeEnum.pdf:
          await _initPdfFile();
      }
    }
  }


  void updateHomeOpenLayoutState(HomeDirectoryOpenPageLayoutModel layoutModel) {
    emit(
      state.copyWith(
        pageLayoutModel: layoutModel,
      ),
    );
  }

  void updateHomeOpenLayout(PageLayoutEnum? layoutEnum) {
    if (layoutEnum == null) return;
    final newPageLayoutModel = state.pageLayoutModel!.copyWith(
      pageLayoutEnum: layoutEnum,
    );
    _homeDirectoryOpenRepository.updateLayout(newPageLayoutModel);
    emit(
      state.copyWith(pageLayoutModel: newPageLayoutModel),
    );
  }

  Future<void> deleteFileList(BaseFileModel fileModel) async {
    switch (fileTypeEnum) {
      case FileTypeEnum.pdf:
        if (fileModel is! PdfModel) return;
        await deletePdfFromDirectory(fileModel);
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
          allFileModel: allFilesModel,
          status: HomeDirectoryOpenStatus.initial,
        ),
      );

      print('data: ${state.allFileModel}');
    }
  }

  Future<void> deletePdfFromDirectory(PdfModel pdfModel) async {
    final allFilesModel = state.allFileModel;

    final pdfList = allFilesModel?.allFiles;

    if (pdfList == null) return;
    final mutablePdfList = List<PdfModel>.from(pdfList)
    ..remove(pdfModel);
    final newAllPdfModel = allFilesModel!.copyWith(
      allFiles: mutablePdfList,
    );

    await _pdfRepository.deletePdfFromDirectory(newAllPdfModel);

    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.deletedSuccess,
        allFileModel: newAllPdfModel,
      ),
    );
    resetSnackBarStatus();
  }

  void resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.initial,
      ),
    );
  }
}
