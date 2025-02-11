// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_directory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllDirectoryModelAdapter extends TypeAdapter<AllDirectoryModel> {
  @override
  final int typeId = 0;

  @override
  AllDirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllDirectoryModel(
      id: fields[0] as int?,
      allDirectory: (fields[1] as List).cast<BaseDirectoryModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllDirectoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.allDirectory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllDirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllDirectoryModelImpl _$$AllDirectoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllDirectoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      allDirectory: (json['allDirectory'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : BaseDirectoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllDirectoryModelImplToJson(
        _$AllDirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allDirectory': instance.allDirectory,
    };
