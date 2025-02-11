// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PdfSettingsModelAdapter extends TypeAdapter<PdfSettingsModel> {
  @override
  final int typeId = 8;

  @override
  PdfSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PdfSettingsModel(
      id: fields[0] as int?,
      enableSwipe: fields[2] as bool,
      autoSpacing: fields[3] as bool,
      pageFling: fields[4] as bool,
      swipeHorizontal: fields[5] as bool,
      nightMode: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PdfSettingsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.enableSwipe)
      ..writeByte(3)
      ..write(obj.autoSpacing)
      ..writeByte(4)
      ..write(obj.pageFling)
      ..writeByte(5)
      ..write(obj.swipeHorizontal)
      ..writeByte(6)
      ..write(obj.nightMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfSettingsModelImpl _$$PdfSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PdfSettingsModelImpl(
      id: (json['id'] as num?)?.toInt(),
      enableSwipe: json['enableSwipe'] as bool? ?? true,
      autoSpacing: json['autoSpacing'] as bool? ?? true,
      pageFling: json['pageFling'] as bool? ?? false,
      swipeHorizontal: json['swipeHorizontal'] as bool? ?? true,
      nightMode: json['nightMode'] as bool? ?? false,
    );

Map<String, dynamic> _$$PdfSettingsModelImplToJson(
        _$PdfSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enableSwipe': instance.enableSwipe,
      'autoSpacing': instance.autoSpacing,
      'pageFling': instance.pageFling,
      'swipeHorizontal': instance.swipeHorizontal,
      'nightMode': instance.nightMode,
    };
