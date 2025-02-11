// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_favorites_directory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllFavoritesDirectoryModelAdapter
    extends TypeAdapter<AllFavoritesDirectoryModel> {
  @override
  final int typeId = 67;

  @override
  AllFavoritesDirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllFavoritesDirectoryModel(
      id: fields[0] as int?,
      allFavoritesDirectory:
          (fields[1] as List).cast<FavoritesDirectoryModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllFavoritesDirectoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.allFavoritesDirectory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllFavoritesDirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllFavoritesDirectoryModelImpl _$$AllFavoritesDirectoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllFavoritesDirectoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      allFavoritesDirectory: (json['allFavoritesDirectory'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FavoritesDirectoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllFavoritesDirectoryModelImplToJson(
        _$AllFavoritesDirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allFavoritesDirectory': instance.allFavoritesDirectory,
    };
