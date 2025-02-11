import 'package:DocuSort/app/core/model/base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_picker_response_model.freezed.dart';
part 'file_picker_response_model.g.dart';

@freezed
class FilePickerResponseModel
    with _$FilePickerResponseModel
    implements BaseModel<FilePickerResponseModel> {
  factory FilePickerResponseModel({
    String? message,
    String? pdfPath,
    String? directoryName,
    int? id,
  }) = _FilePickerResponseModel;

  factory FilePickerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilePickerResponseModelFromJson(json);

  FilePickerResponseModel._();

  @override
  FilePickerResponseModel fromJson(Map<String, dynamic> json) =>
      FilePickerResponseModel.fromJson(json);
}
