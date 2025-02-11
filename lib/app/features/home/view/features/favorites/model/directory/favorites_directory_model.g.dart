// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_directory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesDirectoryModelAdapter
    extends TypeAdapter<FavoritesDirectoryModel> {
  @override
  final int typeId = 26;

  @override
  FavoritesDirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesDirectoryModel(
      id: fields[0] as int?,
      addedTime: fields[1] as DateTime?,
      directoryModel: fields[2] as BaseDirectoryModel?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesDirectoryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.addedTime)
      ..writeByte(2)
      ..write(obj.directoryModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesDirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoritesDirectoryModelImpl _$$FavoritesDirectoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoritesDirectoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      addedTime: json['addedTime'] == null
          ? null
          : DateTime.parse(json['addedTime'] as String),
      directoryModel: json['directoryModel'] == null
          ? null
          : BaseDirectoryModel.fromJson(
              json['directoryModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoritesDirectoryModelImplToJson(
        _$FavoritesDirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addedTime': instance.addedTime?.toIso8601String(),
      'directoryModel': instance.directoryModel,
    };
