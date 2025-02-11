// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_directory_open_page_layout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDirectoryOpenPageLayoutModelAdapter
    extends TypeAdapter<HomeDirectoryOpenPageLayoutModel> {
  @override
  final int typeId = 46;

  @override
  HomeDirectoryOpenPageLayoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeDirectoryOpenPageLayoutModel(
      id: fields[0] as int?,
      pageLayoutEnum: fields[1] as PageLayoutEnum,
    );
  }

  @override
  void write(BinaryWriter writer, HomeDirectoryOpenPageLayoutModel obj) {
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
      other is HomeDirectoryOpenPageLayoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeDirectoryOpenPageLayoutModelImpl
    _$$HomeDirectoryOpenPageLayoutModelImplFromJson(
            Map<String, dynamic> json) =>
        _$HomeDirectoryOpenPageLayoutModelImpl(
          id: (json['id'] as num?)?.toInt(),
          pageLayoutEnum: $enumDecodeNullable(
                  _$PageLayoutEnumEnumMap, json['pageLayoutEnum']) ??
              PageLayoutEnum.list,
        );

Map<String, dynamic> _$$HomeDirectoryOpenPageLayoutModelImplToJson(
        _$HomeDirectoryOpenPageLayoutModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageLayoutEnum': _$PageLayoutEnumEnumMap[instance.pageLayoutEnum]!,
    };

const _$PageLayoutEnumEnumMap = {
  PageLayoutEnum.list: 'list',
  PageLayoutEnum.symbol: 'symbol',
};
