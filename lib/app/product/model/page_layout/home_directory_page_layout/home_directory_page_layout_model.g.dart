// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_directory_page_layout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDirectoryPageLayoutModelAdapter
    extends TypeAdapter<HomeDirectoryPageLayoutModel> {
  @override
  final int typeId = 45;

  @override
  HomeDirectoryPageLayoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeDirectoryPageLayoutModel(
      id: fields[0] as int?,
      pageLayoutEnum: fields[1] as PageLayoutEnum,
    );
  }

  @override
  void write(BinaryWriter writer, HomeDirectoryPageLayoutModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pageLayoutEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeDirectoryPageLayoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeDirectoryPageLayoutModelImpl _$$HomeDirectoryPageLayoutModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeDirectoryPageLayoutModelImpl(
      id: (json['id'] as num?)?.toInt(),
      pageLayoutEnum: $enumDecodeNullable(
              _$PageLayoutEnumEnumMap, json['pageLayoutEnum']) ??
          PageLayoutEnum.list,
    );

Map<String, dynamic> _$$HomeDirectoryPageLayoutModelImplToJson(
        _$HomeDirectoryPageLayoutModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageLayoutEnum': _$PageLayoutEnumEnumMap[instance.pageLayoutEnum]!,
    };

const _$PageLayoutEnumEnumMap = {
  PageLayoutEnum.list: 'list',
  PageLayoutEnum.symbol: 'symbol',
};
