import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'favorites_directory_model.freezed.dart';
part 'favorites_directory_model.g.dart';

@freezed
@HiveType(typeId: 26)
class FavoritesDirectoryModel with _$FavoritesDirectoryModel, HiveModelMixin {
  factory FavoritesDirectoryModel({
    @HiveField(0) int? id,
    @HiveField(1) DateTime? addedTime,
    @HiveField(2) BaseDirectoryModel? directoryModel,
  }) = _FavoritesDirectoryModel;

  factory FavoritesDirectoryModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDirectoryModelFromJson(json);

  FavoritesDirectoryModel._();

  FavoritesDirectoryModel fromJson(Map<String, dynamic> json) =>
      FavoritesDirectoryModel.fromJson(json);

  @override
  String get key {
    return id.toString();
  }
}
