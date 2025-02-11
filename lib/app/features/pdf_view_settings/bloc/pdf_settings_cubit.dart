import 'package:DocuSort/app/features/pdf_view_settings/bloc/pdf_settings_state.dart';
import 'package:DocuSort/app/product/cache/hive/operation/pdf_settings_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PdfSettingsCubit extends Cubit<PdfSettingsState> {
  PdfSettingsCubit() : super(PdfSettingsState());

  final PdfSettingsOperation _pdfSettingsOperation =
      GetItManager.getIt<PdfSettingsOperation>();

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: PdfSettingsStatus.loading,
      ),
    );

    await _pdfSettingsOperation.start(
      PdfSettingsModel.pdfSettingsModelKey,
    );

    late PdfSettingsModel pdfSettingsModel;

    if (getPdfSettingsModel == null) {
      await createFirstSettingsModel();
    } else {
      pdfSettingsModel = getPdfSettingsModel!;
    }

    emit(
      state.copyWith(
        status: PdfSettingsStatus.initial,
        pdfSettingsModel: pdfSettingsModel,
      ),
    );
  }

  Future<void> updateSwipeHorizontal() async {
    emit(
      state.copyWith(
        status: PdfSettingsStatus.loading,
      ),
    );

    final copyPdfSettingsModel = state.pdfSettingsModel!;

    final newPdfSettingsModel = copyPdfSettingsModel.copyWith(
      swipeHorizontal: !copyPdfSettingsModel.swipeHorizontal,
    );

    await _pdfSettingsOperation.addOrUpdateItem(newPdfSettingsModel);

    emit(
      state.copyWith(
        pdfSettingsModel: newPdfSettingsModel,
        status: PdfSettingsStatus.initial,
      ),
    );
  }

  PdfSettingsModel? get getPdfSettingsModel {
    return _pdfSettingsOperation.getItem(PdfSettingsModel.pdfSettingsModelKey);
  }

  Future<void> createFirstSettingsModel() async {
    await _pdfSettingsOperation.addOrUpdateItem(
      PdfSettingsModel(
        id: IdGenerator.randomIntId,
      ),
    );
  }
}
