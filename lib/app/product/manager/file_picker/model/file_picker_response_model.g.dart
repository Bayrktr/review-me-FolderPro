// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_picker_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilePickerResponseModelImpl _$$FilePickerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FilePickerResponseModelImpl(
      message: json['message'] as String?,
      pdfPath: json['pdfPath'] as String?,
      directoryName: json['directoryName'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FilePickerResponseModelImplToJson(
        _$FilePickerResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'pdfPath': instance.pdfPath,
      'directoryName': instance.directoryName,
      'id': instance.id,
    };
