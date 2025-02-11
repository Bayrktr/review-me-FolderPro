

/*
part 'all_favorites_file_model.g.dart';

part 'all_favorites_file_model.freezed.dart';


@freezed
@HiveType(typeId: 98)
class AllFavoritesFileModel with _$AllFavoritesFileModel {
  factory AllFavoritesFileModel({
    @HiveField(0) int? id,
    @HiveField(1)
    @Default([])
    List<FavoritesFileModel?> allFavoriteFiles,
  }) = _AllFavoritesFileModel;

  factory AllFavoritesFileModel.fromJson(Map<String, dynamic> json) =>
      _$AllFavoritesFileModelFromJson(json);

  AllFavoritesFileModel._();

  AllFavoritesFileModel fromJson(Map<String, dynamic> json) =>
      AllFavoritesFileModel.fromJson(json);

  String get key {
    return id.toString();
  }
}

 */