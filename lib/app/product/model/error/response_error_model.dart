

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_error_model.g.dart';

part 'response_error_model.freezed.dart';


@freezed
class ResponseErrorModel with _$ResponseErrorModel {
  factory ResponseErrorModel({
    String? message,
    int? statusCode,
  }) = _ResponseErrorModel;

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorModelFromJson(json);

  ResponseErrorModel._();

  ResponseErrorModel fromJson(Map<String, dynamic> json) => ResponseErrorModel.fromJson(json);
}