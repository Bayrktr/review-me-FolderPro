import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_directory_open_page_layout_model.freezed.dart';
part 'home_directory_open_page_layout_model.g.dart';

@freezed
@HiveType(typeId: 46)
class HomeDirectoryOpenPageLayoutModel
    with _$HomeDirectoryOpenPageLayoutModel, HiveModelMixin {
  factory HomeDirectoryOpenPageLayoutModel({
    @HiveField(0) int? id,
    @HiveField(1) @Default(PageLayoutEnum.list) PageLayoutEnum pageLayoutEnum,
  }) = _HomeDirectoryOpenPageLayoutModel;

  factory HomeDirectoryOpenPageLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDirectoryOpenPageLayoutModelFromJson(json);

  HomeDirectoryOpenPageLayoutModel._();

  HomeDirectoryOpenPageLayoutModel fromJson(Map<String, dynamic> json) =>
      HomeDirectoryOpenPageLayoutModel.fromJson(json);

  static const String homeDirectoryOpenLayoutKey = 'HomeDirectoryOpenPageLayoutKey';


  @override
  String get key {
    return homeDirectoryOpenLayoutKey;
  }
}
