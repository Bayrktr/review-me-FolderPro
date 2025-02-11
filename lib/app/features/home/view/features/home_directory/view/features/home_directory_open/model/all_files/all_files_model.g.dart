// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_files_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllFilesModelAdapter extends TypeAdapter<AllFilesModel> {
  @override
  final int typeId = 7;

  @override
  AllFilesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllFilesModel(
      id: fields[0] as String?,
      allFiles: (fields[1] as List).cast<BaseFileModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllFilesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.allFiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllFilesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
