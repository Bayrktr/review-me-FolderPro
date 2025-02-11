import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_directory_page_layout_model.freezed.dart';
part 'home_directory_page_layout_model.g.dart';

@freezed
@HiveType(typeId: 45)
class HomeDirectoryPageLayoutModel
    with _$HomeDirectoryPageLayoutModel, HiveModelMixin {
  factory HomeDirectoryPageLayoutModel({
    @HiveField(0) int? id,
    @HiveField(1) @Default(PageLayoutEnum.list) PageLayoutEnum pageLayoutEnum,
  }) = _HomeDirectoryPageLayoutModel;

  factory HomeDirectoryPageLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDirectoryPageLayoutModelFromJson(json);

  HomeDirectoryPageLayoutModel._();

  HomeDirectoryPageLayoutModel fromJson(Map<String, dynamic> json) =>
      HomeDirectoryPageLayoutModel.fromJson(json);

  static const String homeDirectoryLayoutKey = 'HomeDirectoryPageLayoutKey';

  static const String homeDirectoryOpenLayoutKey =
      'HomeDirectoryOpenPageLayoutKey';

  @override
  String get key {
    return homeDirectoryLayoutKey;
  }
}
