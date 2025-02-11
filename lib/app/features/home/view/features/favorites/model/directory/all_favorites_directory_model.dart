import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'all_favorites_directory_model.freezed.dart';
part 'all_favorites_directory_model.g.dart';

@freezed
@HiveType(typeId: 67)
class AllFavoritesDirectoryModel
    with _$AllFavoritesDirectoryModel, HiveModelMixin {
  factory AllFavoritesDirectoryModel({
    @HiveField(0) int? id,
    @HiveField(1)
    @Default([])
    List<FavoritesDirectoryModel?> allFavoritesDirectory,
  }) = _AllFavoritesDirectoryModel;

  factory AllFavoritesDirectoryModel.fromJson(Map<String, dynamic> json) =>
      _$AllFavoritesDirectoryModelFromJson(json);

  AllFavoritesDirectoryModel._();

  AllFavoritesDirectoryModel fromJson(Map<String, dynamic> json) =>
      AllFavoritesDirectoryModel.fromJson(json);

  static const String allFavoritesDirectoryKey = 'allFavoritesDirectory';

  @override
  String get key {
    return allFavoritesDirectoryKey;
  }
}
