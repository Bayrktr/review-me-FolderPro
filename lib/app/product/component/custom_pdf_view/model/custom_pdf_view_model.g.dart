// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_pdf_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomPdfViewModelAdapter extends TypeAdapter<CustomPdfViewModel> {
  @override
  final int typeId = 9;

  @override
  CustomPdfViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomPdfViewModel(
      id: fields[0] as String?,
      pdfModel: fields[1] as BaseFileModel?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomPdfViewModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pdfModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomPdfViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
