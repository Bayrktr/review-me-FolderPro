// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseErrorModelImpl _$$ResponseErrorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseErrorModelImpl(
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResponseErrorModelImplToJson(
        _$ResponseErrorModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
