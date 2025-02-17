// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_pdf_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublicPdfModelAdapter extends TypeAdapter<PublicPdfModel> {
  @override
  final int typeId = 100;

  @override
  PublicPdfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PublicPdfModel(
      id: fields[4] as String?,
      name: fields[0] as String?,
      fileType: fields[1] as String?,
      filePath: fields[2] as String?,
      fileKey: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PublicPdfModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.fileType)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.fileKey)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublicPdfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
