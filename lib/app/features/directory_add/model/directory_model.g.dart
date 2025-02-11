// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DirectoryModelAdapter extends TypeAdapter<DirectoryModel> {
  @override
  final int typeId = 1;

  @override
  DirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DirectoryModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      fileListKey: fields[2] as String?,
      tagColor: fields[3] as Color?,
      fileTypeEnum: fields[4] as FileTypeEnum?,
    );
  }

  @override
  void write(BinaryWriter writer, DirectoryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fileListKey)
      ..writeByte(3)
      ..write(obj.tagColor)
      ..writeByte(4)
      ..write(obj.fileTypeEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
