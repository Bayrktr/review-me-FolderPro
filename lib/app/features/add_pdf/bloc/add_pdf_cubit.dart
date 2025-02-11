import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_repository.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/detect_file_type/detect_file_type_manager.dart';
import 'package:DocuSort/app/product/manager/file_picker/file_picker_manager.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_pdf_cubit_mixin.dart';

class AddPdfCubit extends Cubit<AddPdfState> with _AddPdfCubitMixin {
  AddPdfCubit({required this.addPdfRepository, this.directoryModel})
      : super(
          AddPdfState(
            selectedDirectory: directoryModel,
          ),
        );

  final AddPdfRepository addPdfRepository;

  final BaseDirectoryModel? directoryModel;

  final TextEditingController _pdfNameController = TextEditingController();

  TextEditingController get pdfNameController => _pdfNameController;

  String? get fileListKey => directoryModel?.fileListKey.toString();

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    if (fileListKey == null) {
      emit(
        state.copyWith(
          status: AddPdfStatus.error,
        ),
      );
    } else {
      await addPdfRepository.start();
      emit(
        state.copyWith(
          status: AddPdfStatus.initial,
        ),
      );
    }
  }

  void updatePdfName(String? value) {
    if (value == null) return;
    _pdfNameController.text = value;
  }

  Future<void> pickPdf() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    final result = await FilePickerManager.pickFile(FileTypeEnum.pdf);
    if (result != null) {
      if (DetectFileTypeManager(filePath: result.files.first.name)
              .getFileTypeEnum !=
          FileTypeEnum.pdf) {
        emit(
          state.copyWith(
            savePdfStatus: SavePdfStatus.wrongFileType,
            status: AddPdfStatus.initial,
          ),
        );
        _resetSavePdfStatus();
      } else {
        if (pdfNameController.text == '') {
          pdfNameController.text =
              result.files.first.name.general.removeAfterDot;
        }

        emit(
          state.copyWith(
            pickFileResult: result,
            status: AddPdfStatus.initial,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          status: AddPdfStatus.initial,
        ),
      );
    }
  }

  void _resetSavePdfStatus() {
    emit(
      state.copyWith(
        savePdfStatus: SavePdfStatus.initial,
      ),
    );
  }

  Future<void> savePdfToDirectory() async {
    if (state.pickFileResult == null) {
      emit(
        state.copyWith(
          savePdfStatus: SavePdfStatus.fileError,
        ),
      );
      return;
    }

    try {
      emit(
        state.copyWith(
          status: AddPdfStatus.loading,
        ),
      );

      final newPdfModel = PdfModel(
        id: IdGenerator.randomStringId,
        name: pdfNameController.text,
        byte: state.pickFileResult?.files.first.bytes,
        fileTypeEnum: FileTypeEnum.pdf,
      );

      var allPdfModel = addPdfRepository.getAllPdfModel;

      if (allPdfModel == null) {
        await addPdfRepository.createFirstModel();
        allPdfModel = addPdfRepository.getAllPdfModel;
      }

      print('allPdfModel: $allPdfModel');

      final mutableAllPdf = List<PdfModel>.from(allPdfModel?.allFiles ?? []);

      if (!isAlreadyExist(mutableAllPdf, newPdfModel)) {
        mutableAllPdf.insert(0, newPdfModel);

        await Future.microtask(
          () => addPdfRepository.updateAllPdfModel(
            allPdfModel!.copyWith(
              allFiles: mutableAllPdf,
            ),
          ),
        );

        emit(
          state.copyWith(
            status: AddPdfStatus.initial,
            savePdfStatus: SavePdfStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AddPdfStatus.initial,
            savePdfStatus: SavePdfStatus.alreadyExist,
          ),
        );
      }
    } catch (e) {
      print('Error saving PDF: $e');
      emit(state.copyWith(status: AddPdfStatus.error));
    }

    _resetSavePdfStatus();
  }
}
