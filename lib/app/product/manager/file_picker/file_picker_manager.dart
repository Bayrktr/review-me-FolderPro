import 'dart:io';

import 'package:DocuSort/app/core/model/response_base_model.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/device_info/device_info_manager.dart';
import 'package:DocuSort/app/product/manager/device_info/platform_enum.dart';
import 'package:DocuSort/app/product/manager/file_picker/allowed_extentions.dart';
import 'package:DocuSort/app/product/manager/file_picker/model/file_picker_response_model.dart';
import 'package:DocuSort/app/product/manager/permission_handler/permission_handler_manager.dart';
import 'package:DocuSort/app/product/model/error/response_error_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerManager {
  FilePickerManager._();

  static final FilePicker _filePicker = FilePicker.platform;

  static Future<FilePickerResult?>? pickFile(
    FileTypeEnum? fileTypeEnum,
  ) async {
    final permissionStorage = await PermissionHandlerManager.isGranted(
      DeviceInfoManager.devicePlatform == PlatformEnum.IOS
          ? Permission.storage
          : Permission.mediaLibrary,
    );

    if (permissionStorage) {
      final result = _filePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          _getCorrectExtention(fileTypeEnum),
        ],
        withData: true,
      );

      print(result);
      return result;
    } else {
      await Permission.storage.request();
      print('burası tetıklendi');
      return null;
    }
  }

  static Future<ResponseBaseModel<FilePickerResponseModel>> savePdf(
    FilePickerResult? result,
    String directoryName,
  ) async {
    if (result == null) {
      print('Izın verilmemiş');
      return ResponseBaseModel(
        data: FilePickerResponseModel(
          
        ),
        error: ResponseErrorModel(
          message: 'İşlem Başarısız',
          statusCode: 500,
        ),
      );
    } else {
      final pdfFile = File(result.files.single.path!);
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final appDocumentPath = appDocumentDir.path;
      final newFile = File('$appDocumentPath/${result.files.single.name}');
      await pdfFile.copy(newFile.path);

      print('pdf dosyası kaydedildi ${newFile.path}');

      print(appDocumentPath);

      return ResponseBaseModel(
        data: FilePickerResponseModel(
          id: IdGenerator.randomIntId,
          pdfPath: newFile.path,
          directoryName: directoryName,
          message: 'İşlem Başarılı',
        ),
      );
    }
  }

  static String _getCorrectExtention(FileTypeEnum? fileTypeEnum) {
    switch (fileTypeEnum) {
      case null:
        return '';
      case FileTypeEnum.pdf:
        return AllowedExtention.pdf;
    }
  }
}
