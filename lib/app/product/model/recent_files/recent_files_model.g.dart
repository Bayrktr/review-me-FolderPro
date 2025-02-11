// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_files_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentFilesModelAdapter extends TypeAdapter<RecentFilesModel> {
  @override
  final int typeId = 98;

  @override
  RecentFilesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentFilesModel(
      id: fields[0] as String?,
      allRecentFiles: (fields[1] as List).cast<BaseFileModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentFilesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.allRecentFiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentFilesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
